// BiddingSystem and related types
// Extracted from Bridge.swift

import Foundation

@available(macOS 13.0, *)
@available(iOS 16.0, *)
public struct BiddingSystem: Codable, Hashable {
    public struct Definition: Codable, Hashable {
        public var descriptionString: String
        public var constraint: String
        public var prio: Int = 0
        
        public var isEmpty: Bool {
            descriptionString.isEmpty && constraint.isEmpty
        }
        
        public init(description: String = "", constraint: String = "", prio: Int = 0) {
            self.descriptionString = description
            self.constraint = constraint
            self.prio = prio
        }
    }
    public class Node: Codable, Hashable, Identifiable {
        public var id: UUID = UUID()
        public var children: [Node]? = []
        public var bid: Bid
        public var definition: Definition
        public var parent: Node?
        
        public var bidding: Bidding {
            var bids: Bidding = []
            var currentNode: Node? = self
            while let node = currentNode {
                if node.bid == BID_NONE { break }
                bids.insert(node.bid, at: 0)
                currentNode = node.parent
            }
            return bids
        }
        
        public var isRoot: Bool { parent == nil }
        public var isLeaf: Bool { children == nil || children!.isEmpty}
        public var isUncontestedLeaf: Bool { uncontestedChildren == nil || uncontestedChildren!.isEmpty }
        
        public init(bid: Bid, definition: Definition, children: [Node] = [], parent: Node? = nil) {
            self.children = children
            self.bid = bid
            self.definition = definition
            self.parent = parent
        }
        
        public var computeModule: BiddingSystem {
            var module = BiddingSystem()
            func recursiveAdd(_ node: Node, currentBidding: Bidding) {
                module.addDefinition(currentBidding + [node.bid], node.definition)
                for child in node.children ?? [] {
                    recursiveAdd(child, currentBidding: currentBidding + [node.bid])
                }
            }
            recursiveAdd(self, currentBidding: [])
            
            return module
        }
        
        public var uncontestedChildren: [Node]? {
            children?.first(where: { $0.bid == BID_PASS })?.children?.sorted(by: { a, b in
                a.bid < b.bid
            })
        }
        
        public func getNode(_ bidding: Bidding) -> Node? {
            var currentNode = self
            for bid in bidding {
                if let nextNode = currentNode.children?.first(where: { node in node.bid == bid }) {
                    currentNode = nextNode
                } else {
                    return nil
                }
            }
            return currentNode
        }
        
        public func addModule(_ node: Node, shouldOverwrite: Bool = false, isUncontested: Bool = false) {
            let path: Bidding = (isUncontested ? [BID_PASS] : []) + node.bidding
            addDefinition(node.definition, at: path, shouldOverwrite: shouldOverwrite)
            for child in node.children ?? [] {
                addModule(child, shouldOverwrite: shouldOverwrite, isUncontested: isUncontested)
            }
        }
        
        public func addDefinition(_ definition: Definition, at bidding: Bidding, shouldOverwrite: Bool = false) {
            var currentNode = self
            for bid in bidding {
                if let nextNode = currentNode.children?.first(where: { node in node.bid == bid }) {
                    currentNode = nextNode
                } else {
                    let nextNode = Node(bid: bid, definition: BiddingSystem.Definition(), parent: currentNode)
                    if let index = currentNode.children?.firstIndex(where: { node in node.bid > bid }) {
                        currentNode.children?.insert(nextNode, at: index)
                    } else {
                        currentNode.children?.append(nextNode)
                    }
                    currentNode = nextNode
                }
            }
            if shouldOverwrite || currentNode.definition.isEmpty {
                currentNode.definition = definition
            }
        }
        
        public func insertDefinition(_ definition: Definition, at bidding: Bidding) {
            if let node = getNode(bidding) {
                node.definition = definition
            }
        }
        
        public static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.id == rhs.id
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    public var definitions: [Bidding:Definition] = [:]
    
    public var definitionCount: Int {
        return definitions.count(where: { !$0.value.isEmpty })
    }
    
    public init() {
        
    }
    
    public func buildTree() -> Node {
        var root = Node(bid: BID_NONE, definition: Definition(), parent: nil)
        
        for (bidding, definition) in definitions {
            var currentNode = root
            for bid in bidding {
                if let nextNode = currentNode.children?.first(where: { $0.bid == bid }) {
                    currentNode = nextNode
                } else {
                    let newNode = Node(bid: bid, definition: Definition(), parent: currentNode)
                    if let index = currentNode.children?.firstIndex(where: { $0.bid > bid }) {
                        currentNode.children?.insert(newNode, at: index)
                    } else {
                        currentNode.children?.append(newNode)
                    }
                    
                    currentNode = newNode
                }
            }
            currentNode.definition = definition
        }
        
        return root
    }
    
    public mutating func addModule(_ system: BiddingSystem, overwrite: Bool = false, overwriteEmpty: Bool = false, initialPath: Bidding = []) {
        for (bidding, definition) in system.definitions {
            addDefinition(initialPath + bidding, definition, shouldOverwrite: overwrite && (!definition.isEmpty || overwriteEmpty))
        }
    }
    
    public func getDefinition(_ bidding: Bidding, exactMatch: Bool = false) -> Definition? {
        return definitions[bidding] ?? (exactMatch ? nil : getDefinition(Array(bidding.drop(while: { $0 == BID_PASS})), exactMatch: true))
    }
    
    public mutating func addDefinition(_ bidding: Bidding, _ definition: Definition, shouldOverwrite: Bool = false) {
        guard !bidding.isEmpty else { return }
        
        if shouldOverwrite || (definitions[bidding]?.isEmpty ?? true) {
            definitions[bidding] = definition
        }
    }
    
