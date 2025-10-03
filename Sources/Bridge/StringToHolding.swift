// Conversions between strings and holdings
// Extracted from Bridge.swift

import Foundation

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
