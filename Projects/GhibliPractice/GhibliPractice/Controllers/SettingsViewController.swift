//
//  SettingsViewController.swift
//  GhibliPractice
//
//  Created by Angela Garrovillas on 10/4/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    weak var delegate: SettingsDelegate?
    
    enum DarkModeSetting: String {
        case on
        case off
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var switchOnOrOff = false
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            setDarkMode(setting: .on)
        case false:
            setDarkMode(setting: .off)
        }
    }
    
    private func setDarkMode(setting: DarkModeSetting) {
        switch setting {
        case .on:
            delegate?.darkModeOn()
        case .off:
            delegate?.darkModeOff()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        switch switchOnOrOff {
        case true:
            self.darkModeSwitch.isOn = true
        case false:
            self.darkModeSwitch.isOn = false
        }
    }


}
