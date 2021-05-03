//
//  ViewController.swift
//  TextTwist
//
//  Created by Angela Garrovillas on 8/5/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var letterBank: UILabel!
    @IBOutlet weak var guessCorrectOrNot: UILabel!
    @IBOutlet weak var threeLetterWords: UITextView!
    @IBOutlet weak var fourLetterWords: UITextView!
    @IBOutlet weak var fiveLetterWords: UITextView!
    @IBOutlet weak var sixLetterWords: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelUnguessedWords: UILabel!
    
    var currentTextTwist = WordData.pickRandomTextTwistInfo()
    var arrThree = [String]()
    var arrFour = [String]()
    var arrFive = [String]()
    var arrSix = [String]()
    
    @IBAction func userInput(_ sender: UITextField) {
        if let unwrapText = sender.text?.lowercased() {
            if currentTextTwist.words.contains(unwrapText) {
                guessCorrectOrNot.text = "Correct!"
                if !arrThree.contains(unwrapText) || !arrFour.contains(unwrapText) || !arrFive.contains(unwrapText) || !arrSix.contains(unwrapText) {
                    switch countLettersInWord(word: unwrapText) {
                    case 3:
                        arrThree.append(unwrapText)
                        threeLetterWords.text.append("\(unwrapText)\n")
                    case 4:
                        arrFour.append(unwrapText)
                        fourLetterWords.text.append("\(unwrapText)\n")
                    case 5:
                        arrFive.append(unwrapText)
                        fiveLetterWords.text.append("\(unwrapText)\n")
                    case 6:
                        arrSix.append(unwrapText)
                        sixLetterWords.text.append("\(unwrapText)\n")
                    default:
                        print(unwrapText)
                    }
                } else {
                    guessCorrectOrNot.text = "Already guessed!"
                }
            } else {
                guessCorrectOrNot.text = "Incorrect!"
            }
        }
        textField.text = ""
        let wordsGuessed = arrThree.count + arrFour.count + arrFive.count + arrSix.count
        let wordsLeft = currentTextTwist.wordCount - wordsGuessed
        labelUnguessedWords.text = "There are \(wordsLeft) left!"
    }
    func countLettersInWord(word: String) -> Int {
        return word.count
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        self.letterBank.text = currentTextTwist.letters
        threeLetterWords.isEditable = false
        fourLetterWords.isEditable = false
        fiveLetterWords.isEditable = false
        sixLetterWords.isEditable = false
        self.threeLetterWords.text = ""
        self.fourLetterWords.text = ""
        self.fiveLetterWords.text = ""
        self.sixLetterWords.text = ""
        self.labelUnguessedWords.text = "There are \(currentTextTwist.wordCount) to guess!"
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count > currentTextTwist.letters.count {
            return false
        }
        let allowedLetter = currentTextTwist.letters
        let allowedLetterSet = CharacterSet(charactersIn: allowedLetter)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        //try
        /*
         var nonempty = "non-empty"
         if let i = nonempty.firstIndex(of: "-") {
         nonempty.remove(at: i)
         -> "nonempty"
         }
         */
        var lastString = String()
        
        var recentChanges = currentTextTwist.letters
        if string != "" {
            letterBank.text = takeLetterAndReturnLeftoverOfLetterBank(string: string, letterBank: letterBank)
            lastString = string
        } else if string == "" {
            if let text = textField.text {
            recentChanges = addLetterToBank(text,currentLetterBank: letterBank.text)
                letterBank.text = recentChanges
            }
        }
    
        if !allowedLetterSet.isSuperset(of: typedCharacterSet) {
            guessCorrectOrNot.text = "You can't put in \(string)"
            return false
        }
        return allowedLetterSet.isSuperset(of: typedCharacterSet)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        letterBank.text = currentTextTwist.letters
        return true
    }
}

