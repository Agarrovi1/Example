//
//  ScoreBoard.swift
//  TicTacToe
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

struct ScoreBoard {
    var playerOneWins: Int = 0
    var playerTwoWins: Int = 0
    var draw: Int = 0
    
    mutating func increasesScorePOne() {
        playerOneWins += 1
    }
    mutating func increasesScorePTwo() {
        playerTwoWins += 1
    }
    mutating func increasesDraw() {
        draw += 1
    }
}
