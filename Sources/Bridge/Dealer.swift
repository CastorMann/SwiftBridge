// Constraints and Dealer utilities
// Extracted from Bridge.swift

import Foundation

public typealias Constraint = (Holding) -> Bool
public typealias ConstraintSet = [Constraint]
public typealias ConstraintBatch = [[ConstraintSet]]
public typealias ConstraintCollection = [Direction:ConstraintBatch]

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension ConstraintSet {
    func validate(holding: Holding) -> Bool {
        for f in self {
            if !f(holding) {
                return false
            }
        }
        return true
    }
    
    static func parse(_ text: String) -> ConstraintSet {
        return Dealer.getConstraint(text: text)
    }
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension ConstraintBatch {
    func validate(holding: Holding) -> Bool {
        for cs in self {
            var flag = false
            for css in cs {
                if css.validate(holding: holding) {
                    flag = true
                    break
                }
            }
            if !flag {
                return false
            }
        }
        return true
    }
    
    static func parse(_ text: String) -> ConstraintBatch {
        return text.split(separator: Dealer.REGEX_AND).map { $0.split(separator: Dealer.REGEX_OR).map({ ConstraintSet.parse(String($0)) })}
    }
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension ConstraintCollection {
    func validate(deal: Deal) -> Bool {
        for kvp in self {
            let holding = deal.getHolding(dir: kvp.key)
            if !kvp.value.validate(holding: holding) {
                return false
            }
        }
        return true
    }
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public class Dealer {
    static let REGEX_BINARY_OPERATOR = #/(hcp|spades|hearts|diamonds|clubs|\d+)\s*(<|>|=|>=|<=)\s*(hcp|spades|hearts|diamonds|clubs|\d+)/#
    static let REGEX_SHAPE = #/shape\s*([\dx])([\dx])([\dx])([\dx])/#
    static let REGEX_SHAPE_ANY = #/shape any\s*([\dx][SsHhDdCc]?)([\dx][SsHhDdCc]?)([\dx])([\dx])/#
    static let REGEX_BALANCED = #/\sbal|\sbalanced/#
    static let REGEX_UNBALANCED = #/unbal|unbalanced/#
    static let REGEX_RANGE = #/(\d+)-(\d+)\s+(hcp|spades|hearts|diamonds|clubs)/#
    
    static let REGEX_HOLDS = #/holds\(([AKQJT98765432][SHDC](?:,[AKQJT98765432][SHDC])*)\)/#
    static let REGEX_CUE = #/cue\((spades|hearts|diamonds|clubs)\)/#
    static let REGEX_STOPPER = #/stopper\((spades|hearts|diamonds|clubs)\)/#
    static let REGEX_KEYCARDS = #/kc\((spades|hearts|diamonds|clubs)\)\s*(<|>|=|>=|<=)\s*(\d+)/#
    static let REGEX_HCP_SUIT = #/hcp\((spades|hearts|diamonds|clubs)\)\s*(<|>|=|>=|<=)\s*(\d+)/#
    static let REGEX_STP = #/stp\((spades|hearts|diamonds|clubs),\s*(\d+)\)\s*(<|>|=|>=|<=)\s*(\d+)/#
    static let REGEX_STP_RANGE = #/(\d+)-(\d+)\s+stp\((spades|hearts|diamonds|clubs),\s*(\d+)\)/#

    
    static let REGEX_OR = #/\sor\s|\s\|\|\s/#
    static let REGEX_AND = #/\sand\s|\s\&\&/#

    public static func deal(constraint: String) -> Deal {
        let cb: ConstraintBatch = ConstraintBatch.parse(constraint)
        for _ in 0..<1000000 {
            let deal = Deal.random()
            if cb.validate(holding: deal.north) {
                return deal
            }
        }
        return Deal()
    }
    
    public static func deal(count: Int = 1, predeal: Deal = Deal()) -> [Deal] {
        var deals: [Deal] = []
        
        for _ in 0..<count {
            deals.append(Deal.random(predeal: predeal))
        }
        
        return deals
    }
    
    public static func deal(count: Int = 1, predeal: Deal = Deal(), constraints: ConstraintCollection) -> [Deal] {
        var deals: [Deal] = []
        
        var c = 0
        for _ in 0..<count*1000000 {
            let deal = Deal.random(predeal: predeal)
            if constraints.validate(deal: deal) {
                deals.append(deal)
                c += 1
            }
            if c == count {
                break
            }
        }
        
        return deals
    }
    
    public static func deal(constraints: ConstraintCollection) -> Deal {
        return deal(count: 1, constraints: constraints).first ?? Deal()
    }
    
    public static func getArgf(_ arg: Substring) -> (Holding) -> Int {
        switch arg {
        case "hcp": { h in h.hcp() }
        case "spades": { h in h.spades().nonzeroBitCount }
        case "hearts": { h in h.hearts().nonzeroBitCount }
        case "diamonds": { h in h.diamonds().nonzeroBitCount }
        case "clubs": { h in h.clubs().nonzeroBitCount }
        default: { h in Int(arg) ?? 0 }
        }
    }
    
    public static func getHcpSuitf(_ arg: Substring) -> (Holding) -> Int {
        switch arg {
        case "spades": { h in h.spades().hcp() }
        case "hearts": { h in h.hearts().hcp() }
        case "diamonds": { h in h.diamonds().hcp() }
        case "clubs": { h in h.clubs().hcp() }
        default: { h in 0 }
        }
    }
    
    public static func getStpf(_ arg: Substring, count: Int) -> (Holding) -> Int {
        switch arg {
        case "spades": { h in h.stp(strain: STRAIN_SPADE, count: count) }
        case "hearts": { h in h.stp(strain: STRAIN_HEART, count: count) }
        case "diamonds": { h in h.stp(strain: STRAIN_DIAMOND, count: count) }
        case "clubs": { h in h.stp(strain: STRAIN_CLUB, count: count) }
        default: { h in 0 }
        }
    }
    
    public static func getOpf(_ op: Substring) -> (Int, Int) -> Bool {
        switch op {
        case "=": { a, b in a == b }
        case ">": { a, b in a > b }
        case "<": { a, b in a < b }
        case ">=": { a, b in a >= b }
        case "<=": { a, b in a <= b }
        default: { a, b in true }
        }
    }
    
    public static func matchBinOp(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_BINARY_OPERATOR)
        for result in results {
            let arg1 = result.output.1
            let arg2 = result.output.3
            let op = result.output.2
            let arg1f: (Holding) -> Int = getArgf(arg1)
            let arg2f: (Holding) -> Int = getArgf(arg2)
            let opf: (Int, Int) -> Bool = getOpf(op)
            let f: Constraint = { h in opf(arg1f(h), arg2f(h)) }
            constraint.append(f)
        }
    }
    
    public static func matchShape(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_SHAPE)
        for result in results {
            let arg1: (Holding) -> Bool = switch result.output.1 {
            case "x": { h in true }
            default: { h in h.spades().nonzeroBitCount == Int(result.output.1) ?? 0}
            }
            let arg2: (Holding) -> Bool = switch result.output.2 {
            case "x": { h in true }
            default: { h in h.hearts().nonzeroBitCount == Int(result.output.2) ?? 0}
            }
            let arg3: (Holding) -> Bool = switch result.output.3 {
            case "x": { h in true }
            default: { h in h.diamonds().nonzeroBitCount == Int(result.output.3) ?? 0}
            }
            let arg4: (Holding) -> Bool = switch result.output.4 {
            case "x": { h in true }
            default: { h in h.clubs().nonzeroBitCount == Int(result.output.4) ?? 0}
            }
            let f: Constraint = { h in arg1(h)&&arg2(h)&&arg3(h)&&arg4(h) }
            constraint.append(f)
        }
    }
    
    public static func matchShapeAny(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_SHAPE_ANY)
        for result in results {
            var shape: [Int] = []
            if let arg1 = Int(result.output.1) { shape.append(arg1) }
            if let arg2 = Int(result.output.2) { shape.append(arg2) }
            if let arg3 = Int(result.output.3) { shape.append(arg3) }
            if let arg4 = Int(result.output.4) { shape.append(arg4) }
            
            
            let f: Constraint = { h in
                var fmap = [Int:Int]()
                for e in shape {
                    fmap[e, default: 0] += 1
                }
                var hshape: [Int] = [h.spades().nonzeroBitCount, h.hearts().nonzeroBitCount, h.diamonds().nonzeroBitCount, h.clubs().nonzeroBitCount]
                
                let suits: String = "shdc"
                var removeIndices: [Int] = []
                for arg in [result.output.1, result.output.2] {
                    if let fixedSuitLength = Int(String(arg.first!)), let index = suits.firstIndex(of: Character(arg.last!.lowercased())) {
                        let distance = suits.distance(from: suits.startIndex, to: index)
                        let v = hshape[distance]
                        if fixedSuitLength != v {
                            return false
                        }
                        removeIndices.append(distance)
                    }
                }
                for index in removeIndices.sorted(by: >) {
                    hshape.remove(at: index)
                }
                
                
                for element in hshape {
                    if let count = fmap[element] {
                        fmap[element] = count - 1
                        if count - 1 == 0 {
                            fmap.removeValue(forKey: element)
                        }
                        if fmap.isEmpty {
                            return true
                        }
                    }
                }
                return fmap.isEmpty
            }
            constraint.append(f)
        }
    }
    
    public static func matchBalanced(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        if text.contains(REGEX_BALANCED) {
            let f: Constraint = { hand in
                let s = hand.spades().nonzeroBitCount
                let h = hand.hearts().nonzeroBitCount
                let d = hand.diamonds().nonzeroBitCount
                let c = hand.clubs().nonzeroBitCount
                return s >= 2 && s <= 5 && h >= 2 && h <= 5 && d >= 2 && d <= 5 && c >= 2 && c <= 5 && s + h >= 5 && s + d >= 5 && s + c >= 5 && h + d >= 5 && h + c >= 5 && d + c >= 5
            }
            constraint.append(f)
        }
    }
    
    public static func matchUnbalanced(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        if text.contains(REGEX_UNBALANCED) {
            let f: Constraint = { hand in
                let s = hand.spades().nonzeroBitCount
                let h = hand.hearts().nonzeroBitCount
                let d = hand.diamonds().nonzeroBitCount
                let c = hand.clubs().nonzeroBitCount
                return !(s >= 2 && s <= 5 && h >= 2 && h <= 5 && d >= 2 && d <= 5 && c >= 2 && c <= 5 && s + h >= 5 && s + d >= 5 && s + c >= 5 && h + d >= 5 && h + c >= 5 && d + c >= 5)
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchRange(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_RANGE)
        for result in results {
            let arg1: Int = Int(result.output.1)!
            let arg2: Int = Int(result.output.2)!
            let value = getArgf(result.output.3)
            let f: Constraint = { h in
                let val = value(h)
                return arg1 <= val && val <= arg2
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchHolds(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_HOLDS)
        for result in results {
            let values: Holding = result.output.1.split(separator: ",").map {
                return Holding.fromShortString(String($0))
            }.reduce(Holding(0), { r, h in return r | h })
            let f: Constraint = { h in
                return h & values == values
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchCue(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_CUE)
        for result in results {
            let v = result.output.1
            let f: Constraint = { h in
                switch v {
                case "spades": return h.spades().nonzeroBitCount < 2 || h & HOLDING_ACE_OF_SPADES != 0 || h & HOLDING_KING_OF_SPADES != 0
                case "hearts": return h.hearts().nonzeroBitCount < 2 || h & HOLDING_ACE_OF_HEARTS != 0 || h & HOLDING_KING_OF_HEARTS != 0
                case "diamonds": return h.diamonds().nonzeroBitCount < 2 || h & HOLDING_ACE_OF_DIAMONDS != 0 || h & HOLDING_KING_OF_DIAMONDS != 0
                case "clubs": return h.clubs().nonzeroBitCount < 2 || h & HOLDING_ACE_OF_CLUBS != 0 || h & HOLDING_KING_OF_CLUBS != 0
                default: return false
                }
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchStopper(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_STOPPER)
        for result in results {
            let v = result.output.1
            let f: Constraint = { h in
                switch v {
                case "spades":
                    return h & HOLDING_ACE_OF_SPADES != 0 ||
                    (h & HOLDING_KING_OF_SPADES != 0 && h.spades().nonzeroBitCount > 1) ||
                    (h & HOLDING_QUEEN_OF_SPADES != 0 && h.spades().nonzeroBitCount > 2) ||
                    (h & HOLDING_JACK_OF_SPADES != 0 && h.spades().nonzeroBitCount > 3)
                case "hearts":
                    return h & HOLDING_ACE_OF_HEARTS != 0 ||
                    (h & HOLDING_KING_OF_HEARTS != 0 && h.hearts().nonzeroBitCount > 1) ||
                    (h & HOLDING_QUEEN_OF_HEARTS != 0 && h.hearts().nonzeroBitCount > 2) ||
                    (h & HOLDING_JACK_OF_HEARTS != 0 && h.hearts().nonzeroBitCount > 3)
                case "diamonds":
                    return h & HOLDING_ACE_OF_DIAMONDS != 0 ||
                    (h & HOLDING_KING_OF_DIAMONDS != 0 && h.diamonds().nonzeroBitCount > 1) ||
                    (h & HOLDING_QUEEN_OF_DIAMONDS != 0 && h.diamonds().nonzeroBitCount > 2) ||
                    (h & HOLDING_JACK_OF_DIAMONDS != 0 && h.diamonds().nonzeroBitCount > 3)
                case "clubs":
                    return h & HOLDING_ACE_OF_CLUBS != 0 ||
                    (h & HOLDING_KING_OF_CLUBS != 0 && h.clubs().nonzeroBitCount > 1) ||
                    (h & HOLDING_QUEEN_OF_CLUBS != 0 && h.clubs().nonzeroBitCount > 2) ||
                    (h & HOLDING_JACK_OF_CLUBS != 0 && h.clubs().nonzeroBitCount > 3)
                default: return false
                }
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchKeycards(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_KEYCARDS)
        for result in results {
            let opf = getOpf(result.output.2)
            let arg2 = Int(result.output.3) ?? 0
            let f: Constraint = { h in
                var arg1 = (h & ACES).nonzeroBitCount
                switch result.output.1 {
                case "spades": arg1 += h & HOLDING_KING_OF_SPADES != 0 ? 1 : 0
                case "hearts": arg1 += h & HOLDING_KING_OF_HEARTS != 0 ? 1 : 0
                case "diamonds": arg1 += h & HOLDING_KING_OF_DIAMONDS != 0 ? 1 : 0
                case "clubs": arg1 += h & HOLDING_KING_OF_CLUBS != 0 ? 1 : 0
                default: return true
                }
                return opf(arg1, arg2)
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchHcpSuit(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_HCP_SUIT)
        for result in results {
            let opf = getOpf(result.output.2)
            let arg1 = result.output.1
            let arg2 = Int(result.output.3) ?? 0
            let f: Constraint = { h in
                switch arg1 {
                case "spades": return opf(h.spades().hcp(), arg2)
                case "hearts": return opf(h.hearts().hcp(), arg2)
                case "diamonds": return opf(h.diamonds().hcp(), arg2)
                case "clubs": return opf(h.clubs().hcp(), arg2)
                default: return true
                }
            }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchStp(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_STP)
        for result in results {
            let opf = getOpf(result.output.3)
            let count = Int(result.output.2) ?? 0
            let stpf = getStpf(result.output.1, count: count)
            let arg3 = Int(result.output.4) ?? 0
            let f: Constraint = { h in opf(stpf(h), arg3) }
            constraint.append(f)
        }
    }
    
    fileprivate static func matchStpRange(_ text: String, _ constraint: inout [(UInt64) -> Bool]) {
        let results = text.matches(of: REGEX_STP_RANGE)
        for result in results {
            let arg1: Int = Int(result.output.1) ?? 0
            let arg2: Int = Int(result.output.2) ?? 0
            let count: Int = Int(result.output.4) ?? 0
            let stpf = getStpf(result.output.3, count: count)
            let f: Constraint = { h in
                let val = stpf(h)
                return arg1 <= val && val <= arg2
            }
            constraint.append(f)
        }
    }
    
    public static func getConstraint(text: String) -> ConstraintSet {
        var constraint: ConstraintSet = []
        
        matchBinOp(text, &constraint)
        matchShape(text, &constraint)
        matchShapeAny(text, &constraint)
        matchBalanced(text, &constraint)
        matchUnbalanced(text, &constraint)
        matchRange(text, &constraint)
        matchHolds(text, &constraint)
        matchCue(text, &constraint)
        matchStopper(text, &constraint)
        matchKeycards(text, &constraint)
        matchHcpSuit(text, &constraint)
        matchStp(text, &constraint)
        matchStpRange(text, &constraint)
        
        return constraint
    }
}

