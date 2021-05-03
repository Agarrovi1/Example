//
//  ViewController.swift
//  DidIGetIt
//
//  Created by Angela Garrovillas on 5/4/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Color bottons
    
    @IBOutlet weak var buttonOne: UIView!
    @IBOutlet weak var buttonTwo: UIView!
    @IBOutlet weak var buttonThree: UIView!
    @IBOutlet weak var buttonFour: UIView!
    @IBOutlet weak var buttonFive: UIView!
    
    //UIObjects
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var responseLabelRed: UILabel!
    @IBOutlet weak var responseLabelWhite: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    //Function
    func switchColors(button: UIView) {
        switch button.backgroundColor! {
        case .white:
            button.backgroundColor = .red
        case .red:
            button.backgroundColor = .blue
        case .blue:
            button.backgroundColor = .green
        case .green:
            button.backgroundColor = .black
        case .black:
            button.backgroundColor = .purple
        case .purple:
            button.backgroundColor = .orange
        case .orange:
            button.backgroundColor = .yellow
        case .yellow:
            button.backgroundColor = .white
        default:
            button.backgroundColor = .white
        }
    }
    
    
    
    @IBAction func tapOne(_ sender: UITapGestureRecognizer) {
        switchColors(button: buttonOne)
    }
    
    
    
    
    

}

