//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Angela Garrovillas on 7/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //by default view is ex. yellow
    @IBOutlet weak var ButtonOneOutlet: UIButton!
    @IBOutlet weak var labelWithText: UILabel!
    
    @IBAction func colorChangeToGoldWhenPressed(_ sender: UIButton) {
        //changes the color of the outermost view to selected color
        if self.view.backgroundColor != UIColor.yellow {
        self.view.backgroundColor = UIColor.yellow
        //self = viewController
        self.labelWithText.text = "This is yellow"
        } else {
            self.view.backgroundColor = UIColor.red
            self.labelWithText.text = "we're back to red"
        }
        
//        self.ButtonOneOutlet.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
    }
    
    @IBAction func colorChangeWhenPressed(_ sender: UIButton) {        self.view.backgroundColor = UIColor.cyan
        self.labelWithText.text = "This is cyan"
    }
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.red
        //changes it to red
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

