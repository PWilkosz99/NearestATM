//
//  ATMsListView.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import SwiftUI

struct ATMsListView: View {
    let atms: [ATM]
    var body: some View {
        List(atms, id : \.brand)
        {
            atm in
            CardView(atm: atm)
                .listRowBackground(atm.theme.mainColor)
        }
    }
}

#Preview {
    ATMsListView(atms: ATM.sampleData)
}
