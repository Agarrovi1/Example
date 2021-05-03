//
//  ViewController.swift
//  TicTacToe
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = Players.one
    var score = ScoreBoard()
    var ticTacToe = GameBoard2()

    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topMiddleButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var middleLeftButton: UIButton!
    @IBOutlet weak var middleMiddleButton: UIButton!
    @IBOutlet weak var middleRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomMiddleButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    @IBOutlet weak var diagonalTL: UILabel!
    @IBOutlet weak var diagonalMM: UILabel!
    @IBOutlet weak var diagonalBR: UILabel!
    
    @IBOutlet weak var diagonalTR: UILabel!
    @IBOutlet weak var diagonalMM2: UILabel!
    @IBOutlet weak var diagonalBL: UILabel!
    
    @IBOutlet weak var horizontalTopLine: UILabel!
    @IBOutlet weak var horizontalMidLine: UILabel!
    @IBOutlet weak var horizontalBotLine: UILabel!
    
    @IBOutlet weak var verticalOne: UILabel!
    @IBOutlet weak var verticalTwo: UILabel!
    @IBOutlet weak var verticalThree: UILabel!
    
    
    func checkForWinner(game: GameBoard2) -> Bool {
        switch true {
        case game.winDiagonalTopLeftToBotRight():
            diagonalTL.isHidden = false
            diagonalMM.isHidden = false
            diagonalBR.isHidden = false
            return true
        case game.winDiagonalTopRightToBotLeft():
            diagonalTR.isHidden = false
            diagonalMM2.isHidden = false
            diagonalBL.isHidden = false
            return true
        case game.winTopHorizontal():
            horizontalTopLine.isHidden = false
            return true
        case game.winMidHorizontal():
            horizontalMidLine.isHidden = false
            return true
        case game.winBotHorizontal():
            horizontalBotLine.isHidden = false
            return true
        case game.winVerticalFirstColumn():
            verticalOne.isHidden = false
            return true
        case game.winVerticalSecondColumn():
            verticalTwo.isHidden = false
            return true
        case game.winVerticalThirdColumn():
            verticalThree.isHidden = false
            return true
        default:
            return false
        }
    }
    
    @IBAction func topButtonsPressed(_ sender: UIButton) {
        switch currentPlayer {
        case .one:
            sender.isEnabled = false
            sender.setTitle("X", for: .disabled)
            ticTacToe.top[sender.tag] = "X"
            let isThereAWinner = checkForWinner(game: ticTacToe)
            if isThereAWinner {
                self.disableAllButtons()
                score.increasesScorePOne()
                self.playerOneLabel.text = "X PlayerOne: \(score.playerOneWins)"
            } else {
            currentPlayer = .two
            }
        case .two:
            sender.isEnabled = false
            sender.setTitle("O", for: .disabled)
            ticTacToe.top[sender.tag] = "O"
            let isThereAWinner = checkForWinner(game: ticTacToe)
            if isThereAWinner {
                self.disableAllButtons()
                score.increasesScorePOne()
                self.playerTwoLabel.text = "O PlayerTwo: \(score.playerTwoWins)"
            } else {
            currentPlayer = .one
            }
        }
        
        
    }
    
    @IBAction func middleButtonsPressed(_ sender: UIButton) {
        switch currentPlayer {
        case .one:
            sender.isEnabled = false
            sender.setTitle("X", for: .disabled)
            ticTacToe.top[sender.tag] = "X"
            let isThereAWinner = checkForWinner(game: ticTacToe)
            if isThereAWinner {
                self.disableAllButtons()
                score.increasesScorePOne()
                self.playerOneLabel.text = "X PlayerOne: \(score.playerOneWins)"
            } else {
            currentPlayer = .two
            }
        case .two:
            sender.isEnabled = false
            sender.setTitle("O", for: .disabled)
            ticTacToe.top[sender.tag] = "O"
            let isThereAWinner = checkForWinner(game: ticTacToe)
            if isThereAWinner {
                self.disableAllButtons()
                score.increasesScorePOne()
                self.playerTwoLabel.text = "O PlayerTwo: \(score.playerTwoWins)"
            } else {
            currentPlayer = .one
            }
        }
    }
    @IBAction func bottomButtonsPressed(_ sender: UIButton) {
        switch currentPlayer {
        case .one:
            sender.isEnabled = false
            sender.setTitle("X", for: .disabled)
            ticTacToe.top[sender.tag] = "X"
            let isThereAWinner = checkForWinner(game: ticTacToe)
            if isThereAWinner {
                self.disableAllButtons()
                score.increasesScorePOne()
                self.playerOneLabel.text = "X PlayerOne: \(score.playerOneWins)"
            } else {
            currentPlayer = .two
            }
        case .two:
            sender.isEnabled = false
            sender.setTitle("O", for: .disabled)
            ticTacToe.top[sender.tag] = "O"
            let isThereAWinner = checkForWinner(game: ticTacToe)
            if isThereAWinner {
                self.disableAllButtons()
                score.increasesScorePOne()
                self.playerTwoLabel.text = "O PlayerTwo: \(score.playerTwoWins)"
            } else {
            currentPlayer = .one
            }
        }
    }

    
    
    func disableAllButtons() {
        topLeftButton.isEnabled = false
        topMiddleButton.isEnabled = false
        topRightButton.isEnabled = false
        middleLeftButton.isEnabled = false
        middleMiddleButton.isEnabled = false
        middleRightButton.isEnabled = false
        bottomLeftButton.isEnabled = false
        bottomMiddleButton.isEnabled = false
        bottomRightButton.isEnabled = false
    }
    func enableAllButtons() {
        topLeftButton.isEnabled = true
        topMiddleButton.isEnabled = true
        topRightButton.isEnabled = true
        middleLeftButton.isEnabled = true
        middleMiddleButton.isEnabled = true
        middleRightButton.isEnabled = true
        bottomLeftButton.isEnabled = true
        bottomMiddleButton.isEnabled = true
        bottomRightButton.isEnabled = true
    }
    func resetAllButtons() {
        topLeftButton.setTitle("", for: .normal)
        topMiddleButton.setTitle("", for: .normal)
        topRightButton.setTitle("", for: .normal)
        middleLeftButton.setTitle("", for: .normal)
        middleMiddleButton.setTitle("", for: .normal)
        middleRightButton.setTitle("", for: .normal)
        bottomLeftButton.setTitle("", for: .normal)
        bottomMiddleButton.setTitle("", for: .normal)
        bottomRightButton.setTitle("", for: .normal)
    }
    func hidesLines() {
        self.diagonalTL.isHidden = true
        self.diagonalMM.isHidden = true
        self.diagonalBR.isHidden = true
        self.diagonalTR.isHidden = true
        self.diagonalMM2.isHidden = true
        self.diagonalBL.isHidden = true
        self.horizontalTopLine.isHidden = true
        self.horizontalMidLine.isHidden = true
        self.horizontalBotLine.isHidden = true
        self.verticalOne.isHidden = true
        self.verticalTwo.isHidden = true
        self.verticalThree.isHidden = true
    }
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        enableAllButtons()
        resetAllButtons()
        hidesLines()
        ticTacToe.top = ["","",""]
        ticTacToe.middle = ["","",""]
        ticTacToe.bottom = ["","",""]
        currentPlayer = .one
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.diagonalTL.isHidden = true
        self.diagonalMM.isHidden = true
        self.diagonalBR.isHidden = true
        self.diagonalTR.isHidden = true
        self.diagonalMM2.isHidden = true
        self.diagonalBL.isHidden = true
        self.horizontalTopLine.isHidden = true
        self.horizontalMidLine.isHidden = true
        self.horizontalBotLine.isHidden = true
        self.verticalOne.isHidden = true
        self.verticalTwo.isHidden = true
        self.verticalThree.isHidden = true
        
        var topRowButtons: [UIButton] = []
        if let topl = topLeftButton, let topm = topMiddleButton, let topr = topRightButton {
            topRowButtons = [topl,topm,topr]
        }
        var middleRowButtons: [UIButton] = []
        if let midl = middleLeftButton, let midm = middleMiddleButton, let midr = middleRightButton {
            middleRowButtons = [midl,midm,midr]
        }
        var bottomRowButtons: [UIButton] = []
        if let botl = bottomLeftButton, let botm = bottomMiddleButton, let botr = bottomRightButton {
            bottomRowButtons = [botl,botm,botr]
        }
        
        var ticTacToeBoard = GameBoard(topRow: topRowButtons, middleRow: middleRowButtons, bottomRow: bottomRowButtons)
        
        func checkForWins() -> Bool {
            switch true {
            case ticTacToeBoard.checkForWinDiagonalsTLTBR():
                self.topLeftButton.backgroundColor = UIColor.blue
                self.middleMiddleButton.backgroundColor = UIColor.blue
                self.bottomRightButton.backgroundColor = UIColor.blue
                disableAllButtons()
                return true
            case ticTacToeBoard.checkForWinDiagonalsTRTBL():
                self.topRightButton.backgroundColor = UIColor.blue
                self.middleMiddleButton.backgroundColor = UIColor.blue
                self.bottomLeftButton.backgroundColor = UIColor.blue
                disableAllButtons()
                return true
            case ticTacToeBoard.CFWHorizontalTop():
                self.topLeftButton.backgroundColor = UIColor.blue
                self.topMiddleButton.backgroundColor = UIColor.blue
                self.topRightButton.backgroundColor = UIColor.blue
                disableAllButtons()
                return true
            case ticTacToeBoard.CFWHorizontalMiddle():
                self.middleLeftButton.backgroundColor = UIColor.blue
                self.middleMiddleButton.backgroundColor = UIColor.blue
                self.middleRightButton.backgroundColor = UIColor.blue
                disableAllButtons()
                return true
            case ticTacToeBoard.CFWHorizontalBottom():
                self.bottomLeftButton.backgroundColor = UIColor.blue
                self.bottomMiddleButton.backgroundColor = UIColor.blue
                self.bottomRightButton.backgroundColor = UIColor.blue
                disableAllButtons()
                return true
            case ticTacToeBoard.CFWVerticalFirstColumn():
                self.topLeftButton.backgroundColor = UIColor.blue
                self.middleLeftButton.backgroundColor = UIColor.blue
                self.bottomLeftButton.backgroundColor = UIColor.blue
                disableAllButtons()
                return true
            case ticTacToeBoard.CFWVerticalSecondColumn():
                self.topMiddleButton.backgroundColor = UIColor.blue
                self.middleMiddleButton.backgroundColor = UIColor.blue
                self.bottomMiddleButton.backgroundColor = UIColor.blue
                disableAllButtons()
                return true
            case ticTacToeBoard.CFWVerticalThirdColumn():
                self.topRightButton.backgroundColor = UIColor.blue
                self.middleRightButton.backgroundColor = UIColor.blue
                self.bottomRightButton.backgroundColor = UIColor.blue
                
                return true
            default:
                return false
            }
        }
        
        
    }


}

