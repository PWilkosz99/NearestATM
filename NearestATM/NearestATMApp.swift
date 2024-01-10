import SwiftUI

@main
struct NearestATMApp: App {
    @StateObject private var store = ATMStore()

    @State private var ATMs = [ATM]()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ATMsView(atms: $store.atms, saveAction: {
                    Task {
                        do {
                            try await store.save(atms: store.atms)
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                }, refreshAction: {
                    Task{
                        try await store.loadFromJSON()
                    }
                })
                    .tabItem {
                        Label("List view", systemImage: "list.bullet")
                    }
                MapView(atms: $store.atms)
                    .tabItem {
                        Label("Map view", systemImage: "map.circle.fill")
                    }
            }
            .task{
                do {
                    try await store.load()
                } catch {
                    print("Local data not avaliable")
                }
            }
        }
    }
}
