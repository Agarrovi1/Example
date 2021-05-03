//
//  ViewController.swift
//  local-notifications-demo
//
//  Created by David Rifkin on 10/29/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
import EventKit 

enum CellIdentifier: String {
    case subtitleCell
}

class ToDoListViewController: UIViewController {
    
    let eventStore = EKEventStore()

    var toDos = [ToDo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.backgroundColor = .lightGray
        tableView.register(ReminderCell.self, forCellReuseIdentifier: CellIdentifier.subtitleCell.rawValue)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        addBarButtonItems()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    private func loadData() {
        do {
            let getTodosResult = try ToDoPersistenceHelper.manager.getPersistedToDos()
            switch getTodosResult {
            case .success (let loadedToDos):
                if loadedToDos.count < 1 {
                    toDos =  ToDo.getDefaultTodos()
                } else {
                    toDos =  loadedToDos
                }
            case .failure:
                toDos =  ToDo.getDefaultTodos()

            }
        } catch {
            toDos =  ToDo.getDefaultTodos()
        }
    }
    
    private func addBarButtonItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createButtonPressed))
    }
    
    @objc private func createButtonPressed(){
        self.navigationController?.pushViewController(CreateToDoViewController(),animated: true)
    }
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: TV Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDos[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.subtitleCell.rawValue) as? ReminderCell else {return UITableViewCell()}
        cell.textLabel?.text = toDo.title
        let labelSettings = getRowLabelSettings(from: toDo.dueBy)
        cell.detailTextLabel?.text = labelSettings.0
        cell.detailTextLabel?.textColor = labelSettings.1
        return cell
    }
    
    //MARK: TV Delegate
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, view, completionHandler) in
            do {
                let error = try ToDoPersistenceHelper.manager.deleteToDo(title: self.toDos[indexPath.row].title)
                if error != nil {
                    //MARK: TODO - present alert
                } else {
                    self.toDos.remove(at: indexPath.row)
                }
            } catch {
                //MARK: TODO - present alert
                print("could not remove")
            }
        }
        
        deleteAction.image = UIImage(systemName: "trash.circle.fill")
        
        let addToCalendarAction = UIContextualAction(style: .normal, title: nil) { (action, view, completionHandler) in
            switch EKEventStore.authorizationStatus(for: .event) {
            case .authorized:
                self.addEvent(row: indexPath.row)
            case .notDetermined:
                self.eventStore.requestAccess(to: .event) { [weak self] (granted, error) in
                    if granted {
                        self?.addEvent(row: indexPath.row)
                    } else {
                        //MARK: TODO - present there was an issue getting access
                    }
                }
            case .denied,.restricted:
                print("denied")
                //MARK: TODO - present access is denied, please change in settings
            default:
                print("default")
            }
        }
        
        addToCalendarAction.image = UIImage(systemName: "calendar.badge.plus")
        
        return UISwipeActionsConfiguration(actions: [addToCalendarAction,deleteAction])
    }
    
    //MARK: Private Functions
    private func addEvent(row: Int) {
        var saveStatus = ""
        let toDo = toDos[row]
        if let calendar = eventStore.calendars(for: .event).first(where: {$0.allowsContentModifications}) {
            let event = EKEvent(eventStore: eventStore)
            event.calendar = calendar
            event.title = toDo.title
            event.startDate = toDo.dueBy //Date
            event.endDate = toDo.dueBy.advanced(by: 60 * 60)
            do {
                try eventStore.save(event, span: .thisEvent)
                saveStatus = "Saved"
            } catch {
                saveStatus = "Not Saved: \(error)"
            }
        }  else {
            saveStatus = "Not Saved"
        }
        
        let alertController = UIAlertController(title: "Event", message: saveStatus, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func getRowLabelSettings(from date: Date) -> (String,UIColor) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateString = dateFormatter.string(from: date)
        if date >= Date() {
            return (dateString, .red)
        } else {
            return (dateString, .lightGray)
        }
    }
}
