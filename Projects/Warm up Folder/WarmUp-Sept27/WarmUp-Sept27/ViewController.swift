//
//  ViewController.swift
//  WarmUp-Sept27
//
//  Created by Angela Garrovillas on 9/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBAction func switchSwitched(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            setDarkMode()
        case false:
            turnDarkModeOff()
        }
        UserDefaultsWrapper.wrapper.store(darkmode: sender.isOn)
    }
    func defaultMode() {
        if let defaults = UserDefaultsWrapper.wrapper.getDarkMode() {
            switch defaults {
            case true:
                setDarkMode()
                darkModeSwitch.isOn = true
            case false:
                turnDarkModeOff()
                darkModeSwitch.isOn = false
            }
        } else {
            setDarkMode()
        }
    }
    func setDarkMode() {
        self.view.backgroundColor = .darkGray
        textView.textColor = .white
        settingLabel.textColor = .white
        settingLabel.text = "We are in dark mode"
    }
    func turnDarkModeOff() {
        self.view.backgroundColor = .white
        textView.textColor = .black
        settingLabel.textColor = .black
        settingLabel.text = "We aren't in dark mode"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeSwitch.transform = CGAffineTransform(scaleX: 2.75, y: 2.75)
        defaultMode()
        // Do any additional setup after loading the view.
    }


}

