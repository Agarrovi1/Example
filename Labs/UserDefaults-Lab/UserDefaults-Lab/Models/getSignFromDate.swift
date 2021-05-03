//
//  getSignFromDate.swift
//  UserDefaults-Lab
//
//  Created by Angela Garrovillas on 9/24/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
func getSignFromDate(tuple: (month: String,day: String)) -> String {
    guard let numMonth = Int(tuple.month), let numDay = Int(tuple.day) else {return String()}
    switch numMonth {
    case 1:
        if numDay >= 21 {
            return "aquarius"
        } else {
            return "capricorn"
        }
    case 2:
        if numDay >= 19 {
            return "pisces"
        } else {
            return "aquarius"
        }
    case 3:
        if numDay >= 21 {
            return "aries"
        } else {
            return "pisces"
        }
    case 4:
        if numDay >= 21 {
            return "taurus"
        } else {
            return "aries"
        }
    case 5:
        if numDay >= 22 {
            return "gemini"
        } else {
            return "taurus"
        }
    case 6:
        if numDay >= 22 {
            return "cancer"
        } else {
            return "gemini"
        }
    case 7:
        if numDay >= 23 {
            return "leo"
        } else {
            return "cancer"
        }
    case 8:
        if numDay >= 24 {
            return "virgo"
        } else {
            return "leo"
        }
    case 9:
        if numDay >= 23 {
            return "libra"
        } else {
            return "virgo"
        }
    case 10:
        if numDay >= 24 {
            return "scorpio"
        } else {
            return "libra"
        }
    case 11:
        if numDay >= 23 {
            return "sagittarius"
        } else {
            return "scorpio"
        }
    case 12:
        if numDay >= 22 {
            return "capricorn"
        } else {
            return "sagittarius"
        }
    default:
        return String()
    }
}
