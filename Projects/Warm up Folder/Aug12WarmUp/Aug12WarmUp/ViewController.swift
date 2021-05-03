//
//  ViewController.swift
//  Aug12WarmUp
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //MARK: -- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: -- Properties
    let landAnimals = animals.filter({$0.isOnLand})
    let seaAnimals = animals.filter({!$0.isOnLand})
    
    //MARK: -- DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return animals.filter({$0.isOnLand == true}).count
        default:
            return animals.filter({$0.isOnLand == false}).count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne") as? AnimalTableViewCell else {
            return UITableViewCell()
        }
        guard let cellTwo = tableView.dequeueReusableCell(withIdentifier: "seaCell") as? SeaAnimalTableViewCell else {
            return UITableViewCell()
        }
        if indexPath.section == 0 {
            cell.animalName.text = landAnimals[indexPath.row].type
            cell.animalImage.image = landAnimals[indexPath.row].getImage()
            return cell
        } else {
            cellTwo.seaAnimalNameLabel?.text = seaAnimals[indexPath.row].type
            cellTwo.animalImage.image = seaAnimals[indexPath.row].getImage()
            cellTwo.eatOrNotLabel.text = seaAnimals[indexPath.row].eatOrNot
            return cellTwo
            }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Land Animals"
        case 1:
            return "Sea Animals"
        default:
            return "something"
        }
    }
    
    //MARK: -- TableView Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("hey you selected me in Table View")
    }

    //MARK: -- LifeCycle Methods
    //TODO: TD: Make private Methods
    //^ can make to do comment "reminders"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }


}

