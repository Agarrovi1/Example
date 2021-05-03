//
//  Game.swift
//  DidIGetIt
//
//  Created by Angela Garrovillas on 5/4/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation

class Game {
    var turns: Int
    var codeMaker: [Colors]
    static let shared = Game()
    var reds: Int = 0
    var whites: Int = 0
    var previousGuesses = [[Colors]]()
    
    init() {
        turns = 0
        codeMaker = Colors.getRandomColors()
    }
    
    func start() {
        turns = 0
        codeMaker = Colors.getRandomColors()
        previousGuesses = [[Colors]]()
    }
    
    func checkCorrectPlacement(submission: [Colors]) {
        for index in 0...4 {
            if submission[index] == codeMaker[index] {
                reds += 1
            }
        }
    }
    
    func checkCorrectColor(submission: [Colors]) {
        var copyCM = codeMaker
        var copySubmission = submission
        for index in 0...4 {
            if submission[index] == codeMaker[index] {
                copyCM[index] = .blank
                copySubmission[index] = .blank
            }
        }
        var whiteCount = 0
        for color in copySubmission {
            if let index = copyCM.firstIndex(of: color) {
                whiteCount += 1
                copyCM[index] = .blank
            }
        }
        whites = whiteCount
    }
    
    func addGuessToList(newGuess: [Colors]) {
        previousGuesses.append(newGuess)
    }
    
    
    
}
