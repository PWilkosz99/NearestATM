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
        let themeColor = atm.cash_in ? Theme.electricBlue.mainColor : Theme.lavenderMist.mainColor
        
        List{
            Section(header: Text("ATM Info")) {
                Label(atm.brand, systemImage: "banknote")
                    .font(.headline)
                    .foregroundColor(themeColor)
                HStack {
                    Label {
                        Text("City")
                    } icon: {
                        Image(systemName: "building.2.fill")
                            .foregroundColor(themeColor)
                    }
                    Spacer()
                    Text(atm.city)
                }
                HStack {
                    Label {
                        Text("Address")
                    } icon: {
                        Image(systemName: "mappin")
                            .foregroundColor(themeColor)
                    }
                    Spacer()
                    Text(atm.address)
                }
                HStack {
                    Label {
                        Text("Cash-in avaliable")
                    } icon: {
                        Image(systemName: "dollarsign.arrow.circlepath")
                            .foregroundColor(themeColor)
                    }
                    Spacer()
                    Text(atm.cash_in ? "Yes" : "No")
                        .foregroundColor(atm.cash_in ? .green : .red)
                }
                if let openingHours = atm.opening_hours {
                                    HStack {
                                        Label {
                                            Text("Opening hours")
                                        } icon: {
                                            Image(systemName: "clock.fill")
                                                .foregroundColor(themeColor)
                                        }
                                        Spacer()
                                        Text(openingHours)
                                    }
                                }
                if let fee = atm.fee {
                                    HStack {
                                        Label {
                                            Text("Fee")
                                        } icon: {
                                            Image(systemName: "dollarsign.arrow.circlepath")
                                                .foregroundColor(themeColor)
                                        }
                                        Spacer()
                                        Text(fee)
                                    }
                                }
                if let charge = atm.charge {
                                    HStack {
                                        Label {
                                            Text("Charge")
                                        } icon: {
                                            Image(systemName: "dollarsign.square")
                                                .foregroundColor(themeColor)
                                        }
                                        Spacer()
                                        Text(charge)
                                    }
                                }
                if let wheelchair = atm.wheelchair {
                                    HStack {
                                        Label {
                                            Text("Wheelchair")
                                        } icon: {
                                            Image(systemName: "figure.roll")
                                                .foregroundColor(themeColor)
                                        }
                                        Spacer()
                                        Text(wheelchair)
                                    }
                                }
                HStack {
                    Image(systemName: atm.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(themeColor)
                        .imageScale(.large)
                        .onTapGesture {
                            atm.isFavorite.toggle()
                        }
                    Spacer()
                    Toggle("Favorite", isOn: $atm.isFavorite)
                        .padding(.leading)
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
