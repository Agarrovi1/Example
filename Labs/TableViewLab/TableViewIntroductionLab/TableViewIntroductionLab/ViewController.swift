//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIButton!
    var sortBy: ScrollByDate = .ascending
    
    @IBAction func sortButtonPressed(_ sender: UIButton) {
        switch sortBy {
        case .ascending:
            sortBy = .descending
            sortButton.setTitle("Sort Ascending", for: .normal)
            self.tableView.reloadData()
        case .descending:
            sortBy = .ascending
            sortButton.setTitle("Sort Descending", for: .normal)
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return filterAccordingToStatus(arr: Task.allTasks, state: .notStarted).count
        case 1:
            return filterAccordingToStatus(arr: Task.allTasks, state: .inProgress).count
        case 2:
            return filterAccordingToStatus(arr: Task.allTasks, state: .completed).count
        default:
            return Task.allTasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne")
        let rowsToSetup = indexPath.row
        let taskSortedAscending = sortByDate(arr: Task.allTasks, sort: .ascending)
        let notStartedA = filterAccordingToStatus(arr: taskSortedAscending, state: .notStarted)
        let inProgressA = filterAccordingToStatus(arr: taskSortedAscending, state: .inProgress)
        let completedA = filterAccordingToStatus(arr: taskSortedAscending, state: .completed)
        
        let taskSortedDescending = sortByDate(arr: Task.allTasks, sort: .descending)
        let notStartedD = filterAccordingToStatus(arr: taskSortedDescending, state: .notStarted)
        let inProgressD = filterAccordingToStatus(arr: taskSortedDescending, state: .inProgress)
        let completedD = filterAccordingToStatus(arr: taskSortedDescending, state: .completed)
        
        if let unwrapCell = cell {
            switch sortBy {
            case .ascending:
                switch indexPath.section {
                case 0:
                    let taskInNotStarted = notStartedA[rowsToSetup]
                    unwrapCell.textLabel?.text = "\(taskInNotStarted.name)"
                    unwrapCell.detailTextLabel?.text = "\(taskInNotStarted.dueDate.description(with: .autoupdatingCurrent))"
                case 1:
                    let taskInInProgress = inProgressA[rowsToSetup]
                    unwrapCell.textLabel?.text = "\(taskInInProgress.name)"
                    unwrapCell.detailTextLabel?.text = "\(taskInInProgress.dueDate.description(with: .autoupdatingCurrent))"
                case 2:
                    let taskInCompleted = completedA[rowsToSetup]
                    unwrapCell.textLabel?.text = "\(taskInCompleted.name)"
                    unwrapCell.detailTextLabel?.text = "\(taskInCompleted.dueDate.description(with: .autoupdatingCurrent))"
                default:
                    print("test")
                }
                return unwrapCell
            case .descending:
                switch indexPath.section {
                case 0:
                    let taskInNotStarted = notStartedD[rowsToSetup]
                    unwrapCell.textLabel?.text = "\(taskInNotStarted.name)"
                    unwrapCell.detailTextLabel?.text = "\(taskInNotStarted.dueDate.description(with: .autoupdatingCurrent))"
                case 1:
                    let taskInInProgress = inProgressD[rowsToSetup]
                    unwrapCell.textLabel?.text = "\(taskInInProgress.name)"
                    unwrapCell.detailTextLabel?.text = "\(taskInInProgress.dueDate.description(with: .autoupdatingCurrent))"
                case 2:
                    let taskInCompleted = completedD[rowsToSetup]
                    unwrapCell.textLabel?.text = "\(taskInCompleted.name)"
                    unwrapCell.detailTextLabel?.text = "\(taskInCompleted.dueDate.description(with: .autoupdatingCurrent))"
                default:
                    print("test")
                }
                return unwrapCell
            }
        }
        return UITableViewCell()
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Not Started"
        case 1:
            return "In Progress"
        case 2:
            return "Completed"
        default:
            print("default")
        }
        return "didn't work"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    

}

