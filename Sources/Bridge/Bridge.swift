// Bridge umbrella file
// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// This file intentionally left minimal. The Bridge module is now organized into:
// - BridgeTypes.swift: Core types, constants, and enums
// - BridgeExtensions.swift: Extensions on core types (Bidding, Bid, Holding, Direction, Strain, Card)
// - Contract.swift: Contract model and scoring helper
// - Deal.swift: Deal model, operations, parsing, and byte conversion
// - StringToHolding.swift: PBN/String <-> Holding conversion helpers
// - Vulnerability.swift: Vulnerability utilities
// - DealsIO.swift: Import/Export for Deal collections
// - DealState.swift: DealState and ExtendedDealState with (de)serialization
// - Dealer.swift: Constraint parsing and dealing utilities
// - BiddingSystem.swift: Bidding system representation and utilities
//
// Keeping this file small improves compile times and readability.

import Foundation
