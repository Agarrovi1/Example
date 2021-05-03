//
//  ViewController.swift
//  ColorSlider
//
//  Created by Angela Garrovillas on 8/20/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    private func updateViewBackground() {
        let currentColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        self.view.backgroundColor = currentColor
    }

    @IBAction func slidingSliders(_ sender: UISlider) {
        self.sliderDidChange()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewBackground()
        // Do any additional setup after loading the view.
    }
}

extension ColorViewController: Colors {
    var red: CGFloat {return CGFloat(redSlider.value)}
    var green: CGFloat {return CGFloat(greenSlider.value)}
    var blue: CGFloat {return CGFloat(blueSlider.value)}
    
    func sliderDidChange() {
        updateViewBackground()
    }
    
}
