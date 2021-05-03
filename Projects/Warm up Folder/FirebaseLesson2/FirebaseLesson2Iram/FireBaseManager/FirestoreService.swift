//
//  FirestoreService.swift
//  FirebaseLesson2Iram
//
//  Created by Angela Garrovillas on 11/11/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreService {
    private init() {}
    
    static let manager = FirestoreService()
    
    private let database = Firestore.firestore()
    
    func createAppUser(user: AppUser,completionHandler: @escaping (Result<Void,Error>) -> ()) {
        //example
        //users - usertest
        //document - auto generated thing
        
        database.collection("users").document(user.uid).setData(user.fieldsDict) { (error) in
            if let error = error {
                completionHandler(.failure(error))
            }
        }
    }
}
