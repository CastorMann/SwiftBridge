// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
public let ranks: [String] = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
public let strains: [String] = ["C", "D", "H", "S", "N"]

public typealias Holding = UInt64
public let DECK: Holding = 4503599627370495
public let CLUBS: Holding = 8191
public let DIAMONDS: Holding = 67100672
public let HEARTS: Holding = 549688705024
public let SPADES: Holding = 4503049871556608
public let ACES: Holding = 2252074725150720
public let KINGS: Holding = 1126037362575360
public let QUEENS: Holding = 563018681287680
public let JACKS: Holding = 281509340643840

public let HOLDING_TWO_OF_CLUBS:    Holding = 1 << 0
public let HOLDING_THREE_OF_CLUBS:  Holding = 1 << 1
public let HOLDING_FOUR_OF_CLUBS:   Holding = 1 << 2
public let HOLDING_FIVE_OF_CLUBS:   Holding = 1 << 3
public let HOLDING_SIX_OF_CLUBS:    Holding = 1 << 4
public let HOLDING_SEVEN_OF_CLUBS:  Holding = 1 << 5
public let HOLDING_EIGHT_OF_CLUBS:  Holding = 1 << 6
public let HOLDING_NINE_OF_CLUBS:   Holding = 1 << 7
public let HOLDING_TEN_OF_CLUBS:    Holding = 1 << 8
public let HOLDING_JACK_OF_CLUBS:   Holding = 1 << 9
public let HOLDING_QUEEN_OF_CLUBS:  Holding = 1 << 10
public let HOLDING_KING_OF_CLUBS:   Holding = 1 << 11
public let HOLDING_ACE_OF_CLUBS:    Holding = 1 << 12

public let HOLDING_TWO_OF_DIAMONDS:    Holding = 1 << 13
public let HOLDING_THREE_OF_DIAMONDS:  Holding = 1 << 14
public let HOLDING_FOUR_OF_DIAMONDS:   Holding = 1 << 15
public let HOLDING_FIVE_OF_DIAMONDS:   Holding = 1 << 16
public let HOLDING_SIX_OF_DIAMONDS:    Holding = 1 << 17
public let HOLDING_SEVEN_OF_DIAMONDS:  Holding = 1 << 18
public let HOLDING_EIGHT_OF_DIAMONDS:  Holding = 1 << 19
public let HOLDING_NINE_OF_DIAMONDS:   Holding = 1 << 20
public let HOLDING_TEN_OF_DIAMONDS:    Holding = 1 << 21
public let HOLDING_JACK_OF_DIAMONDS:   Holding = 1 << 22
public let HOLDING_QUEEN_OF_DIAMONDS:  Holding = 1 << 23
public let HOLDING_KING_OF_DIAMONDS:   Holding = 1 << 24
public let HOLDING_ACE_OF_DIAMONDS:    Holding = 1 << 25

public let HOLDING_TWO_OF_HEARTS:    Holding = 1 << 26
public let HOLDING_THREE_OF_HEARTS:  Holding = 1 << 27
public let HOLDING_FOUR_OF_HEARTS:   Holding = 1 << 28
public let HOLDING_FIVE_OF_HEARTS:   Holding = 1 << 29
public let HOLDING_SIX_OF_HEARTS:    Holding = 1 << 30
public let HOLDING_SEVEN_OF_HEARTS:  Holding = 1 << 31
public let HOLDING_EIGHT_OF_HEARTS:  Holding = 1 << 32
public let HOLDING_NINE_OF_HEARTS:   Holding = 1 << 33
public let HOLDING_TEN_OF_HEARTS:    Holding = 1 << 34
public let HOLDING_JACK_OF_HEARTS:   Holding = 1 << 35
public let HOLDING_QUEEN_OF_HEARTS:  Holding = 1 << 36
public let HOLDING_KING_OF_HEARTS:   Holding = 1 << 37
public let HOLDING_ACE_OF_HEARTS:    Holding = 1 << 38

public let HOLDING_TWO_OF_SPADES:    Holding = 1 << 39
public let HOLDING_THREE_OF_SPADES:  Holding = 1 << 40
public let HOLDING_FOUR_OF_SPADES:   Holding = 1 << 41
public let HOLDING_FIVE_OF_SPADES:   Holding = 1 << 42
public let HOLDING_SIX_OF_SPADES:    Holding = 1 << 43
public let HOLDING_SEVEN_OF_SPADES:  Holding = 1 << 44
public let HOLDING_EIGHT_OF_SPADES:  Holding = 1 << 45
public let HOLDING_NINE_OF_SPADES:   Holding = 1 << 46
public let HOLDING_TEN_OF_SPADES:    Holding = 1 << 47
public let HOLDING_JACK_OF_SPADES:   Holding = 1 << 48
public let HOLDING_QUEEN_OF_SPADES:  Holding = 1 << 49
public let HOLDING_KING_OF_SPADES:   Holding = 1 << 50
public let HOLDING_ACE_OF_SPADES:    Holding = 1 << 51



public typealias Strain = UInt8
public let STRAIN_CLUB: Strain = 1
public let STRAIN_DIAMOND: Strain = 2
public let STRAIN_HEART: Strain = 4
public let STRAIN_SPADE: Strain = 8
public let STRAIN_NT: Strain = 16
public let STRAIN_MINORS: Strain = 3
public let STRAIN_MAJORS: Strain = 12
public let STRAIN_SOFT: Strain = 5
public let STRAIN_HARD: Strain = 10
public let STRAIN_RED: Strain = 6
public let STRAIN_BLACK: Strain = 9
public let STRAIN_ALL: Strain = 31
public let STRAIN_NONE: Strain = 0

public typealias Bid = UInt8
public let BID_NONE: Bid = 0
public let BID_PASS: Bid = 1
public let BID_DOUBLE: Bid = 2
public let BID_REDOUBLE: Bid = 4
public let BID_1_CLUBS: Bid = 33        // level << 5 + suit
public let BID_2_CLUBS: Bid = 65
public let BID_3_CLUBS: Bid = 97
public let BID_4_CLUBS: Bid = 129
public let BID_5_CLUBS: Bid = 161
public let BID_6_CLUBS: Bid = 193
public let BID_7_CLUBS: Bid = 225
public let BID_1_DIAMONDS: Bid = 34
public let BID_2_DIAMONDS: Bid = 66
public let BID_3_DIAMONDS: Bid = 98
public let BID_4_DIAMONDS: Bid = 130
public let BID_5_DIAMONDS: Bid = 162
public let BID_6_DIAMONDS: Bid = 194
public let BID_7_DIAMONDS: Bid = 226
public let BID_1_HEARTS: Bid = 36
public let BID_2_HEARTS: Bid = 68
public let BID_3_HEARTS: Bid = 100
public let BID_4_HEARTS: Bid = 132
public let BID_5_HEARTS: Bid = 164
public let BID_6_HEARTS: Bid = 196
public let BID_7_HEARTS: Bid = 228
public let BID_1_SPADES: Bid = 40
public let BID_2_SPADES: Bid = 72
public let BID_3_SPADES: Bid = 104
public let BID_4_SPADES: Bid = 136
public let BID_5_SPADES: Bid = 168
public let BID_6_SPADES: Bid = 200
public let BID_7_SPADES: Bid = 232
public let BID_1_NT: Bid = 48
public let BID_2_NT: Bid = 80
public let BID_3_NT: Bid = 112
public let BID_4_NT: Bid = 144
public let BID_5_NT: Bid = 176
public let BID_6_NT: Bid = 208
public let BID_7_NT: Bid = 240
public let BIDS_ALL: Bidding = [
    BID_PASS, BID_DOUBLE, BID_REDOUBLE,
    BID_1_CLUBS, BID_1_DIAMONDS, BID_1_HEARTS, BID_1_SPADES, BID_1_NT,
    BID_2_CLUBS, BID_2_DIAMONDS, BID_2_HEARTS, BID_2_SPADES, BID_2_NT,
    BID_3_CLUBS, BID_3_DIAMONDS, BID_3_HEARTS, BID_3_SPADES, BID_3_NT,
    BID_4_CLUBS, BID_4_DIAMONDS, BID_4_HEARTS, BID_4_SPADES, BID_4_NT,
    BID_5_CLUBS, BID_5_DIAMONDS, BID_5_HEARTS, BID_5_SPADES, BID_5_NT,
    BID_6_CLUBS, BID_6_DIAMONDS, BID_6_HEARTS, BID_6_SPADES, BID_6_NT,
    BID_7_CLUBS, BID_7_DIAMONDS, BID_7_HEARTS, BID_7_SPADES, BID_7_NT
]
public let BIDS_LEVEL_1: Bidding = [BID_1_CLUBS, BID_1_DIAMONDS, BID_1_HEARTS, BID_1_SPADES, BID_1_NT]
public let BIDS_LEVEL_2: Bidding = [BID_2_CLUBS, BID_2_DIAMONDS, BID_2_HEARTS, BID_2_SPADES, BID_2_NT]
public let BIDS_LEVEL_3: Bidding = [BID_3_CLUBS, BID_3_DIAMONDS, BID_3_HEARTS, BID_3_SPADES, BID_3_NT]
public let BIDS_LEVEL_4: Bidding = [BID_4_CLUBS, BID_4_DIAMONDS, BID_4_HEARTS, BID_4_SPADES, BID_4_NT]
public let BIDS_LEVEL_5: Bidding = [BID_5_CLUBS, BID_5_DIAMONDS, BID_5_HEARTS, BID_5_SPADES, BID_5_NT]
public let BIDS_LEVEL_6: Bidding = [BID_6_CLUBS, BID_6_DIAMONDS, BID_6_HEARTS, BID_6_SPADES, BID_6_NT]
public let BIDS_LEVEL_7: Bidding = [BID_7_CLUBS, BID_7_DIAMONDS, BID_7_HEARTS, BID_7_SPADES, BID_7_NT]

