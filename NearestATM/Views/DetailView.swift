//
//  DetailView.swift
//  NearestATM
//
//  Created by Piotr Wilkosz on 31/10/2023.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @Binding var atm: ATM
    
    var body: some View {
        let themeColor = atm.cash_in ? Theme.electricBlue.mainColor : Theme.lavenderMist.mainColor
        
        List{
            Section(header: Text("ATM Info")) {
                Label(atm.brand, systemImage: "banknote")
                    .font(.headline)
                    .foregroundColor(themeColor)
                .accessibilityElement(children: .combine)
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
                .accessibilityElement(children: .combine)
                
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
                                    .accessibilityElement(children: .combine)
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
                                    .accessibilityElement(children: .combine)
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
                                    .accessibilityElement(children: .combine)
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
                                    .accessibilityElement(children: .combine)
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
                .accessibilityElement(children: .combine)

            }
            Section(header: Text("Location")) {
                Map{
                    Marker(coordinate: CLLocationCoordinate2D(latitude: atm.location.latitude, longitude: atm.location.longitude))
                                        {
                                            Text(atm.brand)
                                                .padding(8)
                                                .background(Color.blue)
                                                .foregroundColor(.white)
                                                .cornerRadius(8)
                                        }
                }
                .mapControls {
                  MapPitchToggle()
                  MapUserLocationButton()
                  MapCompass()
                }
                .frame(height: 400)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(atm: .constant(ATM.sampleData[0]))
    }
}
