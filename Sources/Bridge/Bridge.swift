// The Swift Programming Language
// https://docs.swift.org/swift-book
typealias Holding = UInt64
let DECK: Holding = 4503599627370495
let CLUBS: Holding = 8191
let DIAMONDS: Holding = 67100672
let HEARTS: Holding = 549688705024
let SPADES: Holding = 4503049871556608
let ACES: Holding = 2252074725150720
let KINGS: Holding = 1126037362575360
let QUEENS: Holding = 563018681287680
let JACKS: Holding = 281509340643840

typealias Strain = UInt8
let STRAIN_CLUB: Strain = 1
let STRAIN_DIAMOND: Strain = 2
let STRAIN_HEART: Strain = 4
let STRAIN_SPADE: Strain = 8
let STRAIN_NT: Strain = 16
let STRAIN_MINORS: Strain = 3
let STRAIN_MAJORS: Strain = 12
let STRAIN_SOFT: Strain = 5
let STRAIN_HARD: Strain = 10
let STRAIN_RED: Strain = 6
let STRAIN_BLACK: Strain = 9
let STRAIN_ALL: Strain = 31

typealias Bid = UInt8
let BID_PASS: Bid = 0
let BID_DOUBLE: Bid = 1
let BID_REDOUBLE: Bid = 2
let BID_1_CLUBS: Bid = 33
let BID_2_CLUBS: Bid = 65
let BID_3_CLUBS: Bid = 97
let BID_4_CLUBS: Bid = 129
let BID_5_CLUBS: Bid = 161
let BID_6_CLUBS: Bid = 193
let BID_7_CLUBS: Bid = 225
let BID_1_DIAMONDS: Bid = 34
let BID_2_DIAMONDS: Bid = 66
let BID_3_DIAMONDS: Bid = 98
let BID_4_DIAMONDS: Bid = 130
let BID_5_DIAMONDS: Bid = 162
let BID_6_DIAMONDS: Bid = 194
let BID_7_DIAMONDS: Bid = 226
let BID_1_HEARTS: Bid = 36
let BID_2_HEARTS: Bid = 68
let BID_3_HEARTS: Bid = 100
let BID_4_HEARTS: Bid = 132
let BID_5_HEARTS: Bid = 164
let BID_6_HEARTS: Bid = 196
let BID_7_HEARTS: Bid = 228
let BID_1_SPADES: Bid = 40
let BID_2_SPADES: Bid = 72
let BID_3_SPADES: Bid = 104
let BID_4_SPADES: Bid = 136
let BID_5_SPADES: Bid = 168
let BID_6_SPADES: Bid = 200
let BID_7_SPADES: Bid = 232
let BID_1_NT: Bid = 48
let BID_2_NT: Bid = 80
let BID_3_NT: Bid = 112
let BID_4_NT: Bid = 144
let BID_5_NT: Bid = 176
let BID_6_NT: Bid = 208
let BID_7_NT: Bid = 240

typealias Direction = UInt8
let DIRECTION_NORTH = 1
let DIRECTION_EAST = 2
let DIRECTION_SOUTH = 4
let DIRECTION_WEST = 8
let DIRECTION_NORTH_SOUTH = 5
let DIRECTION_EAST_WEST = 10
let DIRECTION_ALL = 15
let DIRECTION_NONE = 0

typealias Modifier = UInt8
let MODIFIER_PASSED = 0
let MODIFIER_DOUBLED = 1
let MODIFIER_REDOUBLED = 2

typealias Card = UInt8
let CARD_TWO_OF_CLUBS: Card = 0
let CARD_THREE_OF_CLUBS: Card = 1
let CARD_FOUR_OF_CLUBS: Card = 2
let CARD_FIVE_OF_CLUBS: Card = 3
let CARD_SIX_OF_CLUBS: Card = 4
let CARD_SEVEN_OF_CLUBS: Card = 5
let CARD_EIGHT_OF_CLUBS: Card = 6
let CARD_NINE_OF_CLUBS: Card = 7
let CARD_TEN_OF_CLUBS: Card = 8
let CARD_JACK_OF_CLUBS: Card = 9
let CARD_QUEEN_OF_CLUBS: Card = 10
let CARD_KING_OF_CLUBS: Card = 11
let CARD_ACE_OF_CLUBS: Card = 12
let CARD_TWO_OF_DIAMONDS: Card = 13
let CARD_THREE_OF_DIAMONDS: Card = 14
let CARD_FOUR_OF_DIAMONDS: Card = 15
let CARD_FIVE_OF_DIAMONDS: Card = 16
let CARD_SIX_OF_DIAMONDS: Card = 17
let CARD_SEVEN_OF_DIAMONDS: Card = 18
let CARD_EIGHT_OF_DIAMONDS: Card = 19
let CARD_NINE_OF_DIAMONDS: Card = 20
let CARD_TEN_OF_DIAMONDS: Card = 21
let CARD_JACK_OF_DIAMONDS: Card = 22
let CARD_QUEEN_OF_DIAMONDS: Card = 23
let CARD_KING_OF_DIAMONDS: Card = 24
let CARD_ACE_OF_DIAMONDS: Card = 25
let CARD_TWO_OF_HEARTS: Card = 26
let CARD_THREE_OF_HEARTS: Card = 27
let CARD_FOUR_OF_HEARTS: Card = 28
let CARD_FIVE_OF_HEARTS: Card = 29
let CARD_SIX_OF_HEARTS: Card = 30
let CARD_SEVEN_OF_HEARTS: Card = 31
let CARD_EIGHT_OF_HEARTS: Card = 32
let CARD_NINE_OF_HEARTS: Card = 33
let CARD_TEN_OF_HEARTS: Card = 34
let CARD_JACK_OF_HEARTS: Card = 35
let CARD_QUEEN_OF_HEARTS: Card = 36
let CARD_KING_OF_HEARTS: Card = 37
let CARD_ACE_OF_HEARTS: Card = 38
let CARD_TWO_OF_SPADES: Card = 39
let CARD_THREE_OF_SPADES: Card = 40
let CARD_FOUR_OF_SPADES: Card = 41
let CARD_FIVE_OF_SPADES: Card = 42
let CARD_SIX_OF_SPADES: Card = 43
let CARD_SEVEN_OF_SPADES: Card = 44
let CARD_EIGHT_OF_SPADES: Card = 45
let CARD_NINE_OF_SPADES: Card = 46
let CARD_TEN_OF_SPADES: Card = 47
let CARD_JACK_OF_SPADES: Card = 48
let CARD_QUEEN_OF_SPADES: Card = 49
let CARD_KING_OF_SPADES: Card = 50
let CARD_ACE_OF_SPADES: Card = 51


extension Holding {
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
}

extension Bid {
    func strain() -> Strain {
        return self & STRAIN_ALL
    }
    
    func level() -> UInt8 {
        return self >> 5
    }
    
    func scoreContract(tricks: Int, modifier: Modifier, vul: Bool) -> Int {
        
        return 0 // todo
    }
}

struct Deal {
    var north: Holding
    var east: Holding
    var south: Holding
    var west: Holding
}

struct DealState {
    var deal: Deal
    var play: [Card]
    var bidding: [Bid]
}

