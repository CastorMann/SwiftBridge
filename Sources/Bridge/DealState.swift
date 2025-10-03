// DealState and ExtendedDealState with serialization
// Extracted from Bridge.swift

import Foundation

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
