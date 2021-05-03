//
//  CreateViewController.swift
//  Review-Unit4
//
//  Created by Angela Garrovillas on 10/23/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    //MARK: - UIObjects
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter item name"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var priceStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 1
        stepper.minimumValue = 0.0
        stepper.maximumValue = 20
        stepper.stepValue = 1
        stepper.backgroundColor = .white
        stepper.addTarget(self, action: #selector(stepperPressed(sender:)), for: .valueChanged)
        return stepper
    }()
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$\(1.0)"
        label.backgroundColor = .white
        label.textColor = .black
        return label
    }()
    //MARK: - Constraints
    private func setCreateUI() {
        setTextField()
        setStepper()
        setPriceLabel()
    }
    private func setTextField() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100)])
    }
    private func setStepper() {
        priceStepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceStepper)
        NSLayoutConstraint.activate([
            priceStepper.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 75),
            priceStepper.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])
    }
    private func setPriceLabel() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: priceStepper.centerYAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: priceStepper.leadingAnchor,constant: -20)])
    }
    
    //MARK: - Functions
    @objc func stepperPressed(sender: UIStepper) {
        priceLabel.text = "$\(round(sender.value * 100) / 100)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setCreateUI()
    }

    //self.navigation.popViewController - to go back after hitting submit button
}
