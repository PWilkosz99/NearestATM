//
//  NearestATMApp.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import SwiftUI

@main
struct NearestATMApp: App {
    @State private var ATMs = ATM.sampleData
    var body: some Scene {
        WindowGroup {
            ATMsListView(atms: .constant(ATM.sampleData))
        }
    }
}
