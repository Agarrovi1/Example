//
//  ViewController.swift
//  intro-to-programmatic-ui
//
//  Created by David Rifkin on 10/7/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

//let vc = ViewController()

class ViewController: UIViewController {

    private var greenModeStatus = false {
        didSet {
            refreshGreenMode()
        }
    }
   lazy var statusLabel: UILabel = {
        let statusLabel = UILabel(frame: CGRect(x: 186, y: 442, width: 300, height: 21))
        statusLabel.text = "Green Mode is on!"
        return statusLabel
    }()
    
    lazy var greenSwitch: UISwitch = {
        let greenSwitch = UISwitch()
            //UISwitch(frame: CGRect(x: 182.5, y: 391, width: 51, height: 30))
        greenSwitch.isOn = true
        //adds action to control
        greenSwitch.addTarget(self, action: #selector(modeSwitched(sender:)), for: .valueChanged)
        return greenSwitch
    }()
    
//    func labelish() {
//        let label = UILabel(frame: CGRect(x: 40, y: 300, width: 300, height: 40))
//        label.textColor = .blue
//        label.backgroundColor = .blue
//        label.text = "hello World"
//        self.view.addSubview(label)
//    }
    
    
    private func setupSubviews() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(greenSwitch)
        self.view.addSubview(statusLabel)
    }
    private func addConstraintsToSubviews() {
        //NSLayoutConstraint.activate([])
        //can use ^ to activate each constraint in the array
       let thisConstraint = greenSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let thatConstraint = greenSwitch.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        thatConstraint.isActive = true
        thisConstraint.isActive = true
        
        statusLabel.centerXAnchor.constraint(equalTo: greenSwitch.centerXAnchor).isActive = true
        statusLabel.topAnchor.constraint(equalTo: greenSwitch.bottomAnchor, constant: 30).isActive = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        addConstraintsToSubviews()
        greenModeStatus = true
    }

//    @IBAction func modeSwitchPressed(_ sender: UISwitch) {
//        self.greenModeStatus = sender.isOn
//    }
    @objc func modeSwitched(sender: UISwitch) {
        self.greenModeStatus = sender.isOn
    }
    
    private func refreshGreenMode() {
        if greenModeStatus {
            self.view.backgroundColor = .green
            self.statusLabel.textColor = .white
            self.statusLabel.text = "Green Mode is on!"
        } else {
            self.view.backgroundColor = .white
            self.statusLabel.textColor = .green
            self.statusLabel.text = "Green Mode is off!"
        }
    }
}

