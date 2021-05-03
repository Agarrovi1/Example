//
//  hexCalculationFunc.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Angela Garrovillas on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
func makeHexIntoDict(hex: String) -> [Int:Character] {
    var dict: [Int:Character] = [:]
    for (index,i) in hex.enumerated() {
        dict[index] = i
    }
    return dict
}

func getValueFromHex(dict: [Int:Character], first: Int, second: Int) -> Double {
    guard let firstDigit = dict[first], let secondDigit = dict[second] else {
        return Double()
    }
    if let firstNum = Int("\(firstDigit)") {
        if let secondNum = Int("\(secondDigit)") {
            return Double((firstNum * 16) + secondNum)
        } else {
            let secondLetterValue = getValue(from: secondDigit)
            return Double(firstNum * 16) + secondLetterValue
        }
    } else {
        let firstLetterValue = getValue(from: firstDigit)
        if let secondNum = Int("\(secondDigit)") {
            return (firstLetterValue * 16) + Double(secondNum)
        } else {
            let secondLetterValue = getValue(from: secondDigit)
            return (firstLetterValue * 16) + secondLetterValue
        }
    }
}

func getValue(from letter: Character) -> Double {
    switch letter {
    case "A":
        return 10
    case "B":
        return 11
    case "C":
        return 12
    case "D":
        return 13
    case "E":
        return 14
    case "F":
        return 15
    default:
        return Double()
    }
}

func getHex(from decimal: Double) -> String {
    let dividedBy16 = decimal / 16
    let firstStep = Int(dividedBy16)
    var firstDigit = String()
    firstDigit = getPartOfHex(from: firstStep)
    let secondStep = dividedBy16.truncatingRemainder(dividingBy: 1) * 16
    let intSecondStep = Int(secondStep)
    let secondDigit = getPartOfHex(from: intSecondStep)
    return firstDigit + secondDigit
}

func getPartOfHex(from decimal: Int) -> String {
    var str = String()
    switch decimal {
    case 10:
        str = "A"
    case 11:
        str = "B"
    case 12:
        str = "C"
    case 13:
        str = "D"
    case 14:
        str = "E"
    case 15:
        str = "F"
    default:
        str = "\(decimal)"
    }
    return str
}
