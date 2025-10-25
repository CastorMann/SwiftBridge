// Import/Export for arrays of Deal and ExportFormat
// Extracted from Bridge.swift

import Foundation

public enum ExportFormat {
    case PBN
    case DUP
    case BIN
    case JSON
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension Array where Element == Deal {
    static func importFromFile(_ url: URL, _ format: ExportFormat? = nil) throws -> [Deal] {
        var deals: [Deal] = []
        print(url)
        switch format {
        case .PBN:
            try deals = self.importPBN(url)
        case .DUP:
            try deals = self.importDUP(url)
        case .BIN:
            try deals = self.importBIN(url)
        case .JSON:
            try deals = self.importJSON(url)
        case nil:
            switch url.pathExtension.lowercased() {
            case "pbn":
                try deals = self.importFromFile(url, .PBN)
            case "dup":
                try deals = self.importFromFile(url, .DUP)
            case "json":
                try deals = self.importFromFile(url, .JSON)
            case "bin":
                try deals = self.importFromFile(url, .BIN)
            default:
                throw NSError(domain: "DealsImportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "File extension not supported for deals import: \(url.pathExtension)"])
            }
        }
        
        return deals
    }
    
    static func importDUP(_ url: URL) throws -> [Deal] {
        return []
    }
    
    static func importBIN(_ url: URL) throws -> [Deal] {
        return []
    }
    
    static func importJSON(_ url: URL) throws -> [Deal] {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let deals = try decoder.decode([Deal].self, from: data)
            return deals
        } catch {
            throw NSError(domain: "DealsImportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Could not parse JSON data"])
        }
    }
    
    static func importPBN(_ url: URL) throws -> [Deal] {
        var deals: [Deal] = []
        print("importing pbn")
        do {
            let contents = try String(contentsOf: url, encoding: .utf8)
            let lines = contents.components(separatedBy: .newlines)
            for line in lines {
                if let match = line.firstMatch(of: #/\[Deal "([NESW]):([23456789TJQKA\s\.]+)"\]/#) {
                    let deal = Deal.parse(pbn: match.2.description, format: match.1.description)
                    deals.append(deal)
                    print(deal.toPBN())
                } else {
                    print("no match for line \(line)")
                }
            }
        } catch {
            throw NSError(domain: "DealsImportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Could not parse PBN data"])
        }
        
        return deals
    }
    
    func exportToFile(_ url: URL, _ format: ExportFormat? = nil) throws {
        switch format {
        case .PBN:
            try self.exportPBN(url)
        case .DUP:
            try self.exportDUP(url)
        case .BIN:
            try self.exportBIN(url)
        case .JSON:
            try self.exportJSON(url)
        case .none:
            switch url.pathExtension.lowercased() {
            case "pbn":
                try self.exportToFile(url, .PBN)
            case "dup":
                try self.exportToFile(url, .DUP)
            case "json":
                try self.exportToFile(url, .JSON)
            case "bin":
                try self.exportToFile(url, .BIN)
            default:
                throw NSError(domain: "DealsExportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "File extension not supported for deals export: \(url.pathExtension)"])
            }
        }
    }
    
    static func from(bytes: [UInt8]) throws -> [Deal] {
        var deals: [Deal] = []
        
        var readPointer = 0
        let readEnd = bytes.count
        
        while readPointer + 32 <= readEnd {
            do {
                let bs: [UInt8] = Swift.Array<UInt8>(bytes[readPointer..<readPointer+32])
                let deal: Deal = try Deal.from(bytes: bs)
                readPointer += 32
                
                deals.append(deal)
            }
            catch {
                throw error
            }
        }
        
        return deals
    }
    
    func toBytes() -> [UInt8] {
        var bytes: [UInt8] = []
        for deal in self {
            bytes.append(contentsOf: deal.toBytes())
        }
        return bytes
    }
    
    func exportBIN(_ url: URL) throws {
        let bytes: [UInt8] = toBytes()
        
        let data = Data(bytes)
        do {
            try data.write(to: url)
        } catch {
            throw error
        }
    }
    
    func exportJSON(_ url: URL) throws {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            try data.write(to: url)
        } catch {
            throw NSError(domain: "DealsExportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Unable to convert to JSON data"])
        }
    }
    
    func exportPBN(_ url: URL) throws {
        var sb = ""
        var bn = 1
        for deal in self {
            sb += "[Board \"\(bn)\"]\n"
            sb += "[Deal \"N:\(deal.toPBN())\"]\n"
            bn += 1
        }
        
        if let data = sb.data(using: .utf8) {
            do {
                try data.write(to: url)
            } catch {
                throw error
            }
        } else {
            throw NSError(domain: "DealsExportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Unable to convert string to UTF-8 data."])
        }
    }
    
    func exportDUP(_ url: URL) throws {
        var sb = ""
        for deal in self {
            sb += deal.toDUP()
            sb += "YN1"
            sb += String(format: "  1%3d ", self.count)
        }
        
        if let data = sb.data(using: .utf8) {
            do {
                try data.write(to: url)
            } catch {
                throw error
            }
        } else {
            throw NSError(domain: "DealsExportError", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Unable to convert string to UTF-8 data."])
        }
    }
}

