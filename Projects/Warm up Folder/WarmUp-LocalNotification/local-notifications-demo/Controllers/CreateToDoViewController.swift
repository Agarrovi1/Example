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
        picker.backgroundColor = .white
        return picker
    }()
    
    //    TODO: add lazy var toDoNameField: UITextField
    lazy var toDoNameField: UITextField = {
        let textbox = UITextField()
        textbox.borderStyle = .roundedRect
        textbox.backgroundColor = .white
        textbox.placeholder = "Enter Name of To do"
        return textbox
    }()
    //    TODO: add lazy var submitButton whose action creates and persists a new ToDo, and navigates back one spot
    lazy var submitButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submitButtonPressed))
    
    private func makeLocalNotification(_ date: Date, _ newToDo: ToDo) {
        let identifier = "Alert"
        let center = UNUserNotificationCenter.current()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow, repeats: false)
        let content = UNMutableNotificationContent()
        
        content.title = "Reminder"
        content.body = newToDo.title
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
    }
    
    @objc func submitButtonPressed() {
        let date = datePicker.date
        guard let text = toDoNameField.text, text != "" else {
            return
        }
        let newToDo = ToDo(title: text, dueBy: date)
        do {
            let isDuplicate = try ToDoPersistenceHelper.manager.isDuplicate(selectedTitle: newToDo.title)
            if isDuplicate {
                return
            } else {
                try ToDoPersistenceHelper.manager.save(newToDo: newToDo)
                makeLocalNotification(date, newToDo)
            }
        } catch {
            print(error)
        }
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        addSubviews()
        addDatePickerConstraints()
        addFieldConstraints()
        //      TODO: add constraints for subviews
    }
    
    private func addSubviews() {
        self.view.addSubview(datePicker)
        self.view.addSubview(toDoNameField)
        navigationItem.rightBarButtonItem = submitButton
    }
    private func addDatePickerConstraints() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),datePicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])
    }
    private func addFieldConstraints() {
        toDoNameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toDoNameField.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 50),
            toDoNameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),toDoNameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)])
        
    }
}
