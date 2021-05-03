//
//  ViewController.swift
//  WarmUp-Sept24
//
//  Created by Angela Garrovillas on 9/24/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    let userNameKey = "username"
    let fontsizeKey = "fontsize"
    let isUpperCasedKey = "caseIsOn"
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    @IBOutlet weak var uppercaseSwitch: UISwitch!
    @IBOutlet weak var usernameTextField: UITextField!
    
 
    @IBAction func caseSwitched(_ sender: UISwitch) {
        welcomeLabel.text = sender.isOn ? welcomeLabel.text?.uppercased() : welcomeLabel.text?.lowercased()
        defaults.set(sender.isOn, forKey: isUpperCasedKey)
        //ternary -> bool ? true : false
    }
    @IBAction func fontSizedStepped(_ sender: UIStepper) {
        welcomeLabel.font = UIFont(name: welcomeLabel.font.fontName, size: CGFloat(sender.value))
        defaults.set(sender.value, forKey: fontsizeKey)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        setDefaults()
    }

    private func setDefaults() {
        if let name = defaults.string(forKey: userNameKey) {
            welcomeLabel.text = "Welcome " + " " + name
        }
        
        uppercaseSwitch.isOn = defaults.bool(forKey: isUpperCasedKey)
        
        let savedFontSize = defaults.double(forKey: fontsizeKey)
        fontSizeStepper.value = savedFontSize
        welcomeLabel.font = welcomeLabel.font.withSize(CGFloat(savedFontSize))

    }
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let unwrap = textField.text {
        welcomeLabel.text = "Welcome \(unwrap)"
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            welcomeLabel.text = "Welcome \(updatedText)"
            defaults.set(updatedText, forKey: userNameKey)
        }
        //could just use ibAction from textField: Editing Changed
        return true
    }
    
    
    /*
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     // https://stackoverflow.com/questions/25621496/how-shouldchangecharactersinrange-works-in-swift
     if let text = textField.text,
     let textRange = Range(range, in: text) {
     let updatedText = text.replacingCharacters(in: textRange, with: string)
     username = updatedText
     }
     return true
     }
     */
}
