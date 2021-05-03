//
//  ColorFromNumber.swift
//  CollectionView
//
//  Created by Angela Garrovillas on 9/26/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit
let nonMetal = UIColor(displayP3Red: CGFloat(0.209), green: CGFloat(0.484), blue: CGFloat(0.753), alpha: 1)
let nobleGas = UIColor(displayP3Red: CGFloat(0.182), green: CGFloat(0.029), blue: CGFloat(0.322), alpha: 1)
let alkaliMetal = UIColor(displayP3Red: CGFloat(0.855), green: CGFloat(0.217), blue: CGFloat(0.192), alpha: 1)
let alkalineEarth = UIColor(displayP3Red: CGFloat(0.914), green: CGFloat(0.600), blue: CGFloat(0.247), alpha: 1)
let metalloid = UIColor(displayP3Red: CGFloat(0.321), green: CGFloat(0.705), blue: CGFloat(0.926), alpha: 1)
let halogen = UIColor(displayP3Red: CGFloat(0.437), green: CGFloat(0.187), blue: CGFloat(0.545), alpha: 1)
let transitionMetal = UIColor(displayP3Red: CGFloat(0.976), green: CGFloat(0.870), blue: CGFloat(0.000), alpha: 1)
let basicMetal = UIColor(displayP3Red: CGFloat(0.287), green: CGFloat(0.643), blue: CGFloat(0.353), alpha: 1)
let lanthanide = UIColor(displayP3Red: CGFloat(0.884), green: CGFloat(0.474), blue: CGFloat(0.667), alpha: 1)
let actinide = UIColor(displayP3Red: CGFloat(0.712), green: CGFloat(0.175), blue: CGFloat(0.541), alpha: 1)

func getColorForElement(elementNum: Int) -> UIColor {
    switch elementNum {
    case 1,34:
        return nonMetal
    case 6...8,15...16:
        return nonMetal
    case 2:
        return nobleGas
    case 10,18,36,54,86,118:
        return nobleGas
    case 3,11,19,37,55,87:
        return alkaliMetal
    case 4,12,20,38,56,88:
        return alkalineEarth
    case 5,14,32,33,51,52,84:
        return metalloid
    case 9,17,35,53,85,117:
        return halogen
    case 21...30,39...48,72...80,104...112:
        return transitionMetal
    case 13,31,49,50,81,82,83,113,114,115,116:
        return basicMetal
    case 57...71:
        return lanthanide
    default:
        return UIColor.white
    }
}
