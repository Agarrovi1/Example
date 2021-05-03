//
//  ViewController.swift
//  Review-Cocoapods
//
//  Created by Angela Garrovillas on 11/7/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class ViewController: UIViewController {
    
    var objects = [LibraryWrapper]()
    
    var cocoaTableView: UITableView = {
        let table = UITableView()
        table.register(CocoaTableViewCell.self, forCellReuseIdentifier: "cocoaCell")
        return table
    }()
    func setTableViewConstraints() {
        view.addSubview(cocoaTableView)
        cocoaTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cocoaTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        cocoaTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        cocoaTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        cocoaTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
    }

    func setDelegates() {
        cocoaTableView.delegate = self
        cocoaTableView.dataSource = self
    }
    func loadData() {
        objects = LibraryWrapper.getLibraries(from: GetLocation.getData(name: "BklynLibraryInfo", type: "json"))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTableViewConstraints()
        setDelegates()
        loadData()
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objectsToSet = objects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocoaCell", for: indexPath) as! CocoaTableViewCell
        cell.textLabel?.text = objectsToSet.title
        
        //create buttons to the left
        cell.leftButtons = [MGSwipeButton(title: "Add to List", icon: UIImage(named: "like"), backgroundColor: .red, callback: { (cell) -> Bool in
            print("An action has to be added here")
            return true
        })]
        cell.leftSwipeSettings.transition = .rotate3D
        
        //create right button
        cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: .systemTeal, callback: { (cell) -> Bool in
            self.objects.remove(at: indexPath.row)
            let indexPath = IndexPath(item: indexPath.row, section: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
            return true
        })]
        
        cell.rightSwipeSettings.transition = .rotate3D
        cell.layer.cornerRadius = 25
        cell.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        cell.clipsToBounds = true
        cell.layoutIfNeeded()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}
