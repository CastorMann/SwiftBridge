// Deal model and operations
// Extracted from Bridge.swift

import Foundation

public struct Deal : Codable, Hashable, Equatable {
    public var north: Holding = 0
    public var east: Holding = 0
    public var south: Holding = 0
    public var west: Holding = 0
    
    public init(_ north: Holding = 0, _ east: Holding = 0, _ south: Holding = 0, _ west: Holding = 0) {
        self.north = north
        self.east = east
        self.south = south
        self.west = west
    }
    
    public func overlaps() -> Holding {
        let pairwise1 = (north & south)
        let pairwise2 = (north & east)
        let pairwise3 = (north & west)
        let pairwise4 = (south & east)
        let pairwise5 = (south & west)
        let pairwise6 = (east & west)

        return pairwise1 | pairwise2 | pairwise3 | pairwise4 | pairwise5 | pairwise6
    }
    
    public func hasError() -> Bool {
        return overlaps() != 0 ||
        north.nonzeroBitCount != 13 ||
        east.nonzeroBitCount != 13 ||
        south.nonzeroBitCount != 13 ||
        west.nonzeroBitCount != 13
    }
    
    public func remainder() -> Holding {
        return DECK ^ (north | east | south | west)
    }
    
    public func getHolding(dir: Direction) -> Holding {
        var holding: Holding = 0
        if dir & DIRECTION_NORTH != 0 {
            holding |= north
        }
        if dir & DIRECTION_EAST != 0 {
            holding |= east
        }
        if dir & DIRECTION_SOUTH != 0 {
            holding |= south
        }
        if dir & DIRECTION_WEST != 0 {
            holding |= west
        }
        return holding
    }
    
    public static func | (lhs: Deal, rhs: Deal) -> Deal {
        return Deal(lhs.north | rhs.north, lhs.east | rhs.east, lhs.south | rhs.south, lhs.west | rhs.west)
    }
    
    public static func & (lhs: Deal, rhs: Deal) -> Deal {
       return Deal(lhs.north & rhs.north, lhs.east & rhs.east, lhs.south & rhs.south, lhs.west & rhs.west)
    }
       
   public static func ^ (lhs: Deal, rhs: Deal) -> Deal {
       return Deal(lhs.north ^ rhs.north, lhs.east ^ rhs.east, lhs.south ^ rhs.south, lhs.west ^ rhs.west)
   }
   
    public static func << (lhs: Deal, rhs: UInt64) -> Deal {
       return Deal(((lhs.north & DECK) << rhs) | ((lhs.north & DECK) >> (52 - rhs)), ((lhs.east & DECK) << rhs) | ((lhs.east & DECK) >> (52 - rhs)), ((lhs.south & DECK) << rhs) | ((lhs.south & DECK) >> (52 - rhs)), ((lhs.west & DECK) << rhs) | ((lhs.west & DECK) >> (52 - rhs))) & DECK
   }
   
    public static func >> (lhs: Deal, rhs: UInt64) -> Deal {
       return lhs << (52 - rhs)
   }

    public static func | (lhs: Deal, rhs: Holding) -> Deal {
        return Deal(lhs.north | rhs, lhs.east | rhs, lhs.south | rhs, lhs.west | rhs)
    }
    
    public static func & (lhs: Deal, rhs: Holding) -> Deal {
        return Deal(lhs.north & rhs, lhs.east & rhs, lhs.south & rhs, lhs.west & rhs)
    }
    
    public static func ^ (lhs: Deal, rhs: Holding) -> Deal {
        return Deal(lhs.north ^ rhs, lhs.east ^ rhs, lhs.south ^ rhs, lhs.west ^ rhs)
    }
    
    public mutating func rotateLeft() {
        let temp = north
        north = east
        east = south
        south = west
        west = temp
    }
    
    public mutating func rotateRight() {
        let temp = north
        north = west
        west = south
        south = east
        east = temp
    }
    