public typealias Direction = UInt8
public let DIRECTION_NORTH: Direction = 1
public let DIRECTION_EAST: Direction = 2
public let DIRECTION_SOUTH: Direction = 4
public let DIRECTION_WEST: Direction = 8
public let DIRECTION_NORTH_SOUTH: Direction = 5
public let DIRECTION_EAST_WEST: Direction = 10
public let DIRECTION_ALL: Direction = 15
public let DIRECTION_NONE: Direction = 0

public typealias Modifier = UInt8
public let MODIFIER_PASSED: Modifier = 0
public let MODIFIER_DOUBLED: Modifier = 1
public let MODIFIER_REDOUBLED: Modifier = 2

public typealias Card = UInt8
public let CARD_TWO_OF_CLUBS:       Card = 0
public let CARD_THREE_OF_CLUBS:     Card = 1
public let CARD_FOUR_OF_CLUBS:      Card = 2
public let CARD_FIVE_OF_CLUBS:      Card = 3
public let CARD_SIX_OF_CLUBS:       Card = 4
public let CARD_SEVEN_OF_CLUBS:     Card = 5
public let CARD_EIGHT_OF_CLUBS:     Card = 6
public let CARD_NINE_OF_CLUBS:      Card = 7
public let CARD_TEN_OF_CLUBS:       Card = 8
public let CARD_JACK_OF_CLUBS:      Card = 9
public let CARD_QUEEN_OF_CLUBS:     Card = 10
public let CARD_KING_OF_CLUBS:      Card = 11
public let CARD_ACE_OF_CLUBS:       Card = 12
public let CARD_TWO_OF_DIAMONDS:    Card = 13
public let CARD_THREE_OF_DIAMONDS:  Card = 14
public let CARD_FOUR_OF_DIAMONDS:   Card = 15
public let CARD_FIVE_OF_DIAMONDS:   Card = 16
public let CARD_SIX_OF_DIAMONDS:    Card = 17
public let CARD_SEVEN_OF_DIAMONDS:  Card = 18
public let CARD_EIGHT_OF_DIAMONDS:  Card = 19
public let CARD_NINE_OF_DIAMONDS:   Card = 20
public let CARD_TEN_OF_DIAMONDS:    Card = 21
public let CARD_JACK_OF_DIAMONDS:   Card = 22
public let CARD_QUEEN_OF_DIAMONDS:  Card = 23
public let CARD_KING_OF_DIAMONDS:   Card = 24
public let CARD_ACE_OF_DIAMONDS:    Card = 25
public let CARD_TWO_OF_HEARTS:      Card = 26
public let CARD_THREE_OF_HEARTS:    Card = 27
public let CARD_FOUR_OF_HEARTS:     Card = 28
public let CARD_FIVE_OF_HEARTS:     Card = 29
public let CARD_SIX_OF_HEARTS:      Card = 30
public let CARD_SEVEN_OF_HEARTS:    Card = 31
public let CARD_EIGHT_OF_HEARTS:    Card = 32
public let CARD_NINE_OF_HEARTS:     Card = 33
public let CARD_TEN_OF_HEARTS:      Card = 34
public let CARD_JACK_OF_HEARTS:     Card = 35
public let CARD_QUEEN_OF_HEARTS:    Card = 36
public let CARD_KING_OF_HEARTS:     Card = 37
public let CARD_ACE_OF_HEARTS:      Card = 38
public let CARD_TWO_OF_SPADES:      Card = 39
public let CARD_THREE_OF_SPADES:    Card = 40
public let CARD_FOUR_OF_SPADES:     Card = 41
public let CARD_FIVE_OF_SPADES:     Card = 42
public let CARD_SIX_OF_SPADES:      Card = 43
public let CARD_SEVEN_OF_SPADES:    Card = 44
public let CARD_EIGHT_OF_SPADES:    Card = 45
public let CARD_NINE_OF_SPADES:     Card = 46
public let CARD_TEN_OF_SPADES:      Card = 47
public let CARD_JACK_OF_SPADES:     Card = 48
public let CARD_QUEEN_OF_SPADES:    Card = 49
public let CARD_KING_OF_SPADES:     Card = 50
public let CARD_ACE_OF_SPADES:      Card = 51

public typealias Bidding = [Bid]

public extension Bidding {
    func getFinalContract(dealer: Direction = DIRECTION_NORTH) -> Contract? {
        let bid: Bid = getLastBid()
        let declarer: Direction = getDeclarer(dealer: dealer)
        let modifier: Modifier = getLastModifier()
        let contract: Contract = Contract(bid: bid, declarer: declarer, modifier: modifier)
        
        return isComplete() ? contract : nil
    }
    
    func isOver() -> Bool {
        let c = self.count
        if c < 4 {
            return false
        }
        return self[c-1] == BID_PASS && self[c-2] == BID_PASS && self[c-3] == BID_PASS
        
    }
    
    func getLastBid() -> Bid {
        if let idx = self.lastIndex(where: { $0 > BID_REDOUBLE }) {
            return self[idx]
        }
        return BID_PASS
    }
    
    func getLastModifier() -> Modifier {
        var copy = self
        if count == 0 {
            return MODIFIER_PASSED
        }
        while !copy.isEmpty {
            let curr: Bid = copy.popLast()!
            if curr > BID_REDOUBLE {
                return MODIFIER_PASSED
            }
            if curr == BID_REDOUBLE {
                return MODIFIER_REDOUBLED
            }
            if curr == BID_DOUBLE {
                return MODIFIER_DOUBLED
            }
        }
        return MODIFIER_PASSED
    }
    
    func getDeclarer(dealer: Direction = DIRECTION_NORTH) -> Direction {
        if let idx = self.lastIndex(where: { $0 > BID_REDOUBLE }) {
            let strain = self[idx].strain()
            for i in indices {
                let bid = self[i]
                if bid.strain() == strain {
                    return 1 << ((i + dealer.trailingZeroBitCount) & 3)
                }
            }
        }
        return DIRECTION_NONE
    }
    
    func isComplete() -> Bool {
        if !isValid() {
            return false
        }
        if count < 4 {
            return false
        }
        
        return self[count-1] == BID_PASS && self[count-2] == BID_PASS && self[count-3] == BID_PASS
    }
    
    func getPrintableString() -> String {
        var sb: String = "N   E   S   W\n"
        var c = 0
        for b in self {
            sb += b.bidToShortString()
            sb += b == BID_PASS || b == BID_DOUBLE ? "   " :
            b.strain() == STRAIN_NT ? " " :
            "  "
            c += 1
            if c == 4 {
                sb += "\n"
                c = 0
            }
        }
        return sb
    }
    
    func isValid() -> Bool {
        if isEmpty {
            return true
        }
        var currBid = self[0]
        var currIndex = 0
        var dbl = false
        var rdbl = false
        var passes = currBid == BID_PASS ? 1 : 0
        if currBid == BID_DOUBLE || currBid == BID_REDOUBLE {
            return false
        }
        for i in 1..<count {
            let next = self[i]
            if next > BID_REDOUBLE {
                if currBid >= next {
                    return false
                }
                currBid = next
                currIndex = i
                dbl = false
                rdbl = false
                passes = 0
            }
            if next == BID_PASS {
                passes += 1
                if passes > 3 && count > 4 {
                    return false
                }
            }
            if next == BID_DOUBLE {
                if i & 1 == currIndex & 1 || dbl || rdbl {
                    return false
                }
                dbl = true
                passes = 0
            }
            if next == BID_REDOUBLE {
                if !dbl || i & 1 != currIndex & 1 || rdbl {
                    return false
                }
                dbl = false
                rdbl = true
                passes = 0
            }
        }
        return true
    }
    
