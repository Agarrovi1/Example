//
//  ViewController.swift
//  local-notifications-demo
//
//  Created by David Rifkin on 10/29/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

enum CellIdentifier: String {
    case subtitleCell
}

class ToDoListViewController: UIViewController {
    
    var toDos = [ToDo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.backgroundColor = .lightGray
        tableView.register(ReminderCell.self, forCellReuseIdentifier: CellIdentifier.subtitleCell.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createButtonPressed))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    private func loadData() {
        //TODO: Set up logic to get ToDos from persistence
        //If there are persisted ToDos, load them
        //else load these defaults
        do {
            let persistToDo = try ToDoPersistenceHelper.manager.getPersistedToDos()
            if persistToDo.count == 0 {
                toDos = ToDo.getDefaultTodos()
            } else {
                toDos = persistToDo.sorted(by: {$0.dueBy > $1.dueBy})
            }
        } catch {
            print(error)
        }
        
    }
    
    @objc func createButtonPressed(){
        //TODO: transition to a controller where you can create ToDos
        let createVC = CreateToDoViewController()
        navigationController?.pushViewController(createVC, animated: true)
    }
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDos[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.subtitleCell.rawValue) as? ReminderCell else {return UITableViewCell()}
        cell.textLabel?.text = toDo.title
        let labelSettings = getLabelSettings(from: toDo.dueBy)
        cell.detailTextLabel?.text = labelSettings.0
        cell.detailTextLabel?.textColor = labelSettings.1
        return cell
    }
    
    private func getLabelSettings(from date: Date) -> (String,UIColor) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateString = dateFormatter.string(from: date)
        let currentDate = Date()
        //TODO: Set up logic to have date's text color as light grey if it was in the past, and as red if it is still coming up (or the current time)
        if date < currentDate {
            return (dateString,.lightGray)
        }
        return (dateString,.red)
    }
}
