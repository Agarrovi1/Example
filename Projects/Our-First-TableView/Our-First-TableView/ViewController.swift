//
//  ViewController.swift
//  Our-First-TableView
//
//  Created by Angela Garrovillas on 8/8/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    let classTeam = ["Alex","Alan","David","Iram","Oli","Istishna"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classTeam.count
        //how many rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //whats gonna be in those rows -> a TableViewCell
        //indexPath.row
        var cell = UITableViewCell()
        cell.backgroundColor = UIColor(red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: CGFloat.random(in: 0.0...1.0))
        //cell.textLabel?.text = classTeam[0]
        let rowToSetUp = indexPath.row
        let personInClass = classTeam[rowToSetUp]
        cell.textLabel?.text = personInClass
        
        
        var cell2 = ourTableView.dequeueReusableCell(withIdentifier: "ourCell")
        if let unwrap = cell2 {
            return unwrap
        }
        return cell
    }
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        <#code#>
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //what happens when you touch a view
        print(classTeam[indexPath.row])
    }
    
    @IBOutlet weak var ourTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ourTableView.dataSource = self
        ourTableView.delegate = self
    }


}

