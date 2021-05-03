//
//  UserDefaultWrapper.swift
//  UserDefaults-Lab
//
//  Created by Angela Garrovillas on 9/24/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
class UserDefaultWrapper {
    
    private init () {}
    
    static let manager = UserDefaultWrapper()
    
    private let nameKey = "name"
    private let birthMonthKey = "month"
    private let birthDayKey = "day"
    
    
    //MARK: - Gets
    func getName() -> String? {
        if let name = UserDefaults.standard.value(forKey: nameKey) as? String {
            return name
        }
        return nil
    }
    
    func getBirthday() -> (month:String,day:String)? {
        if let birthMonth = UserDefaults.standard.value(forKey: birthMonthKey) as? String, let birthDay = UserDefaults.standard.value(forKey: birthDayKey) as? String {
            return (birthMonth,birthDay)
        }
        return nil
    }
    
    //MARK: - Sets
    func store(name: String) {
        UserDefaults.standard.set(name, forKey: nameKey)
    }
    
    func store(birthdayInfo: (month:String,day:String)) {
        UserDefaults.standard.set(birthdayInfo.month, forKey: birthMonthKey)
        UserDefaults.standard.set(birthdayInfo.day, forKey: birthDayKey)
    }
    
}
