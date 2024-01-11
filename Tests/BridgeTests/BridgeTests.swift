import XCTest
@testable import Bridge

final class BridgeTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        print(BID_4_CLUBS.scoreContract(tricks: 12, modifier: Modifier.REDOUBLED, vul: true))
    }
}
