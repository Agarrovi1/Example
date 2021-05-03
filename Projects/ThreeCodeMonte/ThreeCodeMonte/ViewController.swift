//
//  ViewController.swift
//  ThreeCodeMonte
//
//  Created by Angela Garrovillas on 7/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardOne: UIButton!
    @IBOutlet weak var cardTwo: UIButton!
    @IBOutlet weak var cardThree: UIButton!
//    @IBOutlet weak var cardFour: UIButton!
//    @IBOutlet weak var cardFive: UIButton!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var ThreeCardMonte: UIView!
    
    @IBOutlet weak var winLoseLabel: UILabel!


    let array = [1,2,3]
    let queen = UIImage(named: "QueenOfHearts")
    let jackSpade = UIImage(named: "JackOfSpades")
    let jackClub = UIImage(named: "JackOfClubs")
    let back = UIImage(named: "backOfCard")
    var winCount = 0
    var lossCount = 0
    
    
    func cardPlacement() -> [Int] {
        let randomArr = array.shuffled()
        return randomArr
    }
    func theCardUnderneath(int: Int) -> UIImage? {
        switch int {
        case 1:
            return queen
        case 2:
            return jackSpade
        case 3:
            return jackClub
        default:
            return nil
        }
    }
    func isDisabled() {
        cardOne.isEnabled = false
        cardTwo.isEnabled = false
        cardThree.isEnabled = false
    }
    
    @IBAction func CardPressed(_ sender: UIButton) {
        let random = cardPlacement()
        let cardPressedImage = theCardUnderneath(int: random[sender.tag])
        switch sender.tag {
        case 0:
            cardOne.setImage(cardPressedImage, for: .normal)
            if random[0] == 1 {
                label.text = "You won!"
                winCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.green
            } else if random [1] == 1 {
                cardTwo.setImage(queen, for: .normal)
                label.text = "You lost!"
                lossCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.red
            } else if random[2] == 1 {
                cardThree.setImage(queen, for: .normal)
                label.text = "You lost!"
                lossCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.red
            }
        case 1:
            cardTwo.setImage(cardPressedImage, for: .normal)
            if random[1] == 1 {
                label.text = "You won!"
                winCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.green
            } else if random [0] == 1 {
                cardOne.setImage(queen, for: .normal)
                label.text = "You lost!"
                lossCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.red
            } else if random[2] == 1 {
                cardThree.setImage(queen, for: .normal)
                label.text = "You lost!"
                lossCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.red
            }
        default:
            cardThree.setImage(cardPressedImage, for: .normal)
            if random[2] == 1 {
                label.text = "You won!"
                winCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.green
            } else if random [0] == 1 {
                cardOne.setImage(queen, for: .normal)
                label.text = "You lost!"
                lossCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.red
            } else if random[1] == 1 {
                cardTwo.setImage(queen, for: .normal)
                label.text = "You lost!"
                lossCount += 1
                isDisabled()
                self.ThreeCardMonte.backgroundColor = UIColor.red
            }
        }
    }
    
    
    @IBAction func NewGame(_ sender: UIButton) {
        cardOne.setImage(back, for: .normal)
        cardTwo.setImage(back, for: .normal)
        cardThree.setImage(back, for: .normal)
        label.text = "Pick a card, any card"
        winLoseLabel.text = "Wins: \(winCount)  Loses: \(lossCount)"
        cardOne.isEnabled = true
        cardTwo.isEnabled = true
        cardThree.isEnabled = true
        self.ThreeCardMonte.backgroundColor = UIColor.white
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

