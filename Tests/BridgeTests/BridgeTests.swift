import XCTest
@testable import Bridge

final class BridgeTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        let strains: [String] = ["CLUBS", "DIAMONDS", "HEARTS", "SPADES", "NT"]
        let ranks: [String] = ["TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "JACK", "QUEEN", "KING", "ACE"]
        for s in 0..<52 {
            print("let CARD_\(ranks[s % 13])_OF_\(strains[s / 13]): Card = \(s)")
            
        }
    }
}
