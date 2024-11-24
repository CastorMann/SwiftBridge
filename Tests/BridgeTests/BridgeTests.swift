import XCTest
@testable import Bridge

final class BridgeTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        print(BID_4_CLUBS.scoreContract(tricks: 12, modifier: Modifier.REDOUBLED, vul: true))
        let deal = Dealer.deal(constraint: "15-17 hcp bal")
        print(deal.toPBN())
        var bidding: Bidding = []
        var dir: Direction = DIRECTION_NORTH
        while true {
            if let bid = NTBidding.System.getBid(holding: deal.getHolding(dir: dir), sequence: bidding) {
                bidding.append(bid)
                bidding.append(BID_PASS)
                dir = dir == DIRECTION_NORTH ? DIRECTION_SOUTH : DIRECTION_NORTH
                if bid == BID_PASS {
                    break
                }
            } else {
                break
            }
        }
        print(bidding.map({b in b.bidToShortString()}))
    }
}
