//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Angela Garrovillas on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: -- Properties
    var crayon: Crayon!
    var delegate: DetailControllerDelegate?
    
    //MARK: -- IBOutlets
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //MARK: -- IBActions
    @IBAction func sliderSlides(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redTextField.text = ""
        case 1:
            greenTextField.text = ""
        case 2:
            blueTextField.text = ""
        default:
            print("check")
        }
        updateViewBackground()
    }
    @IBAction func stepperTapped(_ sender: UIStepper) {
        updateViewBackground()
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        redTextField.text = ""
        greenTextField.text = ""
        blueTextField.text = ""
        resetValues()
    }
    
    @IBAction func typedInValue(_ sender: UITextField) {
        guard let unwrap = sender.text?.uppercased() else {return print("not going through")}
        if unwrap != "01", let value = Float(unwrap), value <= 1 {
            switch sender.tag {
            case 0:
                redSlider.value = value
            case 1:
                greenSlider.value = value
            case 2:
                blueSlider.value = value
            default:
                updateViewBackground()
            }
        } else {
            let hexDict = makeHexIntoDict(hex: unwrap)
            let newSliderValue = getValueFromHex(dict: hexDict, first: 0, second: 1) / 255
            switch sender.tag {
            case 0:
                redSlider.value = Float(newSliderValue)
            case 1:
                greenSlider.value = Float(newSliderValue)
            case 2:
                blueSlider.value = Float(newSliderValue)
            default:
                updateViewBackground()
            }
        }
        updateViewBackground()
        sender.text = ""
    }
    @IBAction func segControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            updateViewBackground()
        case 1:
            updateViewBackground()
        default:
            updateViewBackground()
        }
        updateViewBackground()
    }
    
    //MARK: -- Functions
    private func updateViewBackground() {
        let newColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepper.value))
        updateLabelValues()
        self.view.backgroundColor = newColor
        delegate?.updateColor(new: newColor)
    }
    
    private func updateLabelValues() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            redValueLabel.text = "Red: \(redSlider.value)"
            greenValueLabel.text = "Green: \(greenSlider.value)"
            blueValueLabel.text = "Blue: \(blueSlider.value)"
            redTextField.placeholder = "Red: \(redSlider.value)"
            greenTextField.placeholder = "Green: \(greenSlider.value)"
            blueTextField.placeholder = "Blue: \(blueSlider.value)"
        case 1:
            updateLabelWithHex()
        default:
            print("something Wrong")
        }
        alphaValueLabel.text = "Alpha: \(alphaStepper.value)"
    }
    
    //MARK: -- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        crayon.delegate = self
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        crayon.delegate?.resetValues()
        self.view.backgroundColor = crayon.getUIColor()
        
        // Do any additional setup after loading the view.
    }
}
//MARK: -- Extensions
extension DetailViewController: UIColorable {
    var defaultRed: Float {return Float(crayon.red/255)}
    var defaultGreen: Float {return Float(crayon.green/255)}
    var defaultBlue: Float {return Float(crayon.blue/255)}
    var defaultAlpha: Double {return 1}
    
    var hexRed: String {return getHex(from: Double(redSlider.value) * 255)}
    var hexGreen: String {return getHex(from: Double(greenSlider.value) * 255)}
    var hexBlue: String {return getHex(from: Double(blueSlider.value) * 255)}
    
    func resetValues() {
        nameLabel.text = crayon.name
        redSlider.value = defaultRed
        greenSlider.value = defaultGreen
        blueSlider.value = defaultBlue
        alphaStepper.value = 1
        updateViewBackground()
    }
    func updateLabelWithHex() {
        redValueLabel.text = "Red: \(hexRed)"
        greenValueLabel.text = "Green: \(hexGreen)"
        blueValueLabel.text = "Blue: \(hexBlue)"
        redTextField.placeholder = "Red: \(hexRed)"
        greenTextField.placeholder = "Green: \(hexGreen)"
        blueTextField.placeholder = "Blue: \(hexBlue)"
    }
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateViewBackground()
        return true
    }
}
