// DealState and ExtendedDealState with serialization
// Extracted from Bridge.swift

import Foundation

public struct Trick {
    public struct Card {
        public let card: Holding
        public let direction: Direction
        public let order: Int
        
        public init(card: Holding, direction: Direction, order: Int) {
            self.card = card
            self.direction = direction
            self.order = order
        }
    }
    public let north: Trick.Card?
    public let east: Trick.Card?
    public let south: Trick.Card?
    public let west: Trick.Card?
    
    public init(north: Trick.Card?, east: Trick.Card?, south: Trick.Card?, west: Trick.Card?) {
        self.north = north
        self.east = east
        self.south = south
        self.west = west
    }
    
    public func isCompelte() -> Bool {
        return north != nil && east != nil && south != nil && west != nil
    }
    
    public func toCardList() -> [Trick.Card] {
        // Collect non-nil cards
        var cards: [Trick.Card] = []
        if let n = north { cards.append(n) }
        if let e = east { cards.append(e) }
        if let s = south { cards.append(s) }
        if let w = west { cards.append(w) }
        
        // Sort by the order property (expected 0-3)
        cards.sort { $0.order < $1.order }
        return cards
    }
    
    public func evaluateTrick(trump: Strain? = nil) -> Trick.Card? {
        // Determine the winner of the trick.
        // If no cards have been played, return nil.
        let cards = toCardList()
        guard let first = cards.first else { return nil }

        // Helpers to map a Card (0..51) to suit (0..3) and rank (0..12)
        func suitIndex(of card: Holding) -> Int { Int(card.trailingZeroBitCount) / 13 }
        func rankIndex(of card: Holding) -> Int { Int(card.trailingZeroBitCount) % 13 }

        // Determine lead suit from the first card played
        let leadSuit = suitIndex(of: first.card)

        // Determine trump suit index if any (nil for NT or no trump provided)
        let trumpSuitIndex: Int? = {
            guard let t = trump else { return nil }
            if t == STRAIN_CLUB { return 0 }
            if t == STRAIN_DIAMOND { return 1 }
            if t == STRAIN_HEART { return 2 }
            if t == STRAIN_SPADE { return 3 }
            return nil // NT
        }()

        // First, try to find the highest trump if a trump suit exists and any trump was played.
        if let tsi = trumpSuitIndex {
            var winningTrump: Trick.Card? = nil
            for c in cards {
                if suitIndex(of: c.card) == tsi {
                    if let w = winningTrump {
                        if rankIndex(of: c.card) > rankIndex(of: w.card) {
                            winningTrump = c
                        }
                    } else {
                        winningTrump = c
                    }
                }
            }
            if let winner = winningTrump { return winner }
        }

        // Otherwise, the highest card in the lead suit wins.
        var winning = first
        for c in cards.dropFirst() {
            if suitIndex(of: c.card) == leadSuit {
                if rankIndex(of: c.card) > rankIndex(of: winning.card) {
                    winning = c
                }
            }
        }
        return winning
    }
}

public struct DealState : Codable, Hashable {
    public var dealNumber: UInt8
    public var deal: Deal
    public var play: [Card]
    public var bidding: [Bid]
    
    public init(dealNumber: UInt8 = 1, deal: Deal = Deal(), play: [Card] = [], bidding: [Bid] = []) {
        self.dealNumber = dealNumber
        self.deal = deal
        self.play = play
        self.bidding = bidding
    }
}

@available(iOS 16.0, *)
public struct ExtendedDealState : Codable, Hashable {
    public var state: DealState
    public var meta: Dictionary<String, String>
    
    public init(state: DealState = DealState(), meta: Dictionary<String, String> = [:]) {
        self.state = state
        self.meta = meta
    }
}

