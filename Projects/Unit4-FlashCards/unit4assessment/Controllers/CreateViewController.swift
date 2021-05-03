//
//  CreateViewController.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    //MARK: - UIObjects
    lazy var cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
    lazy var createButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonPressed))
    var titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.adjustsFontSizeToFitWidth = false
        textField.placeholder = "Enter a flash card title"
        return textField
    }()
    var firstFactTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.placeholder = "Enter first flash card fact"
        return textField
    }()
    var secondFactTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.placeholder = "Enter second flash card fact"
        return textField
    }()
    
    //MARK: - Setup/ Contraints
    private func setupBarButtons() {
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = createButton
    }
    private func setupCreateUI() {
        setupBarButtons()
        setDelegates()
        setupTitleTextField()
        setupFirstFact()
        setupSecondFact()
    }
    private func setDelegates() {
        titleTextField.delegate = self
        firstFactTextField.delegate = self
        secondFactTextField.delegate = self
    }
    private func setupTitleTextField() {
        view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            titleTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)])
    }
    private func setupFirstFact() {
        view.addSubview(firstFactTextField)
        firstFactTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstFactTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 25),
            firstFactTextField.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            firstFactTextField.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            firstFactTextField.heightAnchor.constraint(equalToConstant: 150)])
    }
    private func setupSecondFact() {
        view.addSubview(secondFactTextField)
        secondFactTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondFactTextField.topAnchor.constraint(equalTo: firstFactTextField.bottomAnchor, constant: 25),
            secondFactTextField.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            secondFactTextField.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            secondFactTextField.heightAnchor.constraint(equalToConstant: 150)])
    }
    
    //MARK: - Functions
    private func makeAllMissingAlert() {
        makeGenericAlert(message: "Flash card requires title and 2 facts")
    }
    private func makeTitleMissingAlert() {
        makeGenericAlert(message: "Flash card requires a title")
    }
    private func makeFactsMissingAlert() {
        makeGenericAlert(message: "Flash card requires 2 facts")
    }
    private func makeGenericAlert(message: String) {
        let alert = UIAlertController(title: "Info Missing", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    private func makeSavedAlert() {
        let alert = UIAlertController(title: "Card Saved", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.tabBarController?.selectedIndex = 0
        })
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    private func makeAlreadyHaveAlert(title: String) {
        let alert = UIAlertController(title: "Card Not Saved", message: "\(title) already exists in Cards", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    private func checkIfCardExists(title: String) -> Bool {
        do {
            let cards = try CardPersistance.manager.getObjects()
            if cards.contains(where: { (card) -> Bool in
                card.cardTitle == title
            }) {
                return true
            } else {
                return false
            }
        } catch {
            print(error)
        }
        return false
    }
    @objc func createButtonPressed() {
        guard let titleText = titleTextField.text, let firstText = firstFactTextField.text, let secondText = secondFactTextField.text else {
            makeAllMissingAlert()
            return
        }
        if titleText.isEmpty, firstText.isEmpty, secondText.isEmpty {
            makeAllMissingAlert()
        } else if !titleText.isEmpty, firstText.isEmpty, secondText.isEmpty {
            makeFactsMissingAlert()
        } else if titleText.isEmpty, !firstText.isEmpty, !secondText.isEmpty {
            makeTitleMissingAlert()
        } else if !titleText.isEmpty, firstText.isEmpty || secondText.isEmpty {
            makeFactsMissingAlert()
        } else {
            let newCard = Cards(id: "anything", cardTitle: titleText, facts: [firstText,secondText])
            do {
                if checkIfCardExists(title: titleText) {
                    makeAlreadyHaveAlert(title: titleText)
                } else {
                    try CardPersistance.manager.save(newElement: newCard)
                    makeSavedAlert()
                }
            } catch {
                print(error)
            }
        }
    }
    @objc func cancelButtonPressed() {
        self.tabBarController?.selectedIndex = 0
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setupCreateUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        titleTextField.text = ""
        firstFactTextField.text = ""
        secondFactTextField.text = ""
    }
}

extension CreateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if titleTextField.isFirstResponder {
            firstFactTextField.becomeFirstResponder()
        } else if firstFactTextField.isFirstResponder {
            secondFactTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
