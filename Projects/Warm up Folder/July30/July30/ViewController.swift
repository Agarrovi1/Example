//
//  ViewController.swift
//  July30
//
//  Created by Angela Garrovillas on 7/30/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = Counter()
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func PressChange(_ sender: UIButton) {
        increaseCount()
        changeColor()
        updateCountLabel() //updates the UI
    }
    
    private func changeColor() {
        if self.view.backgroundColor != UIColor.blue {
            self.view.backgroundColor = UIColor.blue
        } else {
            self.view.backgroundColor = UIColor.red
        }
    }
    private func increaseCount() {
    self.counter.IncCount()
    
    }
    private func updateCountLabel() {
        self.countLabel.text = "The Count is \(counter.count)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