public extension DealState {
    func toBytes() -> [UInt8] {
        var bytes: [UInt8] = []
        
        bytes.append(self.dealNumber)
        for byte in self.deal.toBytes() {
            bytes.append(byte)
        }
        for bid in self.bidding {
            bytes.append(bid)
        }
        bytes.append(0xFF)
        for card in self.play {
            bytes.append(card)
        }
        bytes.append(0xFF)
        
        return bytes
    }
    
    func getFinalContract() -> Contract? {
        return bidding.getFinalContract(dealer: dealer)
    }
    
    var dealer: Direction {
        return DIRECTION_NORTH << ((dealNumber - 1) % 4)
    }
    
    func remainingCards() -> Deal {
        let numTricks = play.count / 4
        let played: [Card] = play
        let totalPlay = played.reduce(Holding(0)) { a, b in a | b.cardToHolding() }
        let currentPlay = totalPlay
        return deal & ~currentPlay
    }
    
    func finalContract() -> Contract? {
        return bidding.getFinalContract(dealer: Direction(1) << ((dealNumber - 1) % 4))
    }
    
    func getTrickList() -> [Trick] {
        // Build trick list based on current play and bidding/contract
        guard let contract = finalContract() else { return [] }

        // Helper functions
        func next(_ dir: Direction) -> Direction {
            if dir == DIRECTION_WEST { return DIRECTION_NORTH }
            return dir << 1
        }
        func rotate(_ dir: Direction, by steps: Int) -> Direction {
            var d = dir
            var s = steps % 4
            while s > 0 {
                d = next(d)
                s -= 1
            }
            return d
        }
        func suitIndex(of card: Card) -> Int { Int(card) / 13 }
        func rankIndex(of card: Card) -> Int { Int(card) % 13 }
        func trumpSuitIndex(_ strain: Strain) -> Int? {
            if strain == STRAIN_CLUB { return 0 }
            if strain == STRAIN_DIAMOND { return 1 }
            if strain == STRAIN_HEART { return 2 }
            if strain == STRAIN_SPADE { return 3 }
            return nil // NT
        }

        let trump = contract.bid.strain()
        let trumpIndex = trumpSuitIndex(trump)

        var tricks: [Trick] = []
        var leader = contract.leader
        var i = 0

        while i < play.count {
            // Construct up to 4 cards for this trick
            var north: Trick.Card? = nil
            var east: Trick.Card? = nil
            var south: Trick.Card? = nil
            var west: Trick.Card? = nil

            let cardsInThisTrick = min(4, play.count - i)
            for j in 0..<cardsInThisTrick {
                let c = play[i + j]
                let dir = rotate(leader, by: j)
                let tcard = Trick.Card(card: c.cardToHolding(), direction: dir, order: j)
                if dir == DIRECTION_NORTH { north = tcard }
                else if dir == DIRECTION_EAST { east = tcard }
                else if dir == DIRECTION_SOUTH { south = tcard }
                else if dir == DIRECTION_WEST { west = tcard }
            }

            let trick = Trick(north: north, east: east, south: south, west: west)
            tricks.append(trick)

            // If trick is complete, determine winner using Trick.evaluateTrick
            if cardsInThisTrick == 4 {
                if let winning = trick.evaluateTrick(trump: trump) {
                    leader = winning.direction
                }
            }

            i += cardsInThisTrick
        }

        return tricks
    }
    
    func getCurrentIncompleteTrick() -> Trick? {
        let tricks = getTrickList()
        guard let current = tricks.last(where: { !$0.isCompelte() }) else { return nil }
        return current
    }
    
    func getCurrentTrick() -> Trick? {
        let tricks = getTrickList()
        guard let current = tricks.last else { return nil }
        return current
    }
    
    func getLastCompleteTrick() -> Trick? {
        let tricks = getTrickList()
        guard let lastComplete = tricks.last(where: { $0.isCompelte() }) else { return nil }
        return lastComplete
    }
    
