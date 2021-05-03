//
//  ManageTimersViewController.swift
//  NotificationLab
//
//  Created by Angela Garrovillas on 10/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ManageTimersViewController: UIViewController {
    var savedTimes = [Times]()
    
    var timerTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .purple
        tableView.register(ReminderCell.self, forCellReuseIdentifier: "reminderCell")
        return tableView
    }()
    private func setManageVC() {
        view.backgroundColor = .white
        setTableViewConstraints()
        setDelegates()
    }
    private func setDelegates() {
        timerTableView.delegate = self
        timerTableView.dataSource = self
    }
    private func setTableViewConstraints() {
        view.addSubview(timerTableView)
        timerTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timerTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            timerTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            timerTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            timerTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setManageVC()

    }
}

extension ManageTimersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath) as? ReminderCell else {
            return UITableViewCell()
        }
        let singeTime = savedTimes[indexPath.row]
        cell.textLabel?.text = singeTime.message
        cell.detailTextLabel?.text = singeTime.endTime.timeIntervalSinceNow.description
        return cell
    }
    
   
}
