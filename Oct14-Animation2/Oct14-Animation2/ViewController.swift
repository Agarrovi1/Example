//
//  ViewController.swift
//  Oct14-Animation2
//
//  Created by Angela Garrovillas on 10/14/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let circle = UIView()
    let stepper = UIStepper()
    
    func setupCircle() {
        view.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        var frame = circle.frame.size
        frame.height = 100
        frame.width = 100
        circle.frame.size = frame
        circle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.heightAnchor.constraint(equalToConstant: circle.frame.height).isActive = true
        circle.widthAnchor.constraint(equalToConstant: circle.frame.width).isActive = true
        circle.layer.cornerRadius = circle.frame.height / 2
        circle.clipsToBounds = true
    }
    func setupStepper() {
        view.addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = 1
        stepper.stepValue = 0.25
        stepper.minimumValue = 0.25
        stepper.maximumValue = 3
        stepper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stepper.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stepper.addTarget(self, action: #selector(stepped(sender:)), for: .valueChanged)
    }
    @objc func stepped(sender: UIStepper) {
        UIView.animate(withDuration: 1.0, animations: {
            
            self.circle.transform = CGAffineTransform.init(scaleX: CGFloat(self.stepper.value), y: CGFloat(self.stepper.value))
        }, completion: nil)
    }
    func setupUI() {
        setupCircle()
        setupStepper()
    }
    func keyButtonPressed() {
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [.calculationModePaced], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 3.0) {
                self.myViewCenterYConstraint.constant -= 200
            }
            
        }, completion: nil)
    }

    lazy var myViewCenterYConstraint: NSLayoutConstraint = {
        self.circle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupUI()
        // Do any additional setup after loading the view.
    }


}

