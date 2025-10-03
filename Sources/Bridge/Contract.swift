// Contract model
// Extracted from Bridge.swift

import Foundation

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
