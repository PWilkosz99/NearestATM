//
//  MapView.swift
//  NearestATM
//
//  Created by Piotr Wilkosz on 19/12/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map()
        {
            
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
    MapView()
}
