//
//  ATMStore.swift
//  NearestATM
//
//  Created by Piotr Wilkosz on 09/01/2024.
//

import Foundation

class ATMStore: ObservableObject{
    @Published var atms: [ATM] = []
    
    private static let key = "atmsDataKey"
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("atms.data")
    }
    func save(atms: [ATM]) async throws {
        let task = Task {
                let data = try JSONEncoder().encode(atms)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
                print(outfile)
            }
            _ = try await task.value
        print("saved(store)")
        }
    
    func load() async throws {
        let task = Task<[ATM], Error> {
                    let fileURL = try Self.fileURL()
                    print(fileURL)
                    guard let data = try? Data(contentsOf: fileURL) else {
                        return []
                    }
                    let atmData = try JSONDecoder().decode([ATM].self, from: data)
                    return atmData
                }
                let atms = try await task.value
                self.atms = atms
    }
    
    func loadFromJSON() async throws{
        
        let task = Task<[ATM], Error> {
            let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("atms_krk.json")
            
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let atmData = try decoder.decode(OSMWrapper.self, from: jsonData)
            return atmData.elements
        }
        
        let atms = try await task.value
        self.atms = atms
    }
}
