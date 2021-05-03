//
//  ViewController.swift
//  Concerts
//
//  Created by Angela Garrovillas on 9/6/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var concertTableView: UITableView!
    var concerts = [Events]() {
        didSet {
            concertTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        concertTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    private func loadData() {
        ConcertAPIHelper.shared.getConcerts { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let concertsFromOnline):
                    self.concerts = concertsFromOnline
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = concertTableView.dequeueReusableCell(withIdentifier: "concertCell", for: indexPath)
        let concert = concerts[indexPath.row]
        let dateAndTime = concert.cleanUpDate()
        cell.textLabel?.text = concert.title
        cell.detailTextLabel?.text = "\(dateAndTime.date), \(dateAndTime.time)"
        return cell
    }
    
    
}
