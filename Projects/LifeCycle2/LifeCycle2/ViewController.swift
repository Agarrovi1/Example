//
//  ViewController.swift
//  LifeCycle2
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func theSwitch(_ sender: UISwitch) {
        let isThisThingOn = !sender.isOn
        sender.setOn(isThisThingOn, animated: true)
    }
    var currentStepperValue = 0.0
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        print(currentStepperValue)
        currentStepperValue = sender.value
        print("then I increased it to \(currentStepperValue)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