    public mutating func updateDefinition(_ definition: Definition, for bidding: Bidding) {
        addDefinition(bidding, definition, shouldOverwrite: true)
    }
    
    public mutating func updateDefinitionDescription(_ description: String, for bidding: Bidding) {
        var newDefinition = getDefinition(bidding) ?? Definition()
        newDefinition.descriptionString = description
        addDefinition(bidding, newDefinition, shouldOverwrite: true)
    }
    
    public mutating func updateDefinitionConstraints(_ constraints: String, for bidding: Bidding) {
        var newDefinition = getDefinition(bidding) ?? Definition()
        newDefinition.constraint = constraints
        addDefinition(bidding, newDefinition, shouldOverwrite: true)
    }
    
    public mutating func updateDefinitionPriority(_ priority: Int, for bidding: Bidding) {
        var newDefinition = getDefinition(bidding) ?? Definition()
        newDefinition.prio = priority
        addDefinition(bidding, newDefinition, shouldOverwrite: true)
    }
    
    public mutating func removeDefinition(_ bidding: Bidding) {
        guard !bidding.isEmpty else { return }
        
        let keys = definitions.keys.filter( { $0.starts(with: bidding) } )
        for key in keys {
            definitions.removeValue(forKey: key)
        }
    }
    
    public func isDefined(_ bidding: Bidding) -> Bool {
        return !(getDefinition(bidding)?.isEmpty ?? true)
    }

    
    public func getBid(holding: Holding, sequence: Bidding) -> Bid? {
        var defs: [(Bid, Definition)] = []
        for bid in BIDS_ALL {
            var copy = sequence
            copy.append(bid)
            if let def = getDefinition(copy) {
                defs.append((bid, def))
            }
        }
        defs.sort(by: {a, b in a.1.prio > b.1.prio })
        for def in defs {
            let cb = ConstraintBatch.parse(def.1.constraint)
            if cb.validate(holding: holding) {
                return def.0
            }
        }
        return nil
    }
    
    public func getBidding(bidding: Bidding, defaultDefinition: Definition = .init()) -> [(Bid, Definition)] {
        var bids: [(Bid, Definition)] = []
        var currentBidding: Bidding = []
        for bid in bidding {
            currentBidding.append(bid)
            if let def = getDefinition(currentBidding) {
                bids.append((bid, def))
            } else {
                bids.append((bid, defaultDefinition))
            }
        }
        return bids
    }
    
    public func getBidding(deal: Deal, dealer: Direction = DIRECTION_NORTH, defaultDefinition: Definition = .init()) -> [(Bid, Definition)] {
        var bidding: Bidding = []
        var defs: [(Bid, Definition)] = []
        var dir = dealer
        while !bidding.isOver() {
            if let bid: Bid = getBid(holding: deal.getHolding(dir: dir), sequence: bidding) {
                bidding.append(bid)
            } else {
                bidding.append(BID_PASS)
            }
            if let def = getDefinition(bidding) {
                defs.append((bidding.last!, def))
            } else {
                defs.append((bidding.last!, defaultDefinition))
            }
            dir = dir.nextDirection()
        }
        return defs
    }
    
    public func toText() -> String {
        let content = definitions.keys
            .sorted { a, b in a.lexicographicallyPrecedes(b) }
            .map { k in
                let bids = k.map { $0.bidToShortString() }
                let bstring = bids.enumerated().map { (index, bid) in
                    index.isMultiple(of: 2) ? bid : "(\(bid))"
                }.joined(separator: "-")
                
                return "\(bstring):\(definitions[k]!.constraint) [P\(definitions[k]!.prio)]:\(definitions[k]!.descriptionString)"
            }
            .joined(separator: "\n")
        return content
    }
    
    public static func parseText(text: String) -> BiddingSystem {
        var sys = BiddingSystem()
        let lines = text.split(separator: "\n")
            
        for line in lines {
            let parts = line.split(separator: ":")
            if parts.count < 3 {
                continue
            }
            let sequence = parts[0].trimmingCharacters(in: .whitespaces)
            let constraint = parts[1].trimmingCharacters(in: .whitespaces)
            let description = parts[2].trimmingCharacters(in: .whitespaces)
            
            let bids = sequence.split(separator: "-")
            var bidding: Bidding = []
            var PREV_BID_WAS_OVERCALL = false
            for bid in bids {
                // if b starts with "(" and ends with ")"
                if bid.hasPrefix("(") && bid.hasSuffix(")") {
                    if PREV_BID_WAS_OVERCALL && !bidding.isEmpty {
                        bidding.append(BID_PASS)
                    }
                    // drop prefix and suffix
                    let innerBid = Bid.fromShortString(s: String(bid.dropFirst().dropLast()))
                    bidding.append(innerBid)
                    PREV_BID_WAS_OVERCALL = true
                } else {
                    if !PREV_BID_WAS_OVERCALL && !bidding.isEmpty {
                        bidding.append(BID_PASS)
                    }
                    let b = Bid.fromShortString(s: bid.trimmingCharacters(in: .whitespaces))
                    bidding.append(b)
                    PREV_BID_WAS_OVERCALL = false
                }
            }
            let prioPattern = #/\[P(-?\d+)\]/#
            var prio = 0
            if let match = constraint.firstMatch(of: prioPattern) {
                prio = Int(match.output.1)!
            }
            
            let def = Definition(description: String(description), constraint: String(constraint), prio: prio)
            sys.addDefinition(bidding, def)
        }
        return sys
    }
}
