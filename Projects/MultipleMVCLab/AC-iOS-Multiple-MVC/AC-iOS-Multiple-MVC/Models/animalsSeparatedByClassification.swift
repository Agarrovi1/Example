//
//  animalsSeparatedByClassification.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Angela Garrovillas on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import Foundation
var mammals = ZooAnimal.zooAnimals.filter({$0.classification == "Mammal"})
var amphibian = ZooAnimal.zooAnimals.filter({$0.classification == "Amphibian"})
var reptile = ZooAnimal.zooAnimals.filter({$0.classification == "Reptile"})
var insect = ZooAnimal.zooAnimals.filter({$0.classification == "Insect"})
var bird = ZooAnimal.zooAnimals.filter({$0.classification == "Bird"})

let arrOfArrOfAnimals = [mammals,amphibian,reptile,insect,bird]

//let arrOfArrOfAnimals = makeArrOfClassifications(animals: ZooAnimal.zooAnimals)
