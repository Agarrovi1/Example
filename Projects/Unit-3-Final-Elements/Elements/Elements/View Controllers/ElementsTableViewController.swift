//
//  ElementsTableViewController.swift
//  Elements
//
//  Created by Angela Garrovillas on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementsTableViewController: UITableViewController {
    var elements = [ChemicalElement]() {
        didSet {
            tableView.reloadData()
        }
    }
    private func loadElements() {
        ElementAPIClient.manager.getElements { (results) in
            switch results {
            case .failure(let error):
                print(error)
            case .success(let elementsFromJSON):
                DispatchQueue.main.async {
                    self.elements = elementsFromJSON
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadElements()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? ElementTableViewCell else {
            return UITableViewCell()
        }
        let element = elements[indexPath.row]
        cell.elementNameLabel.text = element.name
        cell.symbolAndNumLabel.text = "\(element.symbol) (\(element.number))"
        cell.elementWeightLabel.text = "Atomic Mass: \(element.atomicMass)"
        
        ImageHelper.shared.getThumbnails(with: element.number) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let imageFromUrl):
                DispatchQueue.main.async {
                    cell.elementImageView.image = imageFromUrl
                }
            }
        }
        return cell
    }
    

    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ElementDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {return}
        destination.element = elements[indexPath.row]
    }
    

}
