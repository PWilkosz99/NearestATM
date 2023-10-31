//
//  ATMsListView.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import SwiftUI

struct ATMsListView: View {
    let atms: [ATM]
    var body: some View {
        NavigationStack{
            List(atms, id : \.brand)
            {
                atm in
                NavigationLink(destination: DetailView(atm: atm))
                {
                    CardView(atm: atm)
                }
                .listRowBackground(atm.theme.mainColor)
            }
            .navigationTitle("Nearest ATMs")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ATMsListView(atms: ATM.sampleData)
}
