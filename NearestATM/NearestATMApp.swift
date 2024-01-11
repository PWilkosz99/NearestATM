import SwiftUI

@main
struct NearestATMApp: App {
    @StateObject private var store = ATMStore()
    @State private var isConfirmationDialogPresented = false
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ATMsView(atms: $store.atms, refreshAction: {
                    isConfirmationDialogPresented.toggle()
                })
                .confirmationDialog("Refresh Data", isPresented: $isConfirmationDialogPresented, actions: {
                    Button("Confirm") {
                        Task {
                            do {
                                try await store.loadFromJSON()
                            } catch {
                                print("Error refreshing data: \(error)")
                            }
                        }
                        isConfirmationDialogPresented = false
                    }
                }, message: {
                    Text("Are you sure you want to refresh data?")
                })
                .tabItem {
                    Label("List view", systemImage: "list.bullet")
                }
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
            .onChange(of: scenePhase) { newScenePhase in
                if newScenePhase == .inactive {
                    Task {
                        do {
                            try await store.save(atms: store.atms)
                            print("Data saved on app inactive")
                        } catch {
                            print("Error saving data: \(error)")
                        }
                    }
                }
            }
        }
    }
}
