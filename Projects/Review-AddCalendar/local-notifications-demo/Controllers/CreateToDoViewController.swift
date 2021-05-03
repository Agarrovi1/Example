//
//  CreateToDoViewController.swift
//  local-notifications-demo
//
//  Created by David Rifkin on 10/29/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
import UserNotifications

class CreateToDoViewController: UIViewController {
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        picker.minimumDate = Date().advanced(by: 60)
        return picker
    }()
    
    lazy var toDoNameField : UITextField = {
        let toDoNameField = UITextField()
        toDoNameField.placeholder = "Enter.."
        toDoNameField.borderStyle = .line
        toDoNameField.backgroundColor = .white
        return toDoNameField
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        return button
    }()

    lazy var addLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add location", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(addLocationButtonPressed), for: .touchUpInside)
        return button
    }()

    @objc func createButtonPressed() {
        guard let title = toDoNameField.text, title != "" else {
            errorAlert(title: "Error", message: "Invalid Entry")
            return}
        
        let newToDo = ToDo(title: title, dueBy: datePicker.date)
        do {
            try ToDoPersistenceHelper.manager.save(newToDo: newToDo)
            //let's set this up to trigger in the amount of time from now to the date in the picker
            createIntervalNotification(title: title)
            navigationController?.popViewController(animated: true)
        } catch {
            errorAlert(title: "Error", message: "Could not save: \(error)")
            return
        }
    }
    
    @objc func addLocationButtonPressed() {
           self.navigationController?.pushViewController(PickLocationViewController(),animated: true)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(datePicker)
        view.addSubview(toDoNameField)
        view.addSubview(submitButton)
        view.addSubview(addLocationButton)
    }
    
    private func setConstraints() {
        setTextFieldConstraints()
        setDatePickerConstraints()
        setButtonConstraints()
    }
    
    private func errorAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert,animated: true)
    }
    
    
    private func setTextFieldConstraints() {
        toDoNameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toDoNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toDoNameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            toDoNameField.widthAnchor.constraint(equalToConstant: 300),
            toDoNameField.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setDatePickerConstraints() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: toDoNameField.bottomAnchor, constant: 30),
            datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func setButtonConstraints() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        addLocationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30),
            submitButton.centerXAnchor.constraint(equalTo: datePicker.centerXAnchor),
            addLocationButton.centerXAnchor.constraint(equalTo: datePicker.centerXAnchor),
            addLocationButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 30),
        ])
    }
    
    private func createIntervalNotification(title: String) {
        let intervalUntilNotification = abs(datePicker.date.timeIntervalSince(Date()))
        
        LocalNotificationGenerator.configureNotifications(title: "reminder", body: title, time: intervalUntilNotification)
    }
}
