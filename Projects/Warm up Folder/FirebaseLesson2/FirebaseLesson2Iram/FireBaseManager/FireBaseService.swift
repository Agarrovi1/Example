//
//  FireBaseService.swift
//  FirebaseLesson2Iram
//
//  Created by Angela Garrovillas on 11/11/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService {
    private init() {}
    static let manager = FirebaseAuthService()
    
    private let auth = Auth.auth()
    
    var currentUser: User? {
        return auth.currentUser
    }
    
    func createNewUser(withEmail: String, password: String, completionHandler: @escaping (Result<User,Error>) -> ()) {
        auth.createUser(withEmail: withEmail, password: password) { (result, error) in
            if let createdUser = result?.user {
                completionHandler(.success(createdUser))
            } else if let error = error {
                completionHandler(.failure(error))
            }
        }
    }
    func updateUserName(userName: String) {
        let request = auth.currentUser?.createProfileChangeRequest()
        request?.displayName = userName
        request?.commitChanges(completion: { (error) in
            if let error = error {
                print("error changing userName: \(error)")
            }
        })
    }
}
