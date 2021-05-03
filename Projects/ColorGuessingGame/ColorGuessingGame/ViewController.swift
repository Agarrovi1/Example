//
//  ViewController.swift
//  ColorGuessingGame
//
//  Created by Angela Garrovillas on 7/30/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentColor = Color.generateRandomRGBValues()
    var score = ScoreBoard()
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var colorScreen: UIImageView!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var modeButton: UIButton!
    @IBOutlet weak var challengeButton: UIButton!
    
    var shuffled = mixTheButtons()
    var mode: Mode = .normal
    var challenge = false
    
    func matchColorForAllButtons() {
        matchColorWithWordForSwitching(buttonOne)
        matchColorWithWordForSwitching(buttonTwo)
        matchColorWithWordForSwitching(buttonThree)
    }
    
    
    @IBAction func challengeButtonPressed(_ sender: UIButton) {
        
        if challenge {
            challenge = false
            challengeButton.setTitle("Turn Challenge Mode On?", for: .normal)
            matchColorForAllButtons()
        } else {
            challenge = true
            challengeButton.setTitle("Turn Challenge Mode Off?", for: .normal)
        }
    }
    
    @IBAction func modeButtonPressed(_ sender: UIButton) {
        switch mode {
        case .normal:
            mode = .shuffled
            modeButton.setTitle("Tap for Normal Buttons Mode", for: .normal)
            challengeButton.isHidden = false
        case .shuffled:
            mode = .normal
            modeButton.setTitle("Tap for Swapping Buttons Mode", for: .normal)
            buttonOne.setTitle("Red", for: .normal)
            buttonTwo.setTitle("Green", for: .normal)
            buttonThree.setTitle("Blue", for: .normal)
            matchColorForAllButtons()
            challengeButton.isHidden = true
        }
    }
    
    
    @IBAction func chosenColor(_ sender: UIButton) {
        let answerAsString = currentColor.findTheGreatest()
        let answerAsTag = currentColor.findTheGreatestForTag()
        
        switch mode {
        case .normal:
            if sender.tag == answerAsTag {
                score.youWonScore()
                textLabel.text = "Correct!"
                currentColor = Color.generateRandomRGBValues()
            } else {
                score.youLostScore()
                textLabel.text = "Incorrect!"
                currentColor = Color.generateRandomRGBValues()
            }
            if score.HighScore < score.score {
                score.HighScore = score.score
            }
        case .shuffled:
            if sender.titleLabel?.text == answerAsString {
                score.youWonScore()
                textLabel.text = "Correct!"
                currentColor = Color.generateRandomRGBValues()
            } else {
                score.youLostScore()
                textLabel.text = "Incorrect!"
                currentColor = Color.generateRandomRGBValues()
            }
            if score.HighScore < score.score {
                score.HighScore = score.score
            }
            buttonOne.setTitle(shuffled[0], for: .normal)
            buttonTwo.setTitle(shuffled[1], for: .normal)
            buttonThree.setTitle(shuffled[2], for: .normal)
            if challenge == false {
            matchColorForAllButtons()
            }
        }
        
        
        highScoreLabel.text = "High Score: \(score.HighScore)"
        scoreLabel.text = "Score: \(score.score)"
        shuffled = shuffled.shuffled()
        self.colorScreen.backgroundColor = currentColor.changeToUIColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.colorScreen.backgroundColor = currentColor.changeToUIColor()
        self.challengeButton.isHidden = true
    }
}

