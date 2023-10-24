//
//  CardView.swift
//  NearestATM
//
//  Created by Guest User on 24/10/2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Brand")
                .font(.headline)
            Spacer()
            HStack {
                Label("10m", systemImage: "road.lanes")
                Spacer()
                Label("Krakow", systemImage: "mappin")
                Spacer()
                Label("cash in", systemImage: "dollarsign.arrow.circlepath")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
    }
}

#Preview {
    CardView()
        .previewLayout(.fixed(width: 400, height: 60))
}
