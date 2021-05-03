//
//  Stack.swift
//  AC-iOS-QueuesExercises
//
//  Created by Angela Garrovillas on 9/11/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
struct Stack<T> {
    
    private var arr = Array<T>()
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
    
    mutating func push(element: T) {
        arr.append(element)
    }
    
    func peek() -> T? {
        guard arr.count > 0 else {
            return nil
        }
        return arr[arr.count - 1]
    }
    
    var isEmpty: Bool {
        return arr.count == 0
    }
}
