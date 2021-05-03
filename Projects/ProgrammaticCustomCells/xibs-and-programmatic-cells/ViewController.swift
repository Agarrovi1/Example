//
//  ViewController.swift
//  xibs-and-programmatic-cells
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class DogsTableViewViewController: UIViewController {
    
    let dogs: [String: UIColor] = ["Yorkie":#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),"Clifford":#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), "Pugmixx":#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),"Corgi":#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)]
    lazy var tableView: UITableView = {
        let theTableView = UITableView()
        theTableView.register(DogTableViewCell.self, forCellReuseIdentifier: "dawgCell")
        //        let nib = UINib(nibName: "DogTableViewCell", bundle: nil)
        //        theTableView.register(nib, forCellReuseIdentifier: "dawgCell")
        theTableView.dataSource = self
        theTableView.delegate = self
        return theTableView
    }()
    
//    lazy var label: UILabel = {
//        let myLabel = UILabel(frame: CGRect(x: 80, y: 200, width: self.view.bounds.size.width / 3, height: self.view.bounds.size.height / 10))
//        myLabel.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) //Color literal
//        myLabel.text = "I don't know"
//        return myLabel
//    }()
    func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        self.view.addSubview(tableView)
        addConstraints()
        //self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }


}

extension DogsTableViewViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "dawgCell", for: indexPath) as? DogTableViewCell else {
            return UITableViewCell()
        }
        let dog = Array(dogs.keys)[indexPath.row]
        let dogColor = dogs[dog]
            cell.dogNameLabel.text = dog
            cell.backgroundColor = dogColor
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