    func getAvailableBids() -> Bidding {
        var bids: Bidding = []
        if isOver() || !isValid() {
            return []
        }
        
        
        for bid in BIDS_ALL {
            if (self + [bid]).isValid() {
                bids.append(bid)
            }
        }
        
        return bids
    }
}

public extension Modifier {
    static let PASSED: Modifier = MODIFIER_PASSED
    static let DOUBLED: Modifier = MODIFIER_DOUBLED
    static let REDOUBLED: Modifier = MODIFIER_REDOUBLED
    
    func isDoubled() -> Bool {
        return self == Modifier.DOUBLED
    }
    
    func isRedoubled() -> Bool {
        return self == Modifier.REDOUBLED
    }
    
    func modifierToShortString() -> String {
        switch self {
        case MODIFIER_PASSED:
            return ""
        case MODIFIER_DOUBLED:
            return "X"
        case MODIFIER_REDOUBLED:
            return "XX"
        default:
            return ""
        }
    }
}

public extension Strain {
    static let CLUBS: Strain = STRAIN_CLUB
    static let DIAMONDS: Strain = STRAIN_DIAMOND
    static let HEARTS: Strain = STRAIN_HEART
    static let SPADES: Strain = STRAIN_SPADE
    static let NT: Strain = STRAIN_NT


    func isMinor() -> Bool {
        return strain() & STRAIN_MINORS != 0
    }
    
    func isMajor() -> Bool {
        return strain() & STRAIN_MAJORS != 0
    }
    
    func isNT() -> Bool {
        return strain() & STRAIN_NT != 0
    }
    
    func strainToShortString() -> String {
        switch self {
        case STRAIN_CLUB:
            return "C"
        case STRAIN_DIAMOND:
            return "D"
        case STRAIN_HEART:
            return "H"
        case STRAIN_SPADE:
            return "S"
        case STRAIN_NT:
            return "NT"
        default:
            return ""
        }
    }
}

public extension Card {
    func cardToHolding() -> Holding {
        return Holding(1) << self
    }
    
    func cardGetStrain() -> Strain {
        return STRAIN_CLUB << (self / 13)
    }
    
    func cardGetRankString() -> String {
        return ranks[Int(self % 13)]
    }
}

public extension Direction {
    func directionToShortString() -> String {
        var sb = ""
        if self & DIRECTION_NORTH != 0 {
            sb += "N"
        }
        if self & DIRECTION_EAST != 0 {
            sb += "E"
        }
        if self & DIRECTION_SOUTH != 0 {
            sb += "S"
        }
        if self & DIRECTION_WEST != 0 {
            sb += "W"
        }
        return sb
    }
    
    func directionToLongString() -> String {
        var sb = ""
        if self & DIRECTION_NORTH != 0 {
            sb += "North"
        }
        if self & DIRECTION_EAST != 0 {
            sb += "East"
        }
        if self & DIRECTION_SOUTH != 0 {
            sb += "South"
        }
        if self & DIRECTION_WEST != 0 {
            sb += "West"
        }
        return sb
    }
    
    func nextDirection() -> Direction {
        if self == DIRECTION_NORTH {
            return DIRECTION_EAST
        } else if self == DIRECTION_EAST {
            return DIRECTION_SOUTH
        } else if self == DIRECTION_SOUTH {
            return DIRECTION_WEST
        } else if self == DIRECTION_WEST {
            return DIRECTION_NORTH
        } else {
            return DIRECTION_NONE
        }
    }
}


public extension Holding {
    func hcp() -> Int {
        return
            (self & ACES).nonzeroBitCount * 4 +
            (self & KINGS).nonzeroBitCount * 3 +
            (self & QUEENS).nonzeroBitCount * 2 +
            (self & JACKS).nonzeroBitCount
    }
    
    func distributionPoints(strain: Strain) -> Int {
        func f(_ x: Int, _ y: Int) -> Int {
            return x > y ? x : y
        }
        var fp = 0
        fp += f(3 - spades().nonzeroBitCount, 0)
        fp += f(3 - hearts().nonzeroBitCount, 0)
        fp += f(3 - diamonds().nonzeroBitCount, 0)
        fp += f(3 - clubs().nonzeroBitCount, 0)
        fp -= f(3 - getSuit(suit: strain).nonzeroBitCount, 0)
        
        return fp
    }
    
    func trumpPoints(strain: Strain, count: Int) -> Int {
        return getSuit(suit: strain).nonzeroBitCount - count
    }
    
    func stp(strain: Strain, count: Int) -> Int {
        return hcp() + distributionPoints(strain: strain) + trumpPoints(strain: strain, count: count)
    }
    
    func getSuit(suit: Strain) -> Holding {
        var mask: Holding = 0
        if suit & STRAIN_SPADE != 0 {
            mask |= SPADES
        }
        if suit & STRAIN_HEART != 0 {
            mask |= HEARTS
        }
        if suit & STRAIN_DIAMOND != 0 {
            mask |= DIAMONDS
        }
        if suit & STRAIN_CLUB != 0 {
            mask |= CLUBS
        }
        return self & mask
    }
    
    func spades() -> Holding {
        return self & SPADES
    }
    
    func hearts() -> Holding {
        return self & HEARTS
    }
    
    func diamonds() -> Holding {
        return self & DIAMONDS
    }
    
    func clubs() -> Holding {
        return self & CLUBS
    }
    
    func cards() -> [Card] {
        var cards: [Card] = []
        for i in 0..<52 {
            if self & (Holding(1) << i) != 0 {
                cards.append(Card(i))
            }
        }
        return cards
    }
    
    func toPBN(includeDots: Bool = true) -> String {
        var sb = ""
        for i in (0..<13).reversed() {
            if (self >> (39 + i)) & 1 == 1 {
                sb += ranks[i]
            }
        }
        if includeDots {
            sb += "."
        }
        for i in (0..<13).reversed() {
            if (self >> (26 + i)) & 1 == 1 {
                sb += ranks[i]
            }
        }
        if includeDots {
            sb += "."
        }
        for i in (0..<13).reversed() {
            if (self >> (13 + i)) & 1 == 1 {
                sb += ranks[i]
            }
        }
        if includeDots {
            sb += "."
        }
        for i in (0..<13).reversed() {
            if (self >> i) & 1 == 1 {
                sb += ranks[i]
            }
        }
        return sb
    }
    
    mutating func setSpades(pbn: String) {
        let h = SpadesToHolding(pbn: pbn)
        let mask = ~SPADES
        self &= mask
        self |= h
    }

    mutating func setHearts(pbn: String) {
        let h = HeartsToHolding(pbn: pbn)
        let mask = ~HEARTS
        self &= mask
        self |= h
    }

    mutating func setDiamonds(pbn: String) {
        let h = DiamondsToHolding(pbn: pbn)
        let mask = ~DIAMONDS
        self &= mask
        self |= h
    }

    mutating func setClubs(pbn: String) {
        let h = ClubsToHolding(pbn: pbn)
        let mask = ~CLUBS
        self &= mask
        self |= h
    }
    
    
    
