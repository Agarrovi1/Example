//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var zooTableView: UITableView!
    
    let animals = ZooAnimal.zooAnimals
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrOfArrOfAnimals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        zooTableView.backgroundColor = UIColor(red: 0.845, green: 0.693, blue: 1.000, alpha: 1.0)
            return arrOfArrOfAnimals[section][0].classification
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfArrOfAnimals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let theAnimal = arrOfArrOfAnimals[indexPath.section][indexPath.row]
        
        guard let cell = zooTableView.dequeueReusableCell(withIdentifier: "animalCell") as? AnimalTableViewCell else {
            return UITableViewCell()
        }
        
        cell.animalNameLabel.text = theAnimal.name
        cell.originLabel.text = theAnimal.origin
        cell.animalImage.image = UIImage(named: "\(theAnimal.imageNumber)")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        switch segueIdentifier {
        case "tableToDetailSegue":
            guard let animalDetail = segue.destination as? AnimalDetailViewController else {
                return
            }
            guard let indexPath = zooTableView.indexPathForSelectedRow else {
                return
            }
            animalDetail.animal = arrOfArrOfAnimals[indexPath.section][indexPath.row]
        default:
            print("ruh roh")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zooTableView.dataSource = self
        zooTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

