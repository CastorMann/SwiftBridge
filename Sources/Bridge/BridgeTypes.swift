// Core types and constants for Bridge module
// Extracted from Bridge.swift

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