    func getTrickCount() -> (Int, Int) {
        // Count completed tricks using the built trick list and trick evaluation
        guard let contract = finalContract() else { return (0, 0) }
        let trump = contract.bid.strain()

        var nsTricks = 0
        var ewTricks = 0

        let tricks = getTrickList()
        for trick in tricks {
            // Only count fully completed tricks
            guard trick.isCompelte(), let winner = trick.evaluateTrick(trump: trump) else { continue }
            let dir = winner.direction
            if dir == DIRECTION_NORTH || dir == DIRECTION_SOUTH {
                nsTricks += 1
            } else {
                ewTricks += 1
            }
        }
        return (nsTricks, ewTricks)
    }
    
    func getPlayerOnLead() -> Direction? {
        // If no contract, cannot determine leader
        guard let contract = finalContract() else { return nil }

        // If nothing has been played yet, contract leader leads
        if play.isEmpty { return contract.leader }

        let trump = contract.bid.strain()
        
        if let lastComplete = getLastCompleteTrick() {
            return lastComplete.evaluateTrick(trump: trump)?.direction
        }

        // Fallback to contract leader
        return contract.leader
    }
    
    
}

public extension [DealState] {
    func exportToFile(at url: URL) throws {
        let bytes = toBytes()
        let data = Data(bytes)
        do {
            try data.write(to: url)
        } catch {
            throw error
        }
    }
    
    static func importFromFile(at url: URL) throws -> [DealState] {
        do {
            let data = try Data(contentsOf: url)
            let bytes = [UInt8](data)
            return try from(bytes: bytes)
        } catch {
            throw error
        }
    }
    
    func toBytes() -> [UInt8] {
        var bytes: [UInt8] = []
        
        for state in self {
            for byte in state.toBytes() {
                bytes.append(byte)
            }
        }
        
        return bytes
    }
    
    static func from(bytes: [UInt8]) throws -> [DealState] {
        var states: [DealState] = []
        
        var readPointer = 0
        let readEnd = bytes.count
        while readPointer + 33 < readEnd {
            do {
                // read deal number
                let dealNumber: UInt8 = bytes[readPointer]
                readPointer += 1
                
                // read deal
                let deal: Deal = try Deal.from(bytes: Array<UInt8>(bytes[readPointer..<readPointer+32]))
                readPointer += 32
                
                // read bidding
                var bidding: Bidding = []
                while readPointer < readEnd && bytes[readPointer] != 0xFF {
                    bidding.append(bytes[readPointer])
                    readPointer += 1
                }
                readPointer += 1
                
                // read play
                var play: [Card] = []
                while readPointer < readEnd && bytes[readPointer] != 0xFF {
                    play.append(bytes[readPointer])
                    readPointer += 1
                }
                readPointer += 1
                
                states.append(DealState(dealNumber: dealNumber, deal: deal, play: play, bidding: bidding))
            }
            catch {
                throw error
            }
        }
        
        return states
    }
}

