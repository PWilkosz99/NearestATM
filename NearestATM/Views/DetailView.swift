//
//  DetailView.swift
//  NearestATM
//
//  Created by Piotr Wilkosz on 31/10/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var atm: ATM
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
                    Text(atm.cash_in ? "Yes" : "No")
                }
                if let openingHours = atm.opening_hours {
                                    HStack {
                                        Label("Opening hours", systemImage: "clock.fill")
                                        Spacer()
                                        Text(openingHours)
                                    }
                                }
                if let fee = atm.fee {
                                    HStack {
                                        Label("Fee", systemImage: "dollarsign.arrow.circlepath")
                                        Spacer()
                                        Text(fee)
                                    }
                                }
                if let charge = atm.charge {
                                    HStack {
                                        Label("Charge", systemImage: "dollarsign.square")
                                        Spacer()
                                        Text(charge)
                                    }
                                }
                if let wheelchair = atm.wheelchair {
                                    HStack {
                                        Label("Wheelchair", systemImage: "figure.roll")
                                        Spacer()
                                        Text(wheelchair)
                                    }
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
        DetailView(atm: .constant(ATM.sampleData[0]))
    }
}
