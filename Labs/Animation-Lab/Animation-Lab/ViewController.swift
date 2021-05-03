//
//  ViewController.swift
//  Animation-Lab
//
//  Created by Angela Garrovillas on 10/11/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    lazy var animationTime: Double = self.animationTimeView.stepper.value
    lazy var distance: Double = self.distanceView.stepper.value
    
    lazy var circle: UIView = {
        var view = UIView()
        var frame = view.frame
        frame.size.height = 150
        frame.size.width = 150
        view.frame = frame
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = view.frame.height / 2
        return view
    }()
    lazy var downButton: UIButton = {
        var button = UIButton()
        button.setTitle("Move Circle Down", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 0
        button.addTarget(self, action: #selector(directionButtonsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var upButton: UIButton = {
        var button = UIButton()
        button.setTitle("Move Circle Up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
        button.addTarget(self, action: #selector(directionButtonsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var leftButton: UIButton = {
        var button = UIButton()
        button.setTitle("Move Circle Left", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 2
        button.addTarget(self, action: #selector(directionButtonsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var rightButton: UIButton = {
        var button = UIButton()
        button.setTitle("Move Circle Right", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 3
        button.addTarget(self, action: #selector(directionButtonsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    var animationTimeView = AnimationTimeView()
    var distanceView = DistanceView()
    var animationPicker = PickerView()
    
    
    //MARK: - Functions
    private func addSubviews() {
        self.view.addSubview(circle)
        self.view.addSubview(downButton)
        self.view.addSubview(upButton)
        self.view.addSubview(animationTimeView)
        self.view.addSubview(distanceView)
        self.view.addSubview(leftButton)
        self.view.addSubview(rightButton)
        self.view.addSubview(animationPicker)
        
        
    }
    private func setConstraints() {
        circle.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        circle.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        circle.heightAnchor.constraint(equalToConstant: circle.frame.height).isActive = true
        circle.widthAnchor.constraint(equalToConstant: circle.frame.width).isActive = true
        
        downButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        downButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
       
        
        upButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        upButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        animationTimeView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 300).isActive = true
        animationTimeView.bottomAnchor.constraint(equalTo: downButton.topAnchor).isActive = true
        animationTimeView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        distanceView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 300).isActive = true
        distanceView.bottomAnchor.constraint(equalTo: upButton.topAnchor).isActive = true
        distanceView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        distanceView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        leftButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        leftButton.bottomAnchor.constraint(equalTo: animationTimeView.topAnchor).isActive = true
        
        rightButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        rightButton.bottomAnchor.constraint(equalTo: distanceView.topAnchor).isActive = true
        
        animationPicker.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    private func addBehaviorToStepper() {
        animationTimeView.stepper.addTarget(self, action: #selector(timeStepped(sender:)), for: .valueChanged)
        distanceView.stepper.addTarget(self, action: #selector(distanceStepped(sender:)), for: .valueChanged)
    }
    private func setUI() {
        self.view.backgroundColor = .white
        addSubviews()
        setConstraints()
        addBehaviorToStepper()
    }
    @objc func timeStepped(sender: UIStepper) {
        animationTimeView.label.text = "Time: \(round(sender.value * 100) / 100)"
        animationTime = sender.value
    }
    @objc func distanceStepped(sender: UIStepper) {
        distanceView.label.text = "Distance: \(Int(sender.value))"
        distance = sender.value
    }
    @objc func directionButtonsPressed(sender: UIButton) {
        let pickerTitle = animationArray[animationPicker.selectedRow(inComponent: 0)]
        let option = StringToAnimationOption(string: pickerTitle)
        
        if sender.tag == 0 {
            UIView.animate(withDuration: self.animationTime, delay: 0.4, options: option, animations: {
                self.circle.frame.origin.y += CGFloat(self.distance)
            }, completion: nil)
        } else if sender.tag == 1 {
            UIView.animate(withDuration: self.animationTime, delay: 0.4, options: option, animations: {
                self.circle.frame.origin.y -= CGFloat(self.distance)
            }, completion: nil)
        } else if sender.tag == 2 {
            UIView.animate(withDuration: self.animationTime, delay: 0.4, options: option, animations: {
                self.circle.frame.origin.x -= CGFloat(self.distance / 2)
            }, completion: nil)
        } else if sender.tag == 3 {
            UIView.animate(withDuration: self.animationTime, delay: 0.4, options: option, animations: {
                self.circle.frame.origin.x += CGFloat(self.distance / 2)
            }, completion: nil)
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }


}