@available(iOS 16.0, *)
public extension ExtendedDealState {
    @available(macOS 13.0, *)
    static func parseLIN(_ lin: String) -> ExtendedDealState {
        var edx: ExtendedDealState = .init()
        
        if let match = lin.firstMatch(of: #/pn\|([^\|,]*),([^\|,]*),([^\|,]*),([^\|,]*)\|/#) {
            edx.meta["PlayerSouth"] = String(match.output.1)
            edx.meta["PlayerWest"] = String(match.output.2)
            edx.meta["PlayerNorth"] = String(match.output.3)
            edx.meta["PlayerEast"] = String(match.output.4)
        }
        
        if let match = lin.firstMatch(of: #/md\|[1-4]S([2-9TJQKA]*)H([2-9TJQKA]*)D([2-9TJQKA]*)C([2-9TJQKA]*),S([2-9TJQKA]*)H([2-9TJQKA]*)D([2-9TJQKA]*)C([2-9TJQKA]*),S([2-9TJQKA]*)H([2-9TJQKA]*)D([2-9TJQKA]*)C([2-9TJQKA]*),S([2-9TJQKA]*)H([2-9TJQKA]*)D([2-9TJQKA]*)C([2-9TJQKA]*)\|/#) {
            edx.state.deal = Deal.parse(pbn: "\(match.output.9).\(match.output.10).\(match.output.11).\(match.output.12) \(match.output.13).\(match.output.14).\(match.output.15).\(match.output.16) \(match.output.1).\(match.output.2).\(match.output.3).\(match.output.4) \(match.output.5).\(match.output.6).\(match.output.7).\(match.output.8)")
        }
        
        if let match = lin.firstMatch(of: #/ah\|Board (\d+)\|/#) {
            edx.state.dealNumber = UInt8(Int(match.output.1) ?? 0)
        }
        
        for match in lin.matches(of: #/pc\|([SHDC])([2-9TJQKA])\|/#) {
            let card: Card = Card(Holding.fromShortString("\(match.output.2)\(match.output.1)").trailingZeroBitCount)
            edx.state.play.append(card)
        }
        
        for match in lin.matches(of: #/mb\|([1-7][SHDCN]|[pPdDrR])!?\|/#) {
            let bid = Bid.fromShortString(s: String(match.output.1))
            edx.state.bidding.append(bid)
        }
        
        return edx
    }
    
    func toBytes() -> [UInt8] {
        var bytes: [UInt8] = []
        
        for byte in self.state.toBytes() {
            bytes.append(byte)
        }
        
        do {
            // Encode the dictionary to a binary property list format
            let plistData: Data = try PropertyListSerialization.data(fromPropertyList: self.meta, format: .binary, options: 0)
            let plistBytes: [UInt8] = [UInt8](plistData)
            var count: Int32 = Int32(plistBytes.count)
            for byte in [UInt8](Data(bytes: &count, count: MemoryLayout<Int32>.size)) {
                bytes.append(byte)
            }
            for byte in plistBytes {
                bytes.append(byte)
            }
        } catch {
            print("Error converting dictionary to binary plist: \(error.localizedDescription)")
            
        }
        
        return bytes
    }
}

@available(iOS 16.0, *)
public extension [ExtendedDealState] {
    func exportToFile(at url: URL) throws {
        let bytes = toBytes()
        let data = Data(bytes)
        do {
            try data.write(to: url)
        } catch {
            throw error
        }
    }
    
    static func importFromFile(at url: URL) throws -> [ExtendedDealState] {
        do {
            let data = try Data(contentsOf: url)
            let bytes = [UInt8](data)
            return try from(bytes: bytes)
        } catch {
            throw error
        }
    }
    
    func toBytes() -> [UInt8] {
        var bytes: [UInt8] = []
        
        for estate in self {
            for byte in estate.toBytes() {
                bytes.append(byte)
            }
        }
        
        return bytes
    }
    
    func toPBN() -> String {
        var pbnString = ""
        
        for (idx, estate) in enumerated() {
            let board = "[Board \"\(estate.state.dealNumber)\"]\n"
            let pbn = "[Deal \"N:\(estate.state.deal.toPBN())\"]\n"
            let auction = "[Auction \"\(estate.state.dealer.directionToShortString())\"]\n"
            let play = "[Play \"\(estate.state.bidding.getFinalContract()?.leader.directionToShortString() ?? "N/A")\"]\n"
            
            pbnString += board
            pbnString += pbn
            pbnString += auction
            
            var bc = 0
            for b in estate.state.bidding {
                pbnString += "\(b.bidToShortString())"
                bc += 1
                if bc % 4 == 0 {
                    pbnString += "\n"
                } else if bc != estate.state.bidding.count {
                    pbnString += " "
                }
            }
            if bc % 4 != 0 {
                pbnString += "\n"
            }
            
            if estate.state.bidding.getFinalContract() != nil {
                pbnString += play
                
                var cc = 0
                for c in estate.state.play {
                    pbnString += c.cardToShortString()
                    cc += 1
                    if cc % 4 == 0 {
                        pbnString += "\n"
                    } else if cc != estate.state.play.count {
                        pbnString += " "
                    }
                }
                if cc % 4 != 0 {
                    pbnString += "\n"
                }
            }
            
            if idx != count - 1 {
                pbnString += "\n"
            }
        }
        
        return pbnString
    }
    
