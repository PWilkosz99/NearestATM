import SwiftUI

@main
struct NearestATMApp: App {
    
    func readAndDecodeJSON() {
        do {
            let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("atms_krk.json")

            let jsonData = try Data(contentsOf: fileURL)
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("Raw JSON Data:")
                    print(jsonString)
                }

            let decoder = JSONDecoder()
            let atmArray = try decoder.decode(OSMWrapper.self, from: jsonData)

            print(atmArray.elements)
            ATMs = atmArray.elements
            
        } catch {
            print("Error reading or decoding JSON: \(error)")
        }
    }

    @State private var ATMs = [ATM]()
    
    var body: some Scene {
        WindowGroup {
            ATMsView(atms: $ATMs)
                .onAppear {
                    readAndDecodeJSON()
                }
        }
    }
}
