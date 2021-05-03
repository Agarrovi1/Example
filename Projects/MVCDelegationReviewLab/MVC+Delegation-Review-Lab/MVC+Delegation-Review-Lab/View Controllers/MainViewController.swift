//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let movies = Movie.allMovies
    private func changeFont(to font: Double) {
        let fontCGFloat = CGFloat(font)
        let subtitleFont = CGFloat(font - 5)
        let cells = tableView.visibleCells
        for aCell in cells {
            aCell.textLabel?.font = UIFont.systemFont(ofSize: fontCGFloat)
            aCell.detailTextLabel?.font = UIFont.systemFont(ofSize: subtitleFont)
//            guard let aCell = aCell as? CellOneTableViewCell else {return}
//            aCell.titleLabel.font = UIFont.systemFont(ofSize: fontCGFloat)
//            aCell.subtitleLabel.font = UIFont.systemFont(ofSize: subtitleFont)
//            aCell.titleLabel.sizeToFit()
//            aCell.titleLabel.sizeToFit()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? FontSettingViewController else {return}
        let cells = tableView.visibleCells
        //guard let cell = cells[0] as? CellOneTableViewCell else {return}
        //let fontSize = cell.titleLabel.font.pointSize
        guard let fontSize = cells[0].textLabel?.font.pointSize else {return}
        let sizeAsDouble = Double(fontSize)
        let sizeAsFloat = Float(fontSize)
        destination.newSliderValue = sizeAsFloat
        destination.newStepperValue = sizeAsDouble
        destination.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate {
    

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne") as? CellOneTableViewCell else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath)
        let theMovie = movies[indexPath.row]
        cell.textLabel?.text = theMovie.name
        cell.detailTextLabel?.text = theMovie.year.description
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MainViewController: FontSettings {
    func fontDidChange(to font: Double) {
        changeFont(to: font)
    }
}