    public mutating func mirrorNS() {
        let temp = north
        north = south
        south = temp
    }
    
    public mutating func mirrorEW() {
        let temp = east
        east = west
        west = temp
    }
    
    public mutating func mirrorNE() {
        let temp = north
        north = east
        east = temp
    }
    
    public mutating func mirrorNW() {
        let temp = north
        north = west
        west = temp
    }
    
    public mutating func mirrorSE() {
        let temp = south
        south = east
        east = temp
    }
    
    public mutating func mirrorSW() {
        let temp = south
        south = west
        west = temp
    }
    
    public mutating func variation() {
        var mask = (Holding(1) << 6) - 1
        var newDeal = Deal.random(predeal: self & ~mask)
        mask = ((Holding(1) << 6) - 1) << (13 * 1)
        newDeal = Deal.random(predeal: newDeal & ~mask)
        mask = ((Holding(1) << 6) - 1) << (13 * 2)
        newDeal = Deal.random(predeal: newDeal & ~mask)
        mask = ((Holding(1) << 6) - 1) << (13 * 3)
        newDeal = Deal.random(predeal: newDeal & ~mask)
        
        self.north = newDeal.north
        self.east = newDeal.east
        self.south = newDeal.south
        self.west = newDeal.west
    }
    
    public static func random() -> Deal {
        var deal: Deal = Deal()
        
        var cards: [Holding] = []
        for i in 0..<52 {
            cards.append(1 << i)
        }
        cards.shuffle()
        for i in 0..<13 {
            deal.north |= cards[i]
        }
        for i in 13..<26 {
            deal.east |= cards[i]
        }
        for i in 26..<39 {
            deal.south |= cards[i]
        }
        for i in 39..<52 {
            deal.west |= cards[i]
        }
        
        return deal
    }
    
    public static func random(predeal: Deal) -> Deal {
        var deal = predeal
        let dealt = deal.north | deal.east | deal.south | deal.west
        var cards: [Holding] = []
        for i in 0..<52 {
            cards.append(1 << i)
        }
        cards.shuffle()
        
        while !cards.isEmpty {
            guard let card = cards.popLast() else { return deal }
            if card & dealt != 0 {
                continue
            }
            switch true {
            case deal.north.nonzeroBitCount < 13:
                deal.north |= card
                continue
            case deal.east.nonzeroBitCount < 13:
                deal.east |= card
                continue
            case deal.south.nonzeroBitCount < 13:
                deal.south |= card
                continue
            case deal.west.nonzeroBitCount < 13:
                deal.west |= card
                continue
            default:
                return deal
            }
        }
        
        return deal
    }
    
    public func getPrintableString() -> String {
        return """
        \(north.spades().toPBN(includeDots: false))
        \(north.hearts().toPBN(includeDots: false))
        \(north.diamonds().toPBN(includeDots: false))
        \(north.clubs().toPBN(includeDots: false))
\(west.spades().toPBN(includeDots: false))              \(east.spades().toPBN(includeDots: false))
\(west.hearts().toPBN(includeDots: false))              \(east.hearts().toPBN(includeDots: false))
\(west.diamonds().toPBN(includeDots: false))                \(east.diamonds().toPBN(includeDots: false))
\(west.clubs().toPBN(includeDots: false))               \(east.clubs().toPBN(includeDots: false))
        \(south.spades().toPBN(includeDots: false))
        \(south.hearts().toPBN(includeDots: false))
        \(south.diamonds().toPBN(includeDots: false))
        \(south.clubs().toPBN(includeDots: false))
"""
    }
}

