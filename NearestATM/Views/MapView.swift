//
//  MapView.swift
//  NearestATM
//
//  Created by Piotr Wilkosz on 19/12/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Binding var atms: [ATM]
    
    var body: some View {
        Map{
            ForEach(atms, id: \.id)
            {
                atm in
                let markerColor = atm.cash_in ? Theme.electricBlue.mainColor : Theme.lavenderMist.mainColor
                let markerIcon = atm.cash_in ? "dollarsign.arrow.circlepath" : "dollarsign"
                Marker(atm.brand, systemImage: markerIcon, coordinate: atm.location)
                    .tint(markerColor)
            }
        }
        .mapControls {
            MapUserLocationButton()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MapView(atms: .constant(ATM.sampleData))
}
