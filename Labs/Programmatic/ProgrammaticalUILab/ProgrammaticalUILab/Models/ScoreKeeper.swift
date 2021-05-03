//
//  ScoreKeeper.swift
//  ProgrammaticalUILab
//
//  Created by Angela Garrovillas on 10/7/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

struct ScoreBoard {
    var score = 0
    var highScore = 0
    
    mutating func youWonScore() {
        self.score += 1
        changeHighScore()
    }
    mutating func youLostScore() {
        self.score = 0
    }
    mutating func changeHighScore() {
        if score > highScore {
            highScore = score
        }
    }
}
