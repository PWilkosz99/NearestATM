//
//  ATM.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import Foundation
import CoreLocation

struct ATM : Identifiable, Codable{
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
    
    private enum CodingKeys: String, CodingKey {
        case id, brand, cash_in, location, city, address, opening_hours, fee, charge, wheelchair, isFavorite, lon, lat, name, tags
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(brand, forKey: .brand)
        try container.encode(cash_in, forKey: .cash_in)
        try container.encode(location.latitude, forKey: .location)
        try container.encode(location.longitude, forKey: .location)
        try container.encode(city, forKey: .city)
        try container.encode(address, forKey: .address)
        try container.encode(opening_hours, forKey: .opening_hours)
        try container.encode(fee, forKey: .fee)
        try container.encode(charge, forKey: .charge)
        try container.encode(wheelchair, forKey: .wheelchair)
        try container.encode(isFavorite, forKey: .isFavorite)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        
        city = "Dummy City"
        address = "Dummy Address"
        
        let latitude = try values.decode(Double.self, forKey: .lat)
        let longitude = try values.decode(Double.self, forKey: .lon)
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        if let tags = try? values.decodeIfPresent([String: String].self, forKey: .tags) {
            if let brandValue = tags["brand"] {
                brand = brandValue
            } else if let nameValue = tags["name"] {
                brand = nameValue
            } else {
                brand = "Unknown"
            }
            
            if let cashInValue = tags["cash_in"] {
                if cashInValue == "yes"{
                    cash_in = true
                }else{
                    cash_in = false
                }
            }else{
                cash_in = false
            }
            
            if let openingHoursValue = tags["opening_hours"] {
                opening_hours = openingHoursValue
            }
            
            if let feeValue = tags["fee"] {
                fee = feeValue
            }
            
            if let chargeValue = tags["charge"] {
                charge = chargeValue
            }
            
            if let wheelchairValue = tags["wheelchair"] {
                wheelchair = wheelchairValue
            }
            
        } else {
            brand = "Unknown"
            cash_in = false
        }
        
        isFavorite = false
        //        city = try values.decode(String.self, forKey: .city)
        //        address = try values.decode(String.self, forKey: .address)
    }
    
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
            address: "Czarnowiejska 10",
            opening_hours: "0h - 24h",
            fee: "for foreign cards",
            charge: "10 PLN",
            wheelchair: "Avaliable - ramp"
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
