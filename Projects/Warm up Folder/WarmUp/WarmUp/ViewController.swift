//
//  ViewController.swift
//  WarmUp
//
//  Created by Angela Garrovillas on 8/5/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var `switch`: UISwitch!
    
    var switchVar: SwitchEnum = .on
    @IBAction func switchPressed(_ sender: UISwitch) {
        switch switchVar {
        case .on:
            switchVar = .off
            slider.isHidden = true
            slider.isEnabled = false
        case .off:
            switchVar = .on
            slider.isHidden = false
            slider.isEnabled = true
        }
    }
    @IBAction func slipNSlide(_ sender: Any) {
        let value = CGFloat(slider.value)
        self.view.backgroundColor = UIColor(displayP3Red: 0.581, green: 0.129, blue: 0.575, alpha: value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

