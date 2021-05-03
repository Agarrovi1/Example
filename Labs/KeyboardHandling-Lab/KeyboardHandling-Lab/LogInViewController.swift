//
//  LogInViewController.swift
//  KeyboardHandling-Lab
//
//  Created by Angela Garrovillas on 10/17/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    let textBox = UITextField()
    var scrollViewBottomConstraint:NSLayoutConstraint?
    
    var logInScreen = UIScrollView(frame: UIScreen.main.bounds)
    var logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Proceed with your Login"
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    var usernameTextField: UITextField = {
        var textfield = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        textfield.placeholder = "username"
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    var passwordTextField: UITextField = {
        var textfield = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        textfield.placeholder = "password"
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    func setUpScrollView() {
        view.addSubview(logInScreen)

        logInScreen.isScrollEnabled = true
        logInScreen.translatesAutoresizingMaskIntoConstraints = false
        logInScreen.showsVerticalScrollIndicator = true
        
        NSLayoutConstraint.activate([
            logInScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        logInScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        logInScreen.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        logInScreen.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
        scrollViewBottomConstraint = logInScreen.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        scrollViewBottomConstraint?.isActive = true
    }
    
    func setGradient() {
        let gradient = GradientView()
        logInScreen.addSubview(gradient)
        gradient.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gradient.topAnchor.constraint(equalTo: logInScreen.topAnchor),
            gradient.bottomAnchor.constraint(equalTo: logInScreen.bottomAnchor),
            gradient.leadingAnchor.constraint(equalTo: logInScreen.leadingAnchor),
            gradient.trailingAnchor.constraint(equalTo: logInScreen.trailingAnchor),
            gradient.widthAnchor.constraint(equalTo: logInScreen.widthAnchor),
            gradient.heightAnchor.constraint(equalTo: logInScreen.heightAnchor, multiplier: 2)])
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        gradient.addGestureRecognizer(tap)
    }
    
    @objc func didTap(sender: UITapGestureRecognizer) {
        textBox.resignFirstResponder()
    }
    
    func setTextView() {
        textBox.backgroundColor = .white
        textBox.translatesAutoresizingMaskIntoConstraints = false
        logInScreen.addSubview(textBox)
        NSLayoutConstraint.activate([
            textBox.topAnchor.constraint(equalTo: logInScreen.topAnchor, constant: 20),
        textBox.leadingAnchor.constraint(equalTo: logInScreen.leadingAnchor, constant: 20),
        textBox.trailingAnchor.constraint(equalTo: logInScreen.trailingAnchor, constant: -20),
        textBox.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    @objc func changeScrollView(notification: Notification) {
        guard notification.name != UIResponder.keyboardWillHideNotification else {
            scrollViewBottomConstraint?.constant = 0
            return
        }
        guard let info = notification.userInfo else {
            return
        }
        guard let frameInfo = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        
        defer {
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
        
        let keyboardFrame = view.convert(frameInfo.cgRectValue, to: view)
        let scrollViewFrame = view.convert(logInScreen.frame, to: view)
        let heightChange = scrollViewFrame.intersection(keyboardFrame).height
        self.scrollViewBottomConstraint?.constant = -heightChange
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        setUpScrollView()
//        setLabel()
//        view.layoutIfNeeded()
//        setTextFields()
        setGradient()
        setTextView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeScrollView), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeScrollView), name: UIResponder.keyboardWillHideNotification, object: nil)
       
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        logInScreen.frame = view.bounds
//        logInScreen.updateContentView()
//    }

}

//extension UIScrollView {
//    func updateContentView() {
//        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
//
//        contentSize.width = subviews.sorted(by: { $0.frame.maxX < $1.frame.maxX }).last?.frame.maxX ?? contentSize.width
//    }
//}

class GradientView: UIView {
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let gradientLayer = layer as? CAGradientLayer else {
            return
        }
        gradientLayer.colors = [
            UIColor.purple.cgColor,
            UIColor.yellow.cgColor,
            UIColor.purple.cgColor
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
