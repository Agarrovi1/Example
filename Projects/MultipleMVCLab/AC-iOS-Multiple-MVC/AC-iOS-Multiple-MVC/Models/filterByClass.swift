//
//  filterByClass.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Angela Garrovillas on 8/14/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import Foundation

func filterByClass(animals: [ZooAnimal], classification: String) -> [ZooAnimal] {
    return animals.filter({$0.classification == classification})
}

//func makeArrOfClassifications(animals: [ZooAnimal]) -> [[ZooAnimal]] {
//    var arrOfArr: [[ZooAnimal]] = [[]]
//    var arrOfClasses: [String] = []
//    for a in animals {
//        if !arrOfClasses.contains(a.classification) {
//            arrOfClasses.append(a.classification)
//        }
//    }
//    for b in (0...arrOfClasses.count - 1) {
//        let classification = arrOfClasses[b]
//        let arrOfSingleClass = filterByClass(animals: animals, classification: classification)
//        arrOfArr.append(arrOfSingleClass)
//    }
//    return arrOfArr
//}