    static func fromShortString(_ s: String) -> Holding {
        switch s {
        case "2C": return HOLDING_TWO_OF_CLUBS
        case "2D": return HOLDING_TWO_OF_DIAMONDS
        case "2H": return HOLDING_TWO_OF_HEARTS
        case "2S": return HOLDING_TWO_OF_SPADES
        case "3C": return HOLDING_THREE_OF_CLUBS
        case "3D": return HOLDING_THREE_OF_DIAMONDS
        case "3H": return HOLDING_THREE_OF_HEARTS
        case "3S": return HOLDING_THREE_OF_SPADES
        case "4C": return HOLDING_FOUR_OF_CLUBS
        case "4D": return HOLDING_FOUR_OF_DIAMONDS
        case "4H": return HOLDING_FOUR_OF_HEARTS
        case "4S": return HOLDING_FOUR_OF_SPADES
        case "5C": return HOLDING_FIVE_OF_CLUBS
        case "5D": return HOLDING_FIVE_OF_DIAMONDS
        case "5H": return HOLDING_FIVE_OF_HEARTS
        case "5S": return HOLDING_FIVE_OF_SPADES
        case "6C": return HOLDING_SIX_OF_CLUBS
        case "6D": return HOLDING_SIX_OF_DIAMONDS
        case "6H": return HOLDING_SIX_OF_HEARTS
        case "6S": return HOLDING_SIX_OF_SPADES
        case "7C": return HOLDING_SEVEN_OF_CLUBS
        case "7D": return HOLDING_SEVEN_OF_DIAMONDS
        case "7H": return HOLDING_SEVEN_OF_HEARTS
        case "7S": return HOLDING_SEVEN_OF_SPADES
        case "8C": return HOLDING_EIGHT_OF_CLUBS
        case "8D": return HOLDING_EIGHT_OF_DIAMONDS
        case "8H": return HOLDING_EIGHT_OF_HEARTS
        case "8S": return HOLDING_EIGHT_OF_SPADES
        case "9C": return HOLDING_NINE_OF_CLUBS
        case "9D": return HOLDING_NINE_OF_DIAMONDS
        case "9H": return HOLDING_NINE_OF_HEARTS
        case "9S": return HOLDING_NINE_OF_SPADES
        case "TC": return HOLDING_TEN_OF_CLUBS
        case "TD": return HOLDING_TEN_OF_DIAMONDS
        case "TH": return HOLDING_TEN_OF_HEARTS
        case "TS": return HOLDING_TEN_OF_SPADES
        case "JC": return HOLDING_JACK_OF_CLUBS
        case "JD": return HOLDING_JACK_OF_DIAMONDS
        case "JH": return HOLDING_JACK_OF_HEARTS
        case "JS": return HOLDING_JACK_OF_SPADES
        case "QC": return HOLDING_QUEEN_OF_CLUBS
        case "QD": return HOLDING_QUEEN_OF_DIAMONDS
        case "QH": return HOLDING_QUEEN_OF_HEARTS
        case "QS": return HOLDING_QUEEN_OF_SPADES
        case "KC": return HOLDING_KING_OF_CLUBS
        case "KD": return HOLDING_KING_OF_DIAMONDS
        case "KH": return HOLDING_KING_OF_HEARTS
        case "KS": return HOLDING_KING_OF_SPADES
        case "AC": return HOLDING_ACE_OF_CLUBS
        case "AD": return HOLDING_ACE_OF_DIAMONDS
        case "AH": return HOLDING_ACE_OF_HEARTS
        case "AS": return HOLDING_ACE_OF_SPADES
        default: return 0
        }
    }
}

public extension Bid {
    func strain() -> Strain {
        return self & STRAIN_ALL
    }
    
    func level() -> Int {
        return Int(self >> 5)
    }
    
    fileprivate func scorePassedUndertricks(_ vul: Bool, _ overtricks: Int) -> Int {
        guard overtricks < 0 else {
            fatalError("Tried to score non ngeative overtricks as undertricks")
        }
        return vul ? 100 * overtricks : 50 * overtricks
    }
    
    fileprivate func scoreDoubledUndertricks(_ vul: Bool, _ overtricks: Int) -> Int {
        guard overtricks < 0 else {
            fatalError("Tried to score non ngeative overtricks as undertricks")
        }
        switch overtricks {
        case -1:
            return vul ? -200 : -100
        case -2:
            return vul ? -500 : -300
        default:
            return 300 * (overtricks + 2) - (vul ? 500 : 300)
        }
    }
    
    fileprivate func scoreRedoubledUndertricks(_ vul: Bool, _ overtricks: Int) -> Int {
        return 2 * scoreDoubledUndertricks(vul, overtricks)
    }
    
    fileprivate func scoreUndertricks(_ modifier: Modifier, _ vul: Bool, _ overtricks: Int) -> Int {
        switch modifier {
        case Modifier.PASSED: return scorePassedUndertricks(vul, overtricks)
        case Modifier.DOUBLED: return scoreDoubledUndertricks(vul, overtricks)
        case Modifier.REDOUBLED: return scoreRedoubledUndertricks(vul, overtricks)
        default: return 0
        }
    }
    
    fileprivate func calculateBaseScore(_ level: Int, _ strain: Strain, _ modifier: Modifier) -> Int {
        var baseScore = strain.isMinor() ? 20 * level : strain.isNT() ? 10 + 30 * level : 30 * level
        baseScore *= modifier.isDoubled() ? 2 : modifier.isRedoubled() ? 4 : 1
        return baseScore
    }
    
    fileprivate func calculateBonusScore(_ baseScore: Int, _ level: Int, _ modifier: Modifier, _ vul: Bool) -> Int {
        var bonusScore = baseScore >= 100 ? (vul ? 500 : 300) : 50
        if level == 6 {
            bonusScore += vul ? 750 : 500
        }
        if level == 7 {
            bonusScore += vul ? 1500 : 1000
        }
        bonusScore += modifier.isDoubled() ? 50 : modifier.isRedoubled() ? 100 : 0
        return bonusScore
    }
    
    fileprivate func calculateOvertrickScore(_ overtricks: Int, _ strain: Strain, _ modifier: Modifier, _ vul: Bool) -> Int {
        switch modifier {
        case Modifier.PASSED:
            return strain.isMinor() ? 20 * overtricks : 30 * overtricks
        case Modifier.DOUBLED:
            return vul ? 200 * overtricks : 100 * overtricks
        case Modifier.REDOUBLED:
            return vul ? 400 * overtricks : 200 * overtricks
        default:
            return 0
        }
    }
    
    func scoreContract(tricks: Int, modifier: Modifier, vul: Bool) -> Int {
        let level = level()
        let strain = strain()
        let tricksNeeded: Int = level + 6
        let overtricks: Int = tricks - tricksNeeded
        
        if level == 0 {
            return 0
        }
        
        guard level >= 1 && level <= 7 else {
            fatalError("Attempting to score contract with incorrect level")
        }
        
        guard strain.nonzeroBitCount == 1 else {
            fatalError("Attempting to score contract with incorrect strain")
        }
        
        if overtricks < 0 {
            return scoreUndertricks(modifier, vul, overtricks)
        }
        
        let baseScore = calculateBaseScore(level, strain, modifier)
        let bonusScore = calculateBonusScore(baseScore, level, modifier, vul)
        let overtrickScore = calculateOvertrickScore(overtricks, strain, modifier, vul)

        return baseScore + overtrickScore + bonusScore
    }
    
    func bidToShortString() -> String {
        switch self {
        case BID_PASS:
            return "P"
        case BID_DOUBLE:
            return "X"
        case BID_REDOUBLE:
            return "XX"
        default:
            return "\(self.level())\(self.strain().strainToShortString())"
        }
    }
    
    @available(macOS 13.0, *)
    @available(iOS 16.0, *)
    static func fromShortString(s: String) -> Bid {
        switch s {
        case "P", "p": return BID_PASS
        case "X", "x", "D", "d": return BID_DOUBLE
        case "XX", "xx", "R", "r", "RD", "rd": return BID_REDOUBLE
            
        case "1C": return BID_1_CLUBS
        case "1D": return BID_1_DIAMONDS
        case "1H": return BID_1_HEARTS
        case "1S": return BID_1_SPADES
        case "1N", "1NT": return BID_1_NT

        case "2C": return BID_2_CLUBS
        case "2D": return BID_2_DIAMONDS
        case "2H": return BID_2_HEARTS
        case "2S": return BID_2_SPADES
        case "2N", "2NT": return BID_2_NT

        case "3C": return BID_3_CLUBS
        case "3D": return BID_3_DIAMONDS
        case "3H": return BID_3_HEARTS
        case "3S": return BID_3_SPADES
        case "3N", "3NT": return BID_3_NT

        case "4C": return BID_4_CLUBS
        case "4D": return BID_4_DIAMONDS
        case "4H": return BID_4_HEARTS
        case "4S": return BID_4_SPADES
        case "4N", "4NT": return BID_4_NT

        case "5C": return BID_5_CLUBS
        case "5D": return BID_5_DIAMONDS
        case "5H": return BID_5_HEARTS
        case "5S": return BID_5_SPADES
        case "5N", "5NT": return BID_5_NT

        case "6C": return BID_6_CLUBS
        case "6D": return BID_6_DIAMONDS
        case "6H": return BID_6_HEARTS
        case "6S": return BID_6_SPADES
        case "6N", "6NT": return BID_6_NT

        case "7C": return BID_7_CLUBS
        case "7D": return BID_7_DIAMONDS
        case "7H": return BID_7_HEARTS
        case "7S": return BID_7_SPADES
        case "7N", "7NT": return BID_7_NT

        default: return 0
        }

    }
}

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

public struct Contract : Codable, Hashable {
    public var bid: Bid
    public var declarer: Direction
    public var modifier: Modifier
    
    public var leader: Direction {
        get {
            if declarer == DIRECTION_WEST {
                return DIRECTION_NORTH
            }
            return declarer << 1
        }
    }
    
    public init(bid: Bid, declarer: Direction, modifier: Modifier) {
        self.bid = bid
        self.declarer = declarer
        self.modifier = modifier
    }
}

