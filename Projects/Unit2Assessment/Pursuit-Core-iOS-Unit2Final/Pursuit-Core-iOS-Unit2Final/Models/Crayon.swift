//
//  Crayon.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

protocol UIColorable {
    var defaultRed: Float {get}
    var defaultGreen: Float {get}
    var defaultBlue: Float {get}
    var defaultAlpha: Double {get}
    
    var hexRed: String {get}
    var hexGreen: String {get}
    var hexBlue: String {get}
    
    func resetValues()
    func updateLabelWithHex()
}

class Crayon {
  var name: String
  var red: Double
  var green: Double
  var blue: Double
  var hex: String
  var delegate: UIColorable?
    var color: UIColor?

    private init(name: String,red:Double,green:Double,blue:Double,hex: String) {
    self.name = name
    self.red = red
    self.green = green
    self.blue = blue
    self.hex = hex
  }
    convenience init(name:String,hex:String) {
        let hexDict = makeHexIntoDict(hex: hex)
        let r = getValueFromHex(dict: hexDict, first: 1, second: 2)
        let g = getValueFromHex(dict: hexDict, first: 3, second: 4)
        let b = getValueFromHex(dict: hexDict, first: 5, second: 6)
        self.init(name: name, red: r, green: g, blue: b, hex: hex)
        
    }
  static let allTheCrayons = [
    Crayon(name: "Almond", hex: "#EFDECD"),
    Crayon(name: "Antique Brass", hex: "#CD9575"),
    Crayon(name: "Apricot", hex: "#FDD9B5"),
    Crayon(name: "Aquamarine", hex: "#78DBE2"),
    Crayon(name: "Asparagus",hex: "#87A96B"),
    Crayon(name: "Atomic Tangerine", hex: "#FFA474"),
    Crayon(name: "Banana Mania", hex: "#FAE7B5"),
    Crayon(name: "Beaver",hex: "#9F8170"),
    Crayon(name: "Bittersweet",hex: "#FD7C6E"),
    Crayon(name: "Black", hex: "#000000"),
    Crayon(name: "Blizzard Blue", hex: "#ACE5EE"),
    Crayon(name: "Blue",hex: "#1F75FE"),
    Crayon(name: "Blue Bell",hex: "#A2A2D0"),
    Crayon(name: "Blue Gray",hex: "#6699CC"),
    Crayon(name: "Blue Green", hex: "#0D98BA"),
    Crayon(name: "Blue Violet", hex: "#7366BD")
  ]
    func getUIColor() -> UIColor {
       return UIColor(displayP3Red: CGFloat(self.red/255), green: CGFloat(self.green/255), blue: CGFloat(self.blue/255), alpha: 1)
    }
    
}
