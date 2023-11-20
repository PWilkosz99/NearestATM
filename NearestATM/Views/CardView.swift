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
                .padding(.bottom, 4)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Label(atm.city, systemImage: "road.lanes")
                        .font(.caption)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    Label(atm.address, systemImage: "mappin.and.ellipse")
                        .font(.caption)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                Spacer()
                Image(systemName: atm.cash_in ? "dollarsign.arrow.circlepath" : "xmark.circle")
                    .font(.system(size: 24))
                    .padding(.trailing, 10)
                
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
    static var previews: some View {
        CardView(atm: .constant(ATM.sampleData[0]))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
