//
//  AppUser.swift
//  FirebaseLesson2Iram
//
//  Created by Angela Garrovillas on 11/11/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
import FirebaseAuth

struct AppUser {
    //let name: String?
    let email: String?
    let uid: String
    //unique identification
    let userName: String?
    //optional bc firebase, stores data like dictionary
    
    init(from user: User) {
        self.userName = user.displayName
        self.email = user.email
        self.uid = user.uid
    }
    
    var fieldsDict: [String: Any] {
        return [
            "userName": self.userName ?? "",
            "email": self.email ?? "",
            ]
    }
}
