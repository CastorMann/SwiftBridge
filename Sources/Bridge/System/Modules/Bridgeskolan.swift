//
//  Bridgeskolan.swift
//  Bridge
//
//  Created by Castor Mann on 2024-11-25.
//


@available(macOS 13.0, *)
@available(iOS 16.0, *)
public class Bridgeskolan {
    public static var System: BiddingSystem {
        var sys = BiddingSystem()
        sys.addModule(OpeningBids.System)
        sys.addModule(NTBidding.System)
        sys.addModule(TrumpSupport.System)
        sys.addModule(OneOverOne.System)
        return sys
    }
}
