//
//  DetailView.swift
//  NearestATM
//
//  Created by Piotr Wilkosz on 31/10/2023.
//

import SwiftUI

struct DetailView: View {
    let atm: ATM
    var body: some View {
        List{
            Section(header: Text("ATM Info")) {
                Label(atm.brand, systemImage: "banknote")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                HStack {
                    Label("City", systemImage: "building.2.fill")
                    Spacer()
                    Text(atm.city)
                }
                HStack {
                    Label("Address", systemImage: "mappin")
                    Spacer()
                    Text(atm.address)
                }
                HStack {
                    Label("Cash-in avaliable", systemImage: "dollarsign.arrow.circlepath")
                    Spacer()
                    Text(String(atm.cash_in ))
                }
            }
            Section(header: Text("Location")) {
                Image(.mockedMap)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5.0)
                    .padding(5)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(atm: ATM.sampleData[0])
    }
}
