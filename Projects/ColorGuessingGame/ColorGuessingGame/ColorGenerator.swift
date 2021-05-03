//
//  ColorGenerator.swift
//  ColorGuessingGame
//
//  Created by Angela Garrovillas on 7/30/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

//let randNum = CGFloat.random(in: 0...1)
func randomNum() -> CGFloat {
    return CGFloat.random(in: 0...1)
}

struct Color {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha = CGFloat(1.0)
    
    static func generateRandomRGBValues() -> Color {
        return Color.init(red: randomNum(), green: randomNum(), blue: randomNum(), alpha: CGFloat(1.0))
    }
    func changeToUIColor() -> UIColor {
        return UIColor.init(red: self.red, green: self.green, blue: self.blue, alpha: self.alpha)
    }
    func findTheGreatest() -> String {
        var value = ""
        switch true {
        case red > green && red > blue:
            value = "Red"
        case green > red && green > blue:
            value = "Green"
        case blue > red && blue > green:
            value = "Blue"
        default:
            value = "Red"
        }
        return value
    }
    func findTheGreatestForTag() -> Int {
        var value = 0
        switch true {
        case red > green && red > blue:
            value = 0
        case green > red && green > blue:
            value = 1
        case blue > red && blue > green:
            value = 2
        default:
            value = 0
        }
        return value
    }
    
}

//func makeARandomUIColor() -> UIColor {
//    return Color.generateRandomRGBValues().changeToUIColor()
//}
func mixTheButtons() -> [String] {
    let arr = ["Red","Green","Blue"]
    return arr.shuffled()
    
}

func matchColorWithWordForSwitching(_ button: UIButton) {
    switch button.title(for: .normal) {
    case "Red":
        button.setTitleColor(UIColor.red, for: .normal)
    case "Green":
        button.setTitleColor(UIColor.green, for: .normal)
    default:
        button.setTitleColor(UIColor.blue, for: .normal)
    }
    
}


//let myColor = UIColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
