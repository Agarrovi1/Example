//
//  Colors.swift
//  DidIGetIt
//
//  Created by Angela Garrovillas on 5/4/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit
enum Colors {
    case red
    case blue
    case green
    case black
    case white
    case purple
    case orange
    case yellow
    case blank
    
    func getUIColor() -> UIColor {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .green:
            return .green
        case .black:
            return .black
        case .white:
            return .white
        case .purple:
            return .purple
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .blank:
            return .clear
        }
        
    }
    static private func getRandomColor() -> Colors {
        let allColors: [Colors] = [.red,.blue,.green,.black,.white,.purple,.orange,.yellow]
        return allColors.randomElement()!
    }
    static func getRandomColors() -> [Colors] {
        var codeMakerColors = [Colors]()
        for _ in 0...4 {
            codeMakerColors.append(getRandomColor())
        }
        return codeMakerColors
    }
}
