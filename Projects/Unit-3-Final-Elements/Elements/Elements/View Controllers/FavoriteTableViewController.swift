//
//  FavoriteTableViewController.swift
//  Elements
//
//  Created by Angela Garrovillas on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    var fav = [FavoriteElement]() {
        didSet {
            tableView.reloadData()
        }
    }
    private func loadData() {
        ElementAPIClient.manager.getFavElements { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let favs):
                DispatchQueue.main.async {
                    self.fav = favs.filter({$0.favoritedBy == "Angela"})
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fav.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)
        let element = fav[indexPath.row]
        cell.textLabel?.text = element.elementSymbol
        cell.detailTextLabel?.text = element.elementName
        return cell
    }
}
