//
//  ATM.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import Foundation

struct ATM{
    var brand: String
    var city: String
    var address: String
    var cash_in: Bool
    var theme: Theme
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
