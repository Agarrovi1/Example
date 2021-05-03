//
//  ViewController.swift
//  Checklist
//
//  Created by Angela Garrovillas on 10/7/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UIObjects
    var listTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .blue
        table.register(ListCell.self, forCellReuseIdentifier: "ListCell")
        return table
    }()
    
    var textBox: UITextField = {
        let box = UITextField()
        box.backgroundColor = .gray
        return box
    }()
    var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    //MARK: - Properties
    var list = [String]() {
        didSet {
            if !listTableView.isEditing {
                listTableView.reloadData()
            }
        }
    }
    
    
    
    //MARK: - Constraints
    private func allConstraints() {
        editButtonConstraints()
        textBoxConstraints()
        tableViewConstraints()
    }
    
    private func textBoxConstraints() {
        view.addSubview(textBox)
        textBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textBox.topAnchor.constraint(equalTo: editButton.bottomAnchor),
            textBox.widthAnchor.constraint(equalTo: view.widthAnchor),
            textBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)])
    }
    private func editButtonConstraints() {
        view.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            editButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            editButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
            ])
    }
    
    private func tableViewConstraints() {
        view.addSubview(listTableView)
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: textBox.bottomAnchor),
            listTableView.widthAnchor.constraint(equalTo: textBox.widthAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    //MARK: - Setup
    private func setDelegates() {
        listTableView.delegate = self
        listTableView.dataSource = self
        textBox.delegate = self
    }
    private func setButtonActions() {
        editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
    }
    
    //MARK: - Functions
    @objc private func editButtonPressed() {
        if listTableView.isEditing {
            listTableView.isEditing = false
            editButton.setTitle("Edit", for: .normal)
            textBox.isEnabled = true
        } else {
            listTableView.isEditing = true
            editButton.setTitle("Done", for: .normal)
            textBox.isEnabled = false
            
        }
    }
    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        allConstraints()
        setButtonActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        listTableView.reloadData()
    }


}

//MARK: - Extensions

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell else {
            return UITableViewCell()
        }
        let item = list[indexPath.row]
        cell.listLabel.text = item
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            list.remove(at: indexPath.row)
            listTableView.deleteRows(at: [indexPath], with: .fade)
        default:
            print("default")
        }
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            list.append(text)
            textField.text = ""
        }
        return true
    }
}


//MARK: TODO
/*
 -make persistance
 -try to make swapping, reorganizing cells?
 -
 */
