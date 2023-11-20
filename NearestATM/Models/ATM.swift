//
//  ATM.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import Foundation
import CoreLocation

struct ATM : Identifiable{
    let id: UUID
    var brand: String
    var cash_in: Bool
    
    var location: CLLocationCoordinate2D
    var city: String
    var address: String
    
    var opening_hours: String?
    var fee: String?
    var charge: String?
    var wheelchair: String?
    
    var isFavorite: Bool

    internal init(id: UUID = UUID(), brand: String, cash_in: Bool, location: CLLocationCoordinate2D, city: String, address: String, opening_hours: String? = nil, fee: String? = nil, charge: String? = nil, wheelchair: String? = nil, isFavorite: Bool = false) {
        self.id = id
        self.brand = brand
        self.cash_in = cash_in
        self.location = location
        self.city = city
        self.address = address
        self.opening_hours = opening_hours
        self.fee = fee
        self.charge = charge
        self.wheelchair = wheelchair
        self.isFavorite = isFavorite
    }
}

extension ATM{
    static let sampleData: [ATM] =
    [
        ATM(brand: "Bank PKO",
            cash_in: false,
            location: CLLocationCoordinate2D(latitude: 50.0647, longitude: 19.9450),
            city: "Kraków",
            address: "Czarnowiejska 10"
        ),
        ATM(brand: "Bank Pekao",
            cash_in: false,
            location: CLLocationCoordinate2D(latitude: 50.0647, longitude: 19.9450),
            city: "Kraków",
            address: "Czarnowiejska 20"
        ),
        ATM(brand: "Euronet",
            cash_in: true,
            location: CLLocationCoordinate2D(latitude: 50.0647, longitude: 19.9450),
            city: "Kraków",
            address: "Czarnowiejska 30"
        )
    ]
}