public extension Deal {
    static func parse(pbn: String, format: String = "N") -> Deal {
        let parts = pbn.split(separator: " ", maxSplits: 3, omittingEmptySubsequences: true)
        var deal: Deal = Deal(0, 0, 0, 0)
        
        let offset = format == "N" ? 0 : format == "E" ? 1 : format == "S" ? 2 : 3
        
        deal.north = StringToHolding(pbn: String(parts[(0 - offset + 4) % 4]))
        deal.east = StringToHolding(pbn: String(parts[(1 - offset + 4) % 4]))
        deal.south = StringToHolding(pbn: String(parts[(2 - offset + 4) % 4]))
        deal.west = StringToHolding(pbn: String(parts[(3 - offset + 4) % 4]))

        return deal
    }
    
    func toPBN() -> String {
        var sb = ""
        
        sb += north.toPBN()
        sb += " "
        sb += east.toPBN()
        sb += " "
        sb += south.toPBN()
        sb += " "
        sb += west.toPBN()
        
        return sb
    }
    
    func toDUP() -> String {
        var sb = ""
        for i in 0..<52 {
            let card = Holding(1) << (51 - i)
            if self.north & card == card {
                sb += String(format: "%02d", i + 1)
            }
        }
        for i in 0..<52 {
            let card = Holding(1) << (51 - i)
            if self.east & card == card {
                sb += String(format: "%02d", i + 1)
            }
        }
        for i in 0..<52 {
            let card = Holding(1) << (51 - i)
            if self.south & card == card {
                sb += String(format: "%02d", i + 1)
            }
        }
        
        sb += String(Character(UnicodeScalar(6)))
        sb += self.north.spades().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(3)))
        sb += self.north.hearts().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(4)))
        sb += self.north.diamonds().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(5)))
        sb += self.north.clubs().toPBN(includeDots: false)
        
        sb += String(Character(UnicodeScalar(6)))
        sb += self.east.spades().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(3)))
        sb += self.east.hearts().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(4)))
        sb += self.east.diamonds().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(5)))
        sb += self.east.clubs().toPBN(includeDots: false)
        
        sb += String(Character(UnicodeScalar(6)))
        sb += self.south.spades().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(3)))
        sb += self.south.hearts().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(4)))
        sb += self.south.diamonds().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(5)))
        sb += self.south.clubs().toPBN(includeDots: false)
        
        sb += String(Character(UnicodeScalar(6)))
        sb += self.west.spades().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(3)))
        sb += self.west.hearts().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(4)))
        sb += self.west.diamonds().toPBN(includeDots: false)
        sb += String(Character(UnicodeScalar(5)))
        sb += self.west.clubs().toPBN(includeDots: false)
        
        return sb
    }
    
    func toBytes() -> [UInt8] {
        var bytes: [UInt8] = []
        for i in 0..<8 {
            bytes.append(UInt8((self.north >> (8 * i)) & 0xFF))
        }
        for i in 0..<8 {
            bytes.append(UInt8((self.east >> (8 * i)) & 0xFF))
        }
        for i in 0..<8 {
            bytes.append(UInt8((self.south >> (8 * i)) & 0xFF))
        }
        for i in 0..<8 {
            bytes.append(UInt8((self.west >> (8 * i)) & 0xFF))
        }
        return bytes
    }
    
    enum ConversionError: Error {
        case invalidByteCount
    }
    
    static func from(bytes: [UInt8]) throws -> Deal {
        if bytes.count != 32 {
            throw ConversionError.invalidByteCount
        }
        
        var north: Holding = 0
        for i in 0..<8 {
            north |= Holding(bytes[i]) << (i * 8)
        }
        
        var east: Holding = 0
        for i in 8..<16 {
            east |= Holding(bytes[i]) << ((i-8) * 8)
        }
        
        var south: Holding = 0
        for i in 16..<24 {
            south |= Holding(bytes[i]) << ((i-16) * 8)
        }
        
        var west: Holding = 0
        for i in 24..<32 {
            west |= Holding(bytes[i]) << ((i-24) * 8)
        }
        
        return Deal(north, east, south, west)
    }
    
    static func solve() {
        
    }
    
}
