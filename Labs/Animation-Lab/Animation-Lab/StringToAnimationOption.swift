//
//  StringToAnimationOption.swift
//  Animation-Lab
//
//  Created by Angela Garrovillas on 10/11/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit
var animationArray = ["None","Repeat","AutoReverse","CurveEaseIn","CurveEaseOut"]

func StringToAnimationOption(string: String) -> UIView.AnimationOptions {
    switch string {
    case "None":
        return []
    case "Repeat":
        return .repeat
    case "AutoReverse":
        return .autoreverse
    case "CurveEaseIn":
        return .curveEaseIn
    case "CurveEaseOut":
        return .curveEaseOut
    default:
        return []
    }
}
