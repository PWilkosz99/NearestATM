//
//  CardView.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import SwiftUI

struct CardView: View {
    @Binding var atm: ATM
    var body: some View {
        VStack(alignment: .leading) {
            Text(atm.brand)
                .font(.headline)
            Spacer()
            HStack {
                Label(atm.city, systemImage: "road.lanes")
                Spacer()
                Label(atm.address, systemImage: "mappin")
                Spacer()
                if atm.cash_in {
                    Image(systemName: "dollarsign.arrow.circlepath")
                        .font(.system(size: 24))
                        .padding(.trailing, 10)
                } else {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 24))
                        .padding(.trailing, 10)
                }
                
                Image(systemName: atm.isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 24))
                    .foregroundColor(atm.isFavorite ? Color.red : Color.gray)
                    .onTapGesture {
                        atm.isFavorite = !atm.isFavorite
                    }
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(atm.cash_in ? Theme.electricBlue.accentColor : Theme.steelBlue.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var atm = ATM.sampleData[0]
    static var previews: some View {
        CardView(atm: .constant(atm))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
