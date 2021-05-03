//
//  GameBoard2.swift
//  TicTacToe
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

struct GameBoard2 {
    var top: [String] = ["","",""]
    var middle: [String] = ["","",""]
    var bottom: [String] = ["","",""]
    
    func winDiagonalTopLeftToBotRight() -> Bool {
        return  [self.top[0],self.middle[1],self.bottom[2]] == x || [self.top[0],self.middle[1],self.bottom[2]] == o
    }
    func winDiagonalTopRightToBotLeft() -> Bool {
        return [self.top[2],self.middle[1],self.bottom[0]] == x || [self.top[2],self.middle[1],self.bottom[0]] == o
    }
    func winTopHorizontal() -> Bool {
        return [self.top[0],self.top[1],self.top[2]] == x || [self.top[0],self.top[1],self.top[2]] == o
    }
    func winMidHorizontal() -> Bool {
        return [self.middle[0],self.middle[1],self.middle[2]] == x || [self.middle[0],self.middle[1],self.middle[2]] == o
    }
    func winBotHorizontal() -> Bool {
        return [self.bottom[0],self.bottom[1],self.bottom[2]] == x || [self.bottom[0],self.bottom[1],self.bottom[2]] == o
    }
    func winVerticalFirstColumn() -> Bool {
        return [self.top[0],self.middle[0],self.bottom[0]] == x || [self.top[0],self.middle[0],self.bottom[0]] == o
    }
    func winVerticalSecondColumn() -> Bool {
        return [self.top[1],self.middle[1],self.bottom[1]] == x || [self.top[1],self.middle[1],self.bottom[1]] == o
    }
    func winVerticalThirdColumn() -> Bool {
        return [self.top[2],self.middle[2],self.bottom[2]] == x || [self.top[2],self.middle[2],self.bottom[2]] == o
    }
}

