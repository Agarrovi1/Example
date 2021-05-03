//
//  ViewController.swift
//  NotificationLab
//
//  Created by Angela Garrovillas on 10/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    //MARK: UIObjects
    var timer: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .countDownTimer
        timePicker.layer.borderColor = UIColor.white.cgColor
        timePicker.layer.borderWidth = 2
        timePicker.layer.cornerRadius = 20
        return timePicker
    }()
    var messageTextField: UITextField = {
        let textBox = UITextField()
        textBox.borderStyle = .roundedRect
        textBox.backgroundColor = .white
        return textBox
    }()
    var launchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.setTitle("Launch", for: .normal)
        button.addTarget(self, action: #selector(launchButtonPressed), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = true
        return button
    }()
    
    
    //MARK: - Setup
    private func setVCUI() {
        view.backgroundColor = .systemPink
        setTimerConstraints()
        setMessageConstraints()
        setLaunchButton()
    }
    
    //MARK: - Constraints
    private func setTimerConstraints() {
        view.addSubview(timer)
        timer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            timer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])
    }
    private func setMessageConstraints() {
        view.addSubview(messageTextField)
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageTextField.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 50),
            messageTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            messageTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)])
    }
    private func setLaunchButton() {
        view.addSubview(launchButton)
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        launchButton.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 50),
        launchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
        launchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)])
    }
    //MARK: - Functions
    @objc func launchButtonPressed() {
        guard let text = messageTextField.text, text != "" else {return}
        
        let newTime = Times(time: timer.countDownDuration,endTime: Date().addingTimeInterval(timer.countDownDuration), message: text)
        makeNotification(message: newTime.message, times: newTime)
        makeAlert(message: "Made New Notification")
    }
    
    private func makeNotification(message: String, times: Times) {
        let identifier = "Alert"
        let center = UNUserNotificationCenter.current()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: times.time, repeats: false)
        let content = UNMutableNotificationContent()
        
        content.title = "Reminder"
        content.body = times.message
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
    }
    private func makeAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setVCUI()
        // Do any additional setup after loading the view.
    }


}