    func toLIN() -> String {
        var linString = ""
        
        for (idx, estate) in enumerated() {
            let d = estate.state.deal
            let dn = Int(estate.state.dealNumber)
            
            let ss = d.south.spades().toPBN(includeDots: false)
            let sh = d.south.hearts().toPBN(includeDots: false)
            let sc = d.south.clubs().toPBN(includeDots: false)
            let sd = d.south.diamonds().toPBN(includeDots: false)
            
            let ws = d.west.spades().toPBN(includeDots: false)
            let wh = d.west.hearts().toPBN(includeDots: false)
            let wc = d.west.clubs().toPBN(includeDots: false)
            let wd = d.west.diamonds().toPBN(includeDots: false)
            
            let ns = d.north.spades().toPBN(includeDots: false)
            let nh = d.north.hearts().toPBN(includeDots: false)
            let nc = d.north.clubs().toPBN(includeDots: false)
            let nd = d.north.diamonds().toPBN(includeDots: false)
            
            let v = vulnerability(dn)
            var vstring = "0"
            switch v {
            case DIRECTION_ALL: vstring = "b"
            case DIRECTION_NORTH_SOUTH: vstring = "n"
            case DIRECTION_EAST_WEST: vstring = "e"
            default: break
            }
            
            let lin = "qx|o\(dn)|md|\((dn + 1) % 4 + 1)S\(ss)H\(sh)D\(sd)C\(sc),S\(ws)H\(wh)D\(wd)C\(wc),S\(ns)H\(nh)D\(nd)C\(nc)|ah|Board \(dn)|sv|\(vstring)|"
            linString += lin
            if idx != count - 1 {
                linString += "\n"
            }
        }
        
        return linString
    }
    
    static func from(bytes: [UInt8]) throws -> [ExtendedDealState] {
        var estates: [ExtendedDealState] = []
        
        var readPointer = 0
        let readEnd = bytes.count
        
        while readPointer + 39 < readEnd {
            do {
                // read deal number
                let dealNumber: UInt8 = bytes[readPointer]
                readPointer += 1
                
                // read deal
                let deal: Deal = try Deal.from(bytes: Array<UInt8>(bytes[readPointer..<readPointer+32]))
                readPointer += 32
                
                // read bidding
                var bidding: Bidding = []
                while readPointer < readEnd && bytes[readPointer] != 0xFF {
                    bidding.append(bytes[readPointer])
                    readPointer += 1
                }
                readPointer += 1
                
                // read play
                var play: [Card] = []
                while readPointer < readEnd && bytes[readPointer] != 0xFF {
                    play.append(bytes[readPointer])
                    readPointer += 1
                }
                readPointer += 1
                
                let state = DealState(dealNumber: dealNumber, deal: deal, play: play, bidding: bidding)
                
                let count: Int = Int(Data(bytes[readPointer..<readPointer+MemoryLayout<Int32>.size]).withUnsafeBytes { $0.load(as: Int32.self) })
                readPointer += MemoryLayout<Int32>.size
                let data = Data(bytes[readPointer..<readPointer+count])
                readPointer += count
                var meta: Dictionary<String, String> = [:]
                do {
                    if let dictionary = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: String] {
                        meta = dictionary
                    } else {
                        print("Error: Data is not a valid [String: String] dictionary.")
                    }
                } catch {
                    print("Error converting binary plist to dictionary: \(error.localizedDescription)")
                }
                let estate = ExtendedDealState(state: state, meta: meta)
                estates.append(estate)
            }
            catch {
                throw error
            }
        }
        
        return estates
    }
}
