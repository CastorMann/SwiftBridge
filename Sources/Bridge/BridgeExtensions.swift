// Extensions for core bridge types
// Extracted from Bridge.swift

import Foundation

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
    
    func cardToShortString() -> String {
        return "\(cardGetStrain().strainToShortString())\(cardGetRankString())"
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
    
    func holdingToCard() -> Card {
        return Card(self.trailingZeroBitCount)
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
        case "5N": return BID_5_NT

        case "6C": return BID_6_CLUBS
        case "6D": return BID_6_DIAMONDS
        case "6H": return BID_6_HEARTS
        case "6S": return BID_6_SPADES
        case "6N": return BID_6_NT

        case "7C": return BID_7_CLUBS
        case "7D": return BID_7_DIAMONDS
        case "7H": return BID_7_HEARTS
        case "7S": return BID_7_SPADES
        case "7N": return BID_7_NT

        default: return 0
        }

    }
}
