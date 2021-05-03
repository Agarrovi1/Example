//
//  FilmsVC.swift
//  GhibliPractice
//
//  Created by C4Q on 10/2/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class FilmsVC: UITableViewController {

    
    private var films = [Film]() {
           didSet {
               tableView.reloadData()
           }
       }
    var darkModeIsOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    
    }
    
    
    
    private func loadData() {
        FilmAPIClient.shared.getFilms { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let filmsFromOnline):
                    self.films = filmsFromOnline
                }
            }
        }
    }

    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let settingsVC = storyboard.instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController else {return}
        settingsVC.delegate = self
        settingsVC.switchOnOrOff = self.darkModeIsOn
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell
        let film = films[indexPath.row]
        cell.titleLabel.text = film.title
        cell.filmImageView.image = UIImage(named: film.title)
        cell.optionsButton.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    

}

extension FilmsVC: FilmCellDelegate {
    func showActionSheet(tag: Int) {
        let optionsMenu = UIAlertController(title: "Options", message: "Pick an option", preferredStyle: .actionSheet)
        let favoriteAction = UIAlertAction(title: "Favorite", style: .default) { (action) in
            //Favorite using persistance
            let film = self.films[tag]
            print("My favorite film is \(film.title)")
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            //Delete from persistance
            let film = self.films[tag]
            print("I just deleted \(film.title)")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionsMenu.addAction(favoriteAction)
        optionsMenu.addAction(deleteAction)
        optionsMenu.addAction(cancelAction)
        present(optionsMenu, animated: true, completion: nil)
    }
    
    
}

extension FilmsVC: SettingsDelegate {
    func darkModeOn() {
        self.tableView.backgroundColor = .black
        self.darkModeIsOn = true
    }
    
    func darkModeOff() {
        self.tableView.backgroundColor = .white
        self.darkModeIsOn = false
    }
    
    
}
