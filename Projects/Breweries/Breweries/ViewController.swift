//
//  ViewController.swift
//  Breweries
//
//  Created by Angela Garrovillas on 9/5/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var breweries = [Brewery]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func loadData() {
        Brewery.getBreweries { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let brewerys):
                    self.breweries = brewerys
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "brewCell", for: indexPath)
        let brewery = breweries[indexPath.row]
        cell.textLabel?.text = brewery.name
        cell.detailTextLabel?.text = "\(brewery.city), \(brewery.state)"
        return cell
    }
    
    
}
