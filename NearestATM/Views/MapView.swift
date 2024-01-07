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
                Marker(coordinate: CLLocationCoordinate2D(latitude: atm.location.latitude, longitude: atm.location.longitude))
                                {
                                    Text(atm.brand)
                                        .padding(8)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
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
