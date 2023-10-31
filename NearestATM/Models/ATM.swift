//
//  ATM.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import Foundation

struct ATM : Identifiable{
    let id: UUID
    var brand: String
    var city: String
    var address: String
    var cash_in: Bool
    var theme: Theme

init(id: UUID = UUID(), brand: String, city: String, address: String, cash_in: Bool, theme: Theme){
    self.id = id
    self.brand = brand
    self.city = city
    self.address = address
    self.cash_in = cash_in
    self.theme = theme
    }
}

extension ATM{
    static let sampleData: [ATM] =
    [
        ATM(brand: "Bank PKO",
            city: "Kraków",
            address: "Czarnowiejska 10",
            cash_in: false,
            theme: .bubblegum
        ),
        ATM(brand: "Bank Pekao",
            city: "Kraków",
            address: "Czarnowiejska 20",
            cash_in: false,
            theme: .buttercup
        ),
        ATM(brand: "Euronet",
            city: "Kraków",
            address: "Czarnowiejska 30",
            cash_in: true,
            theme: .indigo
        )
    ]
}
