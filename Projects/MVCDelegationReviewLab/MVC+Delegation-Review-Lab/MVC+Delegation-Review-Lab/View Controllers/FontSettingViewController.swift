//
//  FontSettingViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Angela Garrovillas on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class FontSettingViewController: UIViewController {
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var fontSlider: UISlider!
    @IBOutlet weak var fontStepper: UIStepper!
    var newSliderValue: Float?
    var newStepperValue: Double?
    
    @IBAction func slidingSlider(_ sender: UISlider) {
        fontStepper.value = Double(sender.value)
        fontSizeLabel.text = "Preview Font Size: \(fontSlider.value)"
        //sender.value = roundf(sender.value * 2.0) / 2
        self.delegate?.fontDidChange(to: Double(sender.value))
    }
    @IBAction func steppingStepper(_ sender: UIStepper) {
        fontSlider.value = Float(sender.value)
        fontSizeLabel.text = "Preview Font Size: \(fontStepper.value)"
        self.delegate?.fontDidChange(to: sender.value)
    }
    
    var delegate: FontSettings?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let defaultSliderValue = newSliderValue, let defaultStepperValue = newStepperValue else {return}
        self.fontSlider.value = defaultSliderValue
        self.fontStepper.value = defaultStepperValue
        fontSizeLabel.text = "Preview Font Size: \(fontSlider.value)"
        // Do any additional setup after loading the view.
    }

}
