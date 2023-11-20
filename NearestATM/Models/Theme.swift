//
//  Theme.swift
//  NearestATM
//
//  Created by Piotr Wilkosz on 31/10/2023.
//

import SwiftUI


enum Theme: String {
    case electricBlue
    case lavenderMist
    case midnightBlue
    case royalPurple
    case skyBlue
    case steelBlue
    
    var accentColor: Color {
        switch self {
        case .electricBlue, .lavenderMist, .skyBlue : return .black
        case .midnightBlue, .royalPurple, .steelBlue : return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
}
