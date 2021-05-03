//
//  ViewController.swift
//  AddJSONApp
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var GOTtableView: UITableView!
    var episodes = [Episode]() {
        didSet {
            //data might not occur before table view
            //data might not load in the order you want it to
            GOTtableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        GOTtableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "episode", ofType: "json") else {
            fatalError("couldn't find json file")
        }
        print(pathToJSONFile) //just a string
        let url = URL(fileURLWithPath: pathToJSONFile) //the file to look at
        //url is the actual reference/location of json file
        do {
            let data = try Data(contentsOf: url)
            let episodesFromJSON = try Episode.getEpisodes(from: data)
            //if either try's fail the catch block catches it
            episodes = episodesFromJSON
        } catch {
            fatalError("Couldnt't get episodes from JSON")
        }
        //episodes = whatever we decode from the json
    }
    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = GOTtableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath)
        let theEp = episodes[indexPath.row]
        cell.textLabel?.text = theEp.name
        cell.detailTextLabel?.text = "Episode: \(theEp.number)"
        return cell
    }
    
    
}
