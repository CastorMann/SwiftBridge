// The Swift Programming Language
// https://docs.swift.org/swift-book
public let ranks: [String] = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]

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
public let BID_PASS: Bid = 0
public let BID_DOUBLE: Bid = 1
public let BID_REDOUBLE: Bid = 2
public let BID_NONE: Bid = 3
public let BID_1_CLUBS: Bid = 33
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
public let CARD_TWO_OF_CLUBS: Card = 0
public let CARD_THREE_OF_CLUBS: Card = 1
public let CARD_FOUR_OF_CLUBS: Card = 2
public let CARD_FIVE_OF_CLUBS: Card = 3
public let CARD_SIX_OF_CLUBS: Card = 4
public let CARD_SEVEN_OF_CLUBS: Card = 5
public let CARD_EIGHT_OF_CLUBS: Card = 6
public let CARD_NINE_OF_CLUBS: Card = 7
public let CARD_TEN_OF_CLUBS: Card = 8
public let CARD_JACK_OF_CLUBS: Card = 9
public let CARD_QUEEN_OF_CLUBS: Card = 10
public let CARD_KING_OF_CLUBS: Card = 11
public let CARD_ACE_OF_CLUBS: Card = 12
public let CARD_TWO_OF_DIAMONDS: Card = 13
public let CARD_THREE_OF_DIAMONDS: Card = 14
public let CARD_FOUR_OF_DIAMONDS: Card = 15
public let CARD_FIVE_OF_DIAMONDS: Card = 16
public let CARD_SIX_OF_DIAMONDS: Card = 17
public let CARD_SEVEN_OF_DIAMONDS: Card = 18
public let CARD_EIGHT_OF_DIAMONDS: Card = 19
public let CARD_NINE_OF_DIAMONDS: Card = 20
public let CARD_TEN_OF_DIAMONDS: Card = 21
public let CARD_JACK_OF_DIAMONDS: Card = 22
public let CARD_QUEEN_OF_DIAMONDS: Card = 23
public let CARD_KING_OF_DIAMONDS: Card = 24
public let CARD_ACE_OF_DIAMONDS: Card = 25
public let CARD_TWO_OF_HEARTS: Card = 26
public let CARD_THREE_OF_HEARTS: Card = 27
public let CARD_FOUR_OF_HEARTS: Card = 28
public let CARD_FIVE_OF_HEARTS: Card = 29
public let CARD_SIX_OF_HEARTS: Card = 30
public let CARD_SEVEN_OF_HEARTS: Card = 31
public let CARD_EIGHT_OF_HEARTS: Card = 32
public let CARD_NINE_OF_HEARTS: Card = 33
public let CARD_TEN_OF_HEARTS: Card = 34
public let CARD_JACK_OF_HEARTS: Card = 35
public let CARD_QUEEN_OF_HEARTS: Card = 36
public let CARD_KING_OF_HEARTS: Card = 37
public let CARD_ACE_OF_HEARTS: Card = 38
public let CARD_TWO_OF_SPADES: Card = 39
public let CARD_THREE_OF_SPADES: Card = 40
public let CARD_FOUR_OF_SPADES: Card = 41
public let CARD_FIVE_OF_SPADES: Card = 42
public let CARD_SIX_OF_SPADES: Card = 43
public let CARD_SEVEN_OF_SPADES: Card = 44
public let CARD_EIGHT_OF_SPADES: Card = 45
public let CARD_NINE_OF_SPADES: Card = 46
public let CARD_TEN_OF_SPADES: Card = 47
public let CARD_JACK_OF_SPADES: Card = 48
public let CARD_QUEEN_OF_SPADES: Card = 49
public let CARD_KING_OF_SPADES: Card = 50
public let CARD_ACE_OF_SPADES: Card = 51

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
}


public extension Holding {
    func hcp() -> Int {
        return
            (self & ACES).nonzeroBitCount * 4 +
            (self & KINGS).nonzeroBitCount * 3 +
            (self & QUEENS).nonzeroBitCount * 2 +
            (self & JACKS).nonzeroBitCount
    }
    
    func spades() -> UInt64 {
        return self & SPADES
    }
    
    func hearts() -> UInt64 {
        return self & HEARTS
    }
    
    func diamonds() -> UInt64 {
        return self & DIAMONDS
    }
    
    func clubs() -> UInt64 {
        return self & CLUBS
    }
    
    func toPBN() -> String {
        var sb = ""
        for i in (0..<13).reversed() {
            if (self >> (39 + i)) & 1 == 1 {
                sb += ranks[i]
            }
        }
        sb += "."
        for i in (0..<13).reversed() {
            if (self >> (26 + i)) & 1 == 1 {
                sb += ranks[i]
            }
        }
        sb += "."
        for i in (0..<13).reversed() {
            if (self >> (13 + i)) & 1 == 1 {
                sb += ranks[i]
            }
        }
        sb += "."
        for i in (0..<13).reversed() {
            if (self >> i) & 1 == 1 {
                sb += ranks[i]
            }
        }
        return sb
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
}

public struct Deal : Codable {
    public var north: Holding
    public var east: Holding
    public var south: Holding
    public var west: Holding
    
    public init(_ north: Holding = 0, _ east: Holding = 0, _ south: Holding = 0, _ west: Holding = 0) {
        self.north = north
        self.east = east
        self.south = south
        self.west = west
    }
}

public struct DealState : Codable {
    public var deal: Deal
    public var play: [Card]
    public var bidding: [Bid]
}

public struct Contract : Codable {
    public var bid: Bid
    public var declarer: Direction
    public var modifier: Modifier
    
    public init(bid: Bid, declarer: Direction, modifier: Modifier) {
        self.bid = bid
        self.declarer = declarer
        self.modifier = modifier
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
    
}

func StringToHolding(pbn: String) -> UInt64 {
    var holding: UInt64 = 0
    let parts = pbn.split(separator: ".", maxSplits: 3, omittingEmptySubsequences: false)
    
    for suit in [0, 1, 2, 3] {
        holding |= SuitToHolding(pbn: String(parts[3 - Int(suit)]), strain: 1 << suit)
    }
    
    return holding
}

func SuitToHolding(pbn: String, strain: Strain) -> UInt64 {
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

func SpadesToHolding(pbn: String) -> UInt64 {
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

func HeartsToHolding(pbn: String) -> UInt64 {
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

func DiamondsToHolding(pbn: String) -> UInt64 {
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

func ClubsToHolding(pbn: String) -> UInt64 {
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


func nsvul(_ boardNumber: Int) -> Bool {
    let b = (boardNumber - 1) & 15
    return (b ^ (b >> 2)) & 1 == 1
}

func ewvul(_ boardNumber: Int) -> Bool {
    let b = (boardNumber - 1) & 15
    return (b + (b >> 2)) & 2 == 2
}

public func vulnerability(_ boardNumber: Int) -> Direction {
    return (nsvul(boardNumber) ? DIRECTION_NORTH_SOUTH : DIRECTION_NONE) | (ewvul(boardNumber) ? DIRECTION_EAST_WEST : DIRECTION_NONE)
}
