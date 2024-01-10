//
//  CardView.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import SwiftUI

struct CardView: View {
    @Binding var atm: ATM
    let saveAction: () -> Void
    
    var body: some View {
        let openingHours = atm.opening_hours ?? atm.opening_hours ?? "24/7"
        let fee = atm.fee ?? atm.fee ?? "Free"
        
        return VStack(alignment: .leading) {
            Text(atm.brand)
                .font(.headline)
                .padding(.bottom, 4)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Label(openingHours, systemImage: "clock.fill")
                        .font(.caption)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                        .accessibilityLabel("opening hours \(openingHours)")
                    Label(fee, systemImage: "dollarsign.circle")
                        .font(.caption)
                        .bold()
                        .multilineTextAlignment(.center)
                        .accessibilityLabel("fee \(fee)")
                }
                Spacer()
                Image(systemName: atm.cash_in ? "dollarsign.arrow.circlepath" : "xmark.circle")
                    .font(.system(size: 24))
                    .padding(.trailing, 10)
                    .accessibilityLabel("cash in \(atm.cash_in ? "" : "not") avaliable")
                
                Image(systemName: atm.isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 24))
                    .foregroundColor(atm.isFavorite ? Color.red : Color.gray)
                    .onTapGesture {
                        atm.isFavorite = !atm.isFavorite
                        saveAction()
                        print("saved(card)")
                    }
                    .accessibilityLabel("atm \(atm.cash_in ? "" : "not") added to favorite")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(atm.cash_in ? Theme.electricBlue.accentColor : Theme.steelBlue.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(atm: .constant(ATM.sampleData[0]), saveAction: {})
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
