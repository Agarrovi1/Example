//
//  ScoreBoard.swift
//  ColorGuessingGame
//
//  Created by Angela Garrovillas on 7/30/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

struct ScoreBoard {
    var score = 0
    var HighScore = 0
    
    mutating func youWonScore() {
        self.score += 1
    }
    mutating func youLostScore() {
        self.score = 0
    }
}
