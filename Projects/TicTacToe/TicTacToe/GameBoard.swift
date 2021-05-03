//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

let x = ["X","X","X"]
let o = ["O","O","O"]

class GameBoard {
    var topRow: [UIButton]
    var middleRow: [UIButton]
    var bottomRow: [UIButton]

    init(topRow: [UIButton],middleRow: [UIButton], bottomRow: [UIButton]) {
        self.topRow = topRow
        self.middleRow = middleRow
        self.bottomRow = bottomRow
    }
    private func unwrap(first: String?, second: String?, third: String?) -> [String] {
        if let one = first, let two = second, let three = third {
            return [one,two,three]
        }
        return []
    }
    
    func checkForWinDiagonalsTLTBR() -> Bool {
        let diagonalTopLeftToBottomRight = unwrap(first: topRow[0].title(for: .disabled), second: middleRow[1].title(for: .disabled), third: bottomRow[2].title(for: .disabled))
        return diagonalTopLeftToBottomRight == x || diagonalTopLeftToBottomRight == o
    }
    func checkForWinDiagonalsTRTBL() -> Bool {
        let diagonalTopRightToBottomLeft = unwrap(first: topRow[2].title(for: .disabled), second: middleRow[1].title(for: .disabled), third: bottomRow[0].title(for: .disabled))
        return diagonalTopRightToBottomLeft == x || diagonalTopRightToBottomLeft == o
    }
    func CFWHorizontalTop() -> Bool {
        let topHorizontal = unwrap(first: topRow[0].title(for: .disabled), second: topRow[1].title(for: .disabled), third: topRow[2].title(for: .disabled))
        return topHorizontal == x || topHorizontal == o
    }
    func CFWHorizontalMiddle() -> Bool {
        let middleHorizontal = unwrap(first: middleRow[0].title(for: .disabled), second: middleRow[1].title(for: .disabled), third: middleRow[2].title(for: .disabled))
        return middleHorizontal == x || middleHorizontal == o
    }
    func CFWHorizontalBottom() -> Bool {
        let bottomHorizontal = unwrap(first: bottomRow[0].title(for: .disabled), second: bottomRow[1].title(for: .disabled), third: bottomRow[2].title(for: .disabled))
        return bottomHorizontal == x || bottomHorizontal == o
    }
    func CFWVerticalFirstColumn() -> Bool {
        let verticalFirst = unwrap(first: topRow[0].title(for: .disabled), second: middleRow[0].title(for: .disabled), third: bottomRow[0].title(for: .disabled))
        return verticalFirst == x || verticalFirst == o
    }
    func CFWVerticalSecondColumn() -> Bool {
        let verticalSecond = unwrap(first: topRow[1].title(for: .disabled), second: middleRow[1].title(for: .disabled), third: bottomRow[1].title(for: .disabled))
        return verticalSecond == x || verticalSecond == o
    }
    func CFWVerticalThirdColumn() -> Bool {
        let verticalThird = unwrap(first: topRow[2].title(for: .disabled), second: middleRow[2].title(for: .disabled), third: bottomRow[2].title(for: .disabled))
        return verticalThird == x || verticalThird == o
    }

}

