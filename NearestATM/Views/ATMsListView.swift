//
//  ATMsListView.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import SwiftUI

struct ATMsListView: View {
    @Binding var atms: [ATM]
    var body: some View {
        NavigationStack{
            List(atms, id : \.brand)
            {
                atm in
                NavigationLink(destination: DetailView(atm: atm))
                {
                    CardView(atm: atm)
                }
                .listRowBackground(atm.cash_in ? Theme.electricBlue.mainColor : Theme.steelBlue.mainColor)
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
    ATMsListView(atms: .constant(ATM.sampleData))
}
