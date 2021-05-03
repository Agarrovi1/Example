//
//  ViewController.swift
//  WarmUpMovies
//
//  Created by Angela Garrovillas on 8/9/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var movieTableVIew: UITableView!
    
    var movies = MovieData.sortedMoviesAlphabetically
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowToSetup = indexPath.row
        let sortedByGenre = sortByGenre(arr: movies)
        let movieInRow = sortedByGenre[rowToSetup]
        //downcasting
        if indexPath.row % 2 == 0 {
        if let cell = movieTableVIew.dequeueReusableCell(withIdentifier: "cellOne") as? MovieTableViewCell { //gets access to MovieTableVIewCell stuff like the titleLabel
            
            let unwrapCell = cell
            unwrapCell.genreLabel?.text = movieInRow.genre
            return unwrapCell
        }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo") as? MovieNameTableViewCell {
                cell.nameLabel.text = movieInRow.name
                return cell
            }
        }
        let cell2 = movieTableVIew.dequeueReusableCell(withIdentifier: "cellOne")
        if let unwrapCell = cell2 {
        unwrapCell.textLabel?.text = movieInRow.name
        unwrapCell.detailTextLabel?.text = movieInRow.description
        return unwrapCell
        }
        return UITableViewCell()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTableVIew.dataSource = self
        movieTableVIew.delegate = self
    }


}