public extension Contract {
    func score(tricks: Int, vul: Bool) -> Int {
        return self.bid.scoreContract(tricks: tricks, modifier: self.modifier, vul: vul)
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

public func StringToHolding(pbn: String) -> UInt64 {
    var holding: UInt64 = 0
    let parts = pbn.split(separator: ".", maxSplits: 3, omittingEmptySubsequences: false)
    
    for suit in [0, 1, 2, 3] {
        holding |= SuitToHolding(pbn: String(parts[3 - Int(suit)]), strain: 1 << suit)
    }
    
    return holding
}

public func SuitToHolding(pbn: String, strain: Strain) -> UInt64 {
    if strain == Strain.SPADES {
        return SpadesToHolding(pbn: pbn)
    }
    if strain == Strain.HEARTS {
        return HeartsToHolding(pbn: pbn)
    }
    if strain == Strain.DIAMONDS {
        return DiamondsToHolding(pbn: pbn)
    }
    if strain == Strain.CLUBS {
        return ClubsToHolding(pbn: pbn)
    }
    return 0
}

public func SpadesToHolding(pbn: String) -> UInt64 {
    var holding: UInt64 = 0
    for s in pbn {
        let idx = ranks.firstIndex(of: "\(s)") ?? -1
        if idx == -1 {
            continue
        }
        holding |= (1 << (39 + idx))
    }
    return holding
}

public func HeartsToHolding(pbn: String) -> UInt64 {
    var holding: UInt64 = 0
    for s in pbn {
        let idx = ranks.firstIndex(of: "\(s)") ?? -1
        if idx == -1 {
            continue
        }
        holding |= (1 << (26 + idx))
    }
    return holding
}

public func DiamondsToHolding(pbn: String) -> UInt64 {
    var holding: UInt64 = 0
    for s in pbn {
        let idx = ranks.firstIndex(of: "\(s)") ?? -1
        if idx == -1 {
            continue
        }
        holding |= (1 << (13 + idx))
    }
    return holding
}

public func ClubsToHolding(pbn: String) -> UInt64 {
    var holding: UInt64 = 0
    for s in pbn {
        let idx = ranks.firstIndex(of: "\(s)") ?? -1
        if idx == -1 {
            continue
        }
        holding |= (1 << idx)
    }
    return holding
}


public func nsvul(_ boardNumber: Int) -> Bool {
    let b = (boardNumber - 1) & 15
    return (b ^ (b >> 2)) & 1 == 1
}

public func ewvul(_ boardNumber: Int) -> Bool {
    let b = (boardNumber - 1) & 15
    return (b + (b >> 2)) & 2 == 2
}

public func vulnerability(_ boardNumber: Int) -> Direction {
    return (nsvul(boardNumber) ? DIRECTION_NORTH_SOUTH : DIRECTION_NONE) | (ewvul(boardNumber) ? DIRECTION_EAST_WEST : DIRECTION_NONE)
}


public enum ExportFormat {
    case PBN
    case DUP
    case BIN
    case JSON
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension [Deal] {
    static func importFromFile(_ url: URL, _ format: ExportFormat? = nil) throws -> [Deal] {
        var deals: [Deal] = []
        
        switch format {
        case .PBN:
            try! deals = self.importPBN(url)
            break
        case .DUP:
            try! deals = self.importDUP(url)
            break
        case .BIN:
            try! deals = self.importBIN(url)
            break
        case .JSON:
            try! deals = self.importJSON(url)
            break
        default:
            switch url.pathExtension {
            case "pbn":
                try! deals = self.importFromFile(url, .PBN)
                break
            case "dup":
                try! deals = self.importFromFile(url, .DUP)
                break
            case "json":
                try! deals = self.importFromFile(url, .JSON)
                break
            case "bin":
                try! deals = self.importFromFile(url, .BIN)
                break
            default:
                throw NSError(domain: "DealsImportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "File extension not supported for deals import: \(url.pathExtension)"])
            }
        }
        
        return deals
    }
    
    static func importDUP(_ url: URL) throws -> [Deal] {
        return []
    }
    
    static func importBIN(_ url: URL) throws -> [Deal] {
        return []
    }
    
    static func importJSON(_ url: URL) throws -> [Deal] {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let deals = try decoder.decode([Deal].self, from: data)
            return deals
        } catch {
            throw NSError(domain: "DealsImportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Could not parse JSON data"])
        }
    }
    
    static func importPBN(_ url: URL) throws -> [Deal] {
        var deals: [Deal] = []
        
        do {
            let contents = try String(contentsOf: url, encoding: .utf8)
            let lines = contents.components(separatedBy: .newlines)
            for line in lines {
                if let match = line.firstMatch(of: #/\[Deal "([NESW]):([23456789TJQKA\s\.]+)"\]/#) {
                    let deal = Deal.parse(pbn: match.2.description, format: match.1.description)
                    deals.append(deal)
                    print(deal.toPBN())
                }
            }
        } catch {
            throw NSError(domain: "DealsImportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Could not parse JSON data"])
        }
        
        return deals
    }
    
    func exportToFile(_ url: URL, _ format: ExportFormat? = nil) throws {
        switch format {
        case .PBN:
            try! self.exportPBN(url)
            break
        case .DUP:
            try! self.exportDUP(url)
            break
        case .BIN:
            try! self.exportBIN(url)
            break
        case .JSON:
            try! self.exportJSON(url)
            break
        default:
            switch url.pathExtension {
            case "pbn":
                try self.exportToFile(url, .PBN)
                break
            case "dup":
                try self.exportToFile(url, .DUP)
                break
            case "json":
                try self.exportToFile(url, .JSON)
                break
            case "bin":
                try self.exportToFile(url, .BIN)
                break
            default:
                throw NSError(domain: "DealsExportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "File extension not supported for deals export: \(url.pathExtension)"])
            }
        }
    }
    
    static func from(bytes: [UInt8]) throws -> [Deal] {
        var deals: [Deal] = []
        
        var readPointer = 0
        let readEnd = bytes.count
        
        while readPointer + 32 < readEnd {
            do {
                let deal: Deal = try Deal.from(bytes: Array<UInt8>(bytes[readPointer..<readPointer+32]))
                readPointer += 32
                
                deals.append(deal)
            }
            catch {
                throw error
            }
        }
        
        return deals
    }
    
    func toBytes() -> [UInt8] {
        var bytes: [UInt8] = []
        for deal in self {
            for byte in deal.toBytes() {
                bytes.append(byte)
            }
        }
        return bytes
    }
    
    func exportBIN(_ url: URL) throws {
        let bytes: [UInt8] = toBytes()
        
        let data = Data(bytes)
        do {
            try data.write(to: url)
        } catch {
            throw error
        }
    }
    
    func exportJSON(_ url: URL) throws {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            try data.write(to: url)
        } catch {
            throw NSError(domain: "DealsExportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Unable to convert to JSON data"])
        }
    }
    
    func exportPBN(_ url: URL) throws {
        var sb = ""
        var bn = 1
        for deal in self {
            sb += "[Board \"\(bn)\"]\n"
            sb += "[Deal \"N:\(deal.toPBN())\"]\n"
            bn += 1
        }
        
        if let data = sb.data(using: .utf8) {
            do {
                try data.write(to: url)
            } catch {
                throw error
            }
        } else {
            throw NSError(domain: "DealsExportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Unable to convert string to UTF-8 data."])
        }
    }
    
    func exportDUP(_ url: URL) throws {
        var sb = ""
        for deal in self {
            sb += deal.toDUP()
            sb += "YN1"
            sb += String(format: "  1%3d ", self.count)
        }
        
        if let data = sb.data(using: .utf8) {
            do {
                try data.write(to: url)
            } catch {
                throw error
            }
        } else {
            throw NSError(domain: "DealsExportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Unable to convert string to UTF-8 data."])
        }
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



