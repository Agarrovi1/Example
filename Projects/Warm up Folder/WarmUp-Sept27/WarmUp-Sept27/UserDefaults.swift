//
//  UserDefaults.swift
//  WarmUp-Sept27
//
//  Created by Angela Garrovillas on 9/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
class UserDefaultsWrapper {
    //saves in one space in memory
    private init () {}
    static let wrapper = UserDefaultsWrapper()
    private let darkModeKey = "darkMode"
    
    func store(darkmode: Bool) {
        UserDefaults.standard.set(darkmode, forKey: darkModeKey)
    }
    
    func getDarkMode() -> Bool? {
        return UserDefaults.standard.value(forKey: darkModeKey) as? Bool
    }
}
