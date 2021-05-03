//
//  ViewController.swift
//  Delegates
//
//  Created by Angela Garrovillas on 8/5/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //add an action from your UITextField that updates someUI type (you know the one) with the text that is in the UITextField
    //hint- you can look up how to use the return key to trigger that action
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func hitEnterInTextField(_ sender: UITextField) {
        label.text = sender.text
//        if let uwrap = text {
//            label.text = uwrap
//        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
//        if (textField.delegate?.textFieldShouldReturn?(textField))! {
//            label.text = "It Worked"
//        } else {
//            label.text = "It didn't work"
//        }
    }
    //kinda like the comparable and the equatable protocols
    //changes what it means to press the return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.backgroundColor = UIColor(red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: CGFloat.random(in: 0.0...1.0))
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
    }
    func  doSomethingInTheTextField() {
        //textField.delegate?.
    }


}

