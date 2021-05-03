//
//  DistanceView.swift
//  Animation-Lab
//
//  Created by Angela Garrovillas on 10/11/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class DistanceView: UIView {
    lazy var label: UILabel = {
        var label = UILabel()
        label.text = "Distance: \(self.stepper.value)"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    lazy var stepper: UIStepper = {
        var step = UIStepper()
        step.value = 100
        step.minimumValue = 50
        step.maximumValue = 250
        step.stepValue = 50
        step.translatesAutoresizingMaskIntoConstraints = false
        return step
    }()
    
    func addSubviews() {
        self.addSubview(label)
        self.addSubview(stepper)
    }
    func setConstraints() {
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        stepper.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        stepper.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stepper.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stepper.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        addSubviews()
        setConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