public typealias Constraint = (Holding) -> Bool
public typealias ConstraintSet = [Constraint]
public typealias ConstraintBatch = [[ConstraintSet]]
public typealias ConstraintCollection = [Direction:ConstraintBatch]

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension ConstraintSet {
    func validate(holding: Holding) -> Bool {
        for f in self {
            if !f(holding) {
                return false
            }
        }
        return true
    }
    
    static func parse(_ text: String) -> ConstraintSet {
        return Dealer.getConstraint(text: text)
    }
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension ConstraintBatch {
    func validate(holding: Holding) -> Bool {
        for cs in self {
            var flag = false
            for css in cs {
                if css.validate(holding: holding) {
                    flag = true
                    break
                }
            }
            if !flag {
                return false
            }
        }
        return true
    }
    
    static func parse(_ text: String) -> ConstraintBatch {
        return text.split(separator: Dealer.REGEX_AND).map { $0.split(separator: Dealer.REGEX_OR).map({ ConstraintSet.parse(String($0)) })}
    }
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension ConstraintCollection {
    func validate(deal: Deal) -> Bool {
        for kvp in self {
            let holding = deal.getHolding(dir: kvp.key)
            if !kvp.value.validate(holding: holding) {
                return false
            }
        }
        return true
    }
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public class Dealer {
    static let REGEX_BINARY_OPERATOR = #/(hcp|spades|hearts|diamonds|clubs|\d+)\s*(<|>|=|>=|<=)\s*(hcp|spades|hearts|diamonds|clubs|\d+)/#
    static let REGEX_SHAPE = #/shape\s*([\dx])([\dx])([\dx])([\dx])/#
    static let REGEX_SHAPE_ANY = #/shape any\s*([\dx][SsHhDdCc]?)([\dx][SsHhDdCc]?)([\dx])([\dx])/#
    static let REGEX_BALANCED = #/\sbal|\sbalanced/#
    static let REGEX_UNBALANCED = #/unbal|unbalanced/#
    static let REGEX_RANGE = #/(\d+)-(\d+)\s+(hcp|spades|hearts|diamonds|clubs)/#
    
    static let REGEX_HOLDS = #/holds\(([AKQJT98765432][SHDC](?:,[AKQJT98765432][SHDC])*)\)/#
    static let REGEX_CUE = #/cue\((spades|hearts|diamonds|clubs)\)/#
    static let REGEX_STOPPER = #/stopper\((spades|hearts|diamonds|clubs)\)/#
    static let REGEX_KEYCARDS = #/kc\((spades|hearts|diamonds|clubs)\)\s*(<|>|=|>=|<=)\s*(\d+)/#
    static let REGEX_HCP_SUIT = #/hcp\((spades|hearts|diamonds|clubs)\)\s*(<|>|=|>=|<=)\s*(\d+)/#
    static let REGEX_STP = #/stp\((spades|hearts|diamonds|clubs),\s*(\d+)\)\s*(<|>|=|>=|<=)\s*(\d+)/#
    static let REGEX_STP_RANGE = #/(\d+)-(\d+)\s+stp\((spades|hearts|diamonds|clubs),\s*(\d+)\)/#

    
    static let REGEX_OR = #/\sor\s|\s\|\|\s/#
    static let REGEX_AND = #/\sand\s|\s\&\&/#
    
    public static func deal(constraint: String) -> Deal {
        let cb: ConstraintBatch = ConstraintBatch.parse(constraint)
        for _ in 0..<1000000 {
            let deal = Deal.random()
            if cb.validate(holding: deal.north) {
                return deal
            }
        }
        return Deal()
    }
    
    public static func deal(count: Int = 1, predeal: Deal = Deal()) -> [Deal] {
        var deals: [Deal] = []
        
        for _ in 0..<count {
            deals.append(Deal.random(predeal: predeal))
        }
        
        return deals
    }
    
    public static func deal(count: Int = 1, predeal: Deal = Deal(), constraints: ConstraintCollection) -> [Deal] {
        var deals: [Deal] = []
        
        var c = 0
        for _ in 0..<count*1000000 {
            let deal = Deal.random(predeal: predeal)
            if constraints.validate(deal: deal) {
                deals.append(deal)
                c += 1
            }
            if c == count {
                break
            }
        }
        
        return deals
    }
    
    public static func deal(constraints: ConstraintCollection) -> Deal {
        return deal(count: 1, constraints: constraints).first ?? Deal()
    }
    
    public static func getArgf(_ arg: Substring) -> (Holding) -> Int {
        switch arg {
        case "hcp": { h in h.hcp() }
        case "spades": { h in h.spades().nonzeroBitCount }
        case "hearts": { h in h.hearts().nonzeroBitCount }
        case "diamonds": { h in h.diamonds().nonzeroBitCount }
        case "clubs": { h in h.clubs().nonzeroBitCount }
        default: { h in Int(arg) ?? 0 }
        }
    }
    
    public static func getHcpSuitf(_ arg: Substring) -> (Holding) -> Int {
        switch arg {
        case "spades": { h in h.spades().hcp() }
        case "hearts": { h in h.hearts().hcp() }
        case "diamonds": { h in h.diamonds().hcp() }
        case "clubs": { h in h.clubs().hcp() }
        default: { h in 0 }
        }
    }
    
    public static func getStpf(_ arg: Substring, count: Int) -> (Holding) -> Int {
        switch arg {
        case "spades": { h in h.stp(strain: STRAIN_SPADE, count: count) }
        case "hearts": { h in h.stp(strain: STRAIN_HEART, count: count) }
        case "diamonds": { h in h.stp(strain: STRAIN_DIAMOND, count: count) }
        case "clubs": { h in h.stp(strain: STRAIN_CLUB, count: count) }
        default: { h in 0 }
        }
    }
    
    public static func getOpf(_ op: Substring) -> (Int, Int) -> Bool {
        switch op {
        case "=": { a, b in a == b }
        case ">": { a, b in a > b }
        case "<": { a, b in a < b }
        case ">=": { a, b in a >= b }
        case "<=": { a, b in a <= b }
        default: { a, b in true }
        }
    }
    
    public static func matchBinOp(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_BINARY_OPERATOR)
        for result in results {
            let arg1 = result.output.1
            let arg2 = result.output.3
            let op = result.output.2
            let arg1f: (Holding) -> Int = getArgf(arg1)
            let arg2f: (Holding) -> Int = getArgf(arg2)
            let opf: (Int, Int) -> Bool = getOpf(op)
            let f: Constraint = { h in opf(arg1f(h), arg2f(h)) }
            constraint.append(f)
        }
    }
    
    public static func matchShape(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_SHAPE)
        for result in results {
            let arg1: (Holding) -> Bool = switch result.output.1 {
            case "x": { h in true }
            default: { h in h.spades().nonzeroBitCount == Int(result.output.1) ?? 0}
            }
            let arg2: (Holding) -> Bool = switch result.output.2 {
            case "x": { h in true }
            default: { h in h.hearts().nonzeroBitCount == Int(result.output.2) ?? 0}
            }
            let arg3: (Holding) -> Bool = switch result.output.3 {
            case "x": { h in true }
            default: { h in h.diamonds().nonzeroBitCount == Int(result.output.3) ?? 0}
            }
            let arg4: (Holding) -> Bool = switch result.output.4 {
            case "x": { h in true }
            default: { h in h.clubs().nonzeroBitCount == Int(result.output.4) ?? 0}
            }
            let f: Constraint = { h in arg1(h)&&arg2(h)&&arg3(h)&&arg4(h) }
            constraint.append(f)
        }
    }
    
    public static func matchShapeAny(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_SHAPE_ANY)
        for result in results {
            var shape: [Int] = []
            if let arg1 = Int(result.output.1) { shape.append(arg1) }
            if let arg2 = Int(result.output.2) { shape.append(arg2) }
            if let arg3 = Int(result.output.3) { shape.append(arg3) }
            if let arg4 = Int(result.output.4) { shape.append(arg4) }
            
            
            let f: Constraint = { h in
                var fmap = [Int:Int]()
                for e in shape {
                    fmap[e, default: 0] += 1
                }
                var hshape: [Int] = [h.spades().nonzeroBitCount, h.hearts().nonzeroBitCount, h.diamonds().nonzeroBitCount, h.clubs().nonzeroBitCount]
                
                let suits: String = "shdc"
                var removeIndices: [Int] = []
                for arg in [result.output.1, result.output.2] {
                    if let fixedSuitLength = Int(String(arg.first!)), let index = suits.firstIndex(of: Character(arg.last!.lowercased())) {
                        let distance = suits.distance(from: suits.startIndex, to: index)
                        let v = hshape[distance]
                        if fixedSuitLength != v {
                            return false
                        }
                        removeIndices.append(distance)
                    }
                }
                for index in removeIndices.sorted(by: >) {
                    hshape.remove(at: index)
                }
                
                
                for element in hshape {
                    if let count = fmap[element] {
                        fmap[element] = count - 1
                        if count - 1 == 0 {
                            fmap.removeValue(forKey: element)
                        }
                        if fmap.isEmpty {
                            return true
                        }
                    }
                }
                return fmap.isEmpty
            }
            constraint.append(f)
        }
    }
    
    public static func matchBalanced(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        if text.contains(REGEX_BALANCED) {
            let f: Constraint = { hand in
                let s = hand.spades().nonzeroBitCount
                let h = hand.hearts().nonzeroBitCount
                let d = hand.diamonds().nonzeroBitCount
                let c = hand.clubs().nonzeroBitCount
                return s >= 2 && s <= 5 && h >= 2 && h <= 5 && d >= 2 && d <= 5 && c >= 2 && c <= 5 && s + h >= 5 && s + d >= 5 && s + c >= 5 && h + d >= 5 && h + c >= 5 && d + c >= 5
            }
            constraint.append(f)
        }
    }
    
    public static func matchUnbalanced(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        if text.contains(REGEX_UNBALANCED) {
            let f: Constraint = { hand in
                let s = hand.spades().nonzeroBitCount
                let h = hand.hearts().nonzeroBitCount
                let d = hand.diamonds().nonzeroBitCount
                let c = hand.clubs().nonzeroBitCount
                return !(s >= 2 && s <= 5 && h >= 2 && h <= 5 && d >= 2 && d <= 5 && c >= 2 && c <= 5 && s + h >= 5 && s + d >= 5 && s + c >= 5 && h + d >= 5 && h + c >= 5 && d + c >= 5)
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchRange(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_RANGE)
        for result in results {
            let arg1: Int = Int(result.output.1)!
            let arg2: Int = Int(result.output.2)!
            let value = getArgf(result.output.3)
            let f: Constraint = { h in
                let val = value(h)
                return arg1 <= val && val <= arg2
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchHolds(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_HOLDS)
        for result in results {
            let values: Holding = result.output.1.split(separator: ",").map {
                return Holding.fromShortString(String($0))
            }.reduce(Holding(0), { r, h in return r | h })
            let f: Constraint = { h in
                return h & values == values
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchCue(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_CUE)
        for result in results {
            let v = result.output.1
            let f: Constraint = { h in
                switch v {
                case "spades": return h.spades().nonzeroBitCount < 2 || h & HOLDING_ACE_OF_SPADES != 0 || h & HOLDING_KING_OF_SPADES != 0
                case "hearts": return h.hearts().nonzeroBitCount < 2 || h & HOLDING_ACE_OF_HEARTS != 0 || h & HOLDING_KING_OF_HEARTS != 0
                case "diamonds": return h.diamonds().nonzeroBitCount < 2 || h & HOLDING_ACE_OF_DIAMONDS != 0 || h & HOLDING_KING_OF_DIAMONDS != 0
                case "clubs": return h.clubs().nonzeroBitCount < 2 || h & HOLDING_ACE_OF_CLUBS != 0 || h & HOLDING_KING_OF_CLUBS != 0
                default: return false
                }
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchStopper(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_STOPPER)
        for result in results {
            let v = result.output.1
            let f: Constraint = { h in
                switch v {
                case "spades":
                    return h & HOLDING_ACE_OF_SPADES != 0 ||
                    (h & HOLDING_KING_OF_SPADES != 0 && h.spades().nonzeroBitCount > 1) ||
                    (h & HOLDING_QUEEN_OF_SPADES != 0 && h.spades().nonzeroBitCount > 2) ||
                    (h & HOLDING_JACK_OF_SPADES != 0 && h.spades().nonzeroBitCount > 3)
                case "hearts":
                    return h & HOLDING_ACE_OF_HEARTS != 0 ||
                    (h & HOLDING_KING_OF_HEARTS != 0 && h.hearts().nonzeroBitCount > 1) ||
                    (h & HOLDING_QUEEN_OF_HEARTS != 0 && h.hearts().nonzeroBitCount > 2) ||
                    (h & HOLDING_JACK_OF_HEARTS != 0 && h.hearts().nonzeroBitCount > 3)
                case "diamonds":
                    return h & HOLDING_ACE_OF_DIAMONDS != 0 ||
                    (h & HOLDING_KING_OF_DIAMONDS != 0 && h.diamonds().nonzeroBitCount > 1) ||
                    (h & HOLDING_QUEEN_OF_DIAMONDS != 0 && h.diamonds().nonzeroBitCount > 2) ||
                    (h & HOLDING_JACK_OF_DIAMONDS != 0 && h.diamonds().nonzeroBitCount > 3)
                case "clubs":
                    return h & HOLDING_ACE_OF_CLUBS != 0 ||
                    (h & HOLDING_KING_OF_CLUBS != 0 && h.clubs().nonzeroBitCount > 1) ||
                    (h & HOLDING_QUEEN_OF_CLUBS != 0 && h.clubs().nonzeroBitCount > 2) ||
                    (h & HOLDING_JACK_OF_CLUBS != 0 && h.clubs().nonzeroBitCount > 3)
                default: return false
                }
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchKeycards(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_KEYCARDS)
        for result in results {
            let opf = getOpf(result.output.2)
            let arg2 = Int(result.output.3) ?? 0
            let f: Constraint = { h in
                var arg1 = (h & ACES).nonzeroBitCount
                switch result.output.1 {
                case "spades": arg1 += h & HOLDING_KING_OF_SPADES != 0 ? 1 : 0
                case "hearts": arg1 += h & HOLDING_KING_OF_HEARTS != 0 ? 1 : 0
                case "diamonds": arg1 += h & HOLDING_KING_OF_DIAMONDS != 0 ? 1 : 0
                case "clubs": arg1 += h & HOLDING_KING_OF_CLUBS != 0 ? 1 : 0
                default: return true
                }
                return opf(arg1, arg2)
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchHcpSuit(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_HCP_SUIT)
        for result in results {
            let opf = getOpf(result.output.2)
            let arg1 = result.output.1
            let arg2 = Int(result.output.3) ?? 0
            let f: Constraint = { h in
                switch arg1 {
                case "spades": return opf(h.spades().hcp(), arg2)
                case "hearts": return opf(h.hearts().hcp(), arg2)
                case "diamonds": return opf(h.diamonds().hcp(), arg2)
                case "clubs": return opf(h.clubs().hcp(), arg2)
                default: return true
                }
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchStp(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_STP)
        for result in results {
            let opf = getOpf(result.output.3)
            let count = Int(result.output.2) ?? 0
            let stpf = getStpf(result.output.1, count: count)
            let arg3 = Int(result.output.4) ?? 0
            let f: Constraint = { h in opf(stpf(h), arg3) }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchStpRange(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_STP_RANGE)
        for result in results {
            let arg1: Int = Int(result.output.1) ?? 0
            let arg2: Int = Int(result.output.2) ?? 0
            let count: Int = Int(result.output.4) ?? 0
            let stpf = getStpf(result.output.3, count: count)
            let f: Constraint = { h in
                let val = stpf(h)
                return arg1 <= val && val <= arg2
            }
            constraint.append(f)
        }
    }
    
    public static func getConstraint(text: String) -> ConstraintSet {
        var constraint: ConstraintSet = []
        
        matchBinOp(text, &constraint)
        matchShape(text, &constraint)
        matchShapeAny(text, &constraint)
        matchBalanced(text, &constraint)
        matchUnbalanced(text, &constraint)
        matchRange(text, &constraint)
        matchHolds(text, &constraint)
        matchCue(text, &constraint)
        matchStopper(text, &constraint)
        matchKeycards(text, &constraint)
        matchHcpSuit(text, &constraint)
        matchStp(text, &constraint)
        matchStpRange(text, &constraint)
        
        return constraint
    }
}


@available(macOS 13.0, *)
@available(iOS 16.0, *)
public struct BiddingSystem: Codable, Hashable {
    public struct Definition: Codable, Hashable {
        public var descriptionString: String
        public var constraint: String
        public var prio: Int = 0
        
        public var isEmpty: Bool {
            descriptionString.isEmpty && constraint.isEmpty
        }
        
        public init(description: String = "", constraint: String = "", prio: Int = 0) {
            self.descriptionString = description
            self.constraint = constraint
            self.prio = prio
        }
    }
    public class Node: Codable, Hashable, Identifiable {
        public var id: UUID = UUID()
        public var children: [Node]? = []
        public var bid: Bid
        public var definition: Definition
        public var parent: Node?
        
        public var bidding: Bidding {
            var bids: Bidding = []
            var currentNode: Node? = self
            while let node = currentNode {
                if node.bid == BID_NONE { break }
                bids.insert(node.bid, at: 0)
                currentNode = node.parent
            }
            return bids
        }
        
        public var isRoot: Bool { parent == nil }
        public var isLeaf: Bool { children == nil || children!.isEmpty}
        public var isUncontestedLeaf: Bool { uncontestedChildren == nil || uncontestedChildren!.isEmpty }
        
        public init(bid: Bid, definition: Definition, children: [Node] = [], parent: Node? = nil) {
            self.children = children
            self.bid = bid
            self.definition = definition
            self.parent = parent
        }
        
        public var computeModule: BiddingSystem {
            var module = BiddingSystem()
            func recursiveAdd(_ node: Node, currentBidding: Bidding) {
                module.addDefinition(currentBidding + [node.bid], node.definition)
                for child in node.children ?? [] {
                    recursiveAdd(child, currentBidding: currentBidding + [node.bid])
                }
            }
            recursiveAdd(self, currentBidding: [])
            
            return module
        }
        
        public var uncontestedChildren: [Node]? {
            children?.first(where: { $0.bid == BID_PASS })?.children?.sorted(by: { a, b in
                a.bid < b.bid
            })
        }
        
        public func getNode(_ bidding: Bidding) -> Node? {
            var currentNode = self
            for bid in bidding {
                if let nextNode = currentNode.children?.first(where: { node in node.bid == bid }) {
                    currentNode = nextNode
                } else {
                    return nil
                }
            }
            return currentNode
        }
        
        public func addModule(_ node: Node, shouldOverwrite: Bool = false, isUncontested: Bool = false) {
            let path: Bidding = (isUncontested ? [BID_PASS] : []) + node.bidding
            addDefinition(node.definition, at: path, shouldOverwrite: shouldOverwrite)
            for child in node.children ?? [] {
                addModule(child, shouldOverwrite: shouldOverwrite, isUncontested: isUncontested)
            }
        }
        
        public func addDefinition(_ definition: Definition, at bidding: Bidding, shouldOverwrite: Bool = false) {
            var currentNode = self
            for bid in bidding {
                if let nextNode = currentNode.children?.first(where: { node in node.bid == bid }) {
                    currentNode = nextNode
                } else {
                    let nextNode = Node(bid: bid, definition: BiddingSystem.Definition(), parent: currentNode)
                    if let index = currentNode.children?.firstIndex(where: { node in node.bid > bid }) {
                        currentNode.children?.insert(nextNode, at: index)
                    } else {
                        currentNode.children?.append(nextNode)
                    }
                    currentNode = nextNode
                }
            }
            if shouldOverwrite || currentNode.definition.isEmpty {
                currentNode.definition = definition
            }
        }
        
        public func insertDefinition(_ definition: Definition, at bidding: Bidding) {
            if let node = getNode(bidding) {
                node.definition = definition
            }
        }
        
        public static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.id == rhs.id
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    public var definitions: [Bidding:Definition] = [:]
    
    public var definitionCount: Int {
        return definitions.count(where: { !$0.value.isEmpty })
    }
    
    public init() {
        
    }
    
    public func buildTree() -> Node {
        var root = Node(bid: BID_NONE, definition: Definition(), parent: nil)
        
        for (bidding, definition) in definitions {
            var currentNode = root
            for bid in bidding {
                if let nextNode = currentNode.children?.first(where: { $0.bid == bid }) {
                    currentNode = nextNode
                } else {
                    let newNode = Node(bid: bid, definition: Definition(), parent: currentNode)
                    if let index = currentNode.children?.firstIndex(where: { $0.bid > bid }) {
                        currentNode.children?.insert(newNode, at: index)
                    } else {
                        currentNode.children?.append(newNode)
                    }
                    
                    currentNode = newNode
                }
            }
            currentNode.definition = definition
        }
        
        return root
    }
    
    public mutating func addModule(_ system: BiddingSystem, overwrite: Bool = false, overwriteEmpty: Bool = false, initialPath: Bidding = []) {
        for (bidding, definition) in system.definitions {
            addDefinition(initialPath + bidding, definition, shouldOverwrite: overwrite && (!definition.isEmpty || overwriteEmpty))
        }
    }
    
    public func getDefinition(_ bidding: Bidding, exactMatch: Bool = false) -> Definition? {
        return definitions[bidding] ?? (exactMatch ? nil : getDefinition(Array(bidding.drop(while: { $0 == BID_PASS})), exactMatch: true))
    }
    
    public mutating func addDefinition(_ bidding: Bidding, _ definition: Definition, shouldOverwrite: Bool = false) {
        guard !bidding.isEmpty else { return }
        
        if shouldOverwrite || (definitions[bidding]?.isEmpty ?? true) {
            definitions[bidding] = definition
        }
    }
    
    public mutating func updateDefinition(_ definition: Definition, for bidding: Bidding) {
        addDefinition(bidding, definition, shouldOverwrite: true)
    }
    
    public mutating func updateDefinitionDescription(_ description: String, for bidding: Bidding) {
        var newDefinition = getDefinition(bidding) ?? Definition()
        newDefinition.descriptionString = description
        addDefinition(bidding, newDefinition, shouldOverwrite: true)
    }
    
    public mutating func updateDefinitionConstraints(_ constraints: String, for bidding: Bidding) {
        var newDefinition = getDefinition(bidding) ?? Definition()
        newDefinition.constraint = constraints
        addDefinition(bidding, newDefinition, shouldOverwrite: true)
    }
    
    public mutating func updateDefinitionPriority(_ priority: Int, for bidding: Bidding) {
        var newDefinition = getDefinition(bidding) ?? Definition()
        newDefinition.prio = priority
        addDefinition(bidding, newDefinition, shouldOverwrite: true)
    }
    
    public mutating func removeDefinition(_ bidding: Bidding) {
        guard !bidding.isEmpty else { return }
        
        let keys = definitions.keys.filter( { $0.starts(with: bidding) } )
        for key in keys {
            definitions.removeValue(forKey: key)
        }
    }
    
    public func isDefined(_ bidding: Bidding) -> Bool {
        return !(getDefinition(bidding)?.isEmpty ?? true)
    }

    
    public func getBid(holding: Holding, sequence: Bidding) -> Bid? {
        var defs: [(Bid, Definition)] = []
        for bid in BIDS_ALL {
            var copy = sequence
            copy.append(bid)
            if let def = getDefinition(copy) {
                defs.append((bid, def))
            }
        }
        defs.sort(by: {a, b in a.1.prio > b.1.prio })
        for def in defs {
            let cb = ConstraintBatch.parse(def.1.constraint)
            if cb.validate(holding: holding) {
                return def.0
            }
        }
        return nil
    }
    
    public func getBidding(bidding: Bidding, defaultDefinition: Definition = .init()) -> [(Bid, Definition)] {
        var bids: [(Bid, Definition)] = []
        var currentBidding: Bidding = []
        for bid in bidding {
            currentBidding.append(bid)
            if let def = getDefinition(currentBidding) {
                bids.append((bid, def))
            } else {
                bids.append((bid, defaultDefinition))
            }
        }
        return bids
    }
    
    public func getBidding(deal: Deal, dealer: Direction = DIRECTION_NORTH, defaultDefinition: Definition = .init()) -> [(Bid, Definition)] {
        var bidding: Bidding = []
        var defs: [(Bid, Definition)] = []
        var dir = dealer
        while !bidding.isOver() {
            if let bid: Bid = getBid(holding: deal.getHolding(dir: dir), sequence: bidding) {
                bidding.append(bid)
            } else {
                bidding.append(BID_PASS)
            }
            if let def = getDefinition(bidding) {
                defs.append((bidding.last!, def))
            } else {
                defs.append((bidding.last!, defaultDefinition))
            }
            dir = dir.nextDirection()
        }
        return defs
    }
    
    public func toText() -> String {
        let content = definitions.keys
            .sorted { a, b in a.lexicographicallyPrecedes(b) }
            .map { k in
                let bids = k.map { $0.bidToShortString() }
                let bstring = bids.enumerated().map { (index, bid) in
                    index.isMultiple(of: 2) ? bid : "(\(bid))"
                }.joined(separator: "-")
                
                return "\(bstring):\(definitions[k]!.constraint) [P\(definitions[k]!.prio)]:\(definitions[k]!.descriptionString)"
            }
            .joined(separator: "\n")
        return content
    }
    
    public static func parseText(text: String) -> BiddingSystem {
        var sys = BiddingSystem()
        let lines = text.split(separator: "\n")
            
        for line in lines {
            let parts = line.split(separator: ":")
            if parts.count < 3 {
                continue
            }
            let sequence = parts[0].trimmingCharacters(in: .whitespaces)
            let constraint = parts[1].trimmingCharacters(in: .whitespaces)
            let description = parts[2].trimmingCharacters(in: .whitespaces)
            
            let bids = sequence.split(separator: "-")
            var bidding: Bidding = []
            var PREV_BID_WAS_OVERCALL = false
            for bid in bids {
                // if b starts with "(" and ends with ")"
                if bid.hasPrefix("(") && bid.hasSuffix(")") {
                    if PREV_BID_WAS_OVERCALL && !bidding.isEmpty {
                        bidding.append(BID_PASS)
                    }
                    // drop prefix and suffix
                    let innerBid = Bid.fromShortString(s: String(bid.dropFirst().dropLast()))
                    bidding.append(innerBid)
                    PREV_BID_WAS_OVERCALL = true
                } else {
                    if !PREV_BID_WAS_OVERCALL && !bidding.isEmpty {
                        bidding.append(BID_PASS)
                    }
                    let b = Bid.fromShortString(s: bid.trimmingCharacters(in: .whitespaces))
                    bidding.append(b)
                    PREV_BID_WAS_OVERCALL = false
                }
            }
            let prioPattern = #/\[P(-?\d+)\]/#
            var prio = 0
            if let match = constraint.firstMatch(of: prioPattern) {
                prio = Int(match.output.1)!
            }
            
            let def = Definition(description: String(description), constraint: String(constraint), prio: prio)
            sys.addDefinition(bidding, def)
        }
        return sys
    }
}


