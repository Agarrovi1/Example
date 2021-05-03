//
//  OneViewController.swift
//  Carousel
//
//  Created by Jocelyn Boyd on 1/14/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

  lazy var mylabel: UILabel = {
    let label = UILabel()
    label.text = "Page 1"
    return label
  }()
  
  
  lazy var myTable: UITableView = {
    let table = UITableView()
    table.separatorColor = .clear
    table.backgroundColor = UIColor.init(displayP3Red: 243/250, green: 239/250, blue: 235/250, alpha: 1)
    table.allowsSelection = false
    return table
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.init(displayP3Red: 243/250, green: 239/250, blue: 235/250, alpha: 1)
      myTable.delegate = self
      myTable.dataSource = self
        myTable.backgroundColor = .red
      constrainMyLabel()
      constrainMyTable()
    }
 
  func constrainMyLabel() {
    view.addSubview(mylabel)
    mylabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      mylabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      mylabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25)])
    
  }
  
  func constrainMyTable() {
    myTable.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(myTable)
    
    NSLayoutConstraint.activate([
      myTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
      myTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      myTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      myTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
  }
  
}

extension OneViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = UITableViewCell()
      cell.textLabel?.text = "Header Cell"
      cell.backgroundColor = .cyan
//      cell.isSelected = false
      cell.isHighlighted = false
      return cell
    } else if indexPath.row == 9 {
      let cell = UITableViewCell()
      cell.textLabel?.text = "Footer Cell"
      cell.backgroundColor = .cyan
//      cell.isSelected = false
      return cell
    } else {
      let cell = UITableViewCell()
         cell.textLabel?.text = "Test Question"
         cell.backgroundColor = UIColor.init(displayP3Red: 243/250, green: 239/250, blue: 235/250, alpha: 1)
//      cell.isSelected = false
      cell.isHighlighted = false
         return cell
    }
    }
    
   
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //sticky header
    if scrollView.contentOffset.y < 0.0 {
      if let cell = myTable.cellForRow(at: IndexPath(row: 0, section: 0)) {
        cell.frame.origin.y = scrollView.contentOffset.y
        let originalHeight:CGFloat = 100.0
        cell.frame.size.height = originalHeight + scrollView.contentOffset.y * (-1.0)
      }
    }
    //sticky footer
    if shouldStretchFooter(scrollView: scrollView) {
        let stretchHeight = scrollView.contentOffset.y - (scrollView.contentSize.height - scrollView.bounds.height)
//        print(stretchHeight)
        if let cell = myTable.visibleCells.last {
            let originalHeight: CGFloat = cell.frame.height
            cell.frame.size.height = originalHeight + stretchHeight
      }
    }
  }
    
    func shouldStretchFooter(scrollView: UIScrollView) -> Bool {
        guard scrollView.bounds.height <= scrollView.contentSize.height else {
            return false
        }
        return scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.bounds.height
    }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 100.0
    } else if indexPath.row == 9 {
      return 100.0
    } else {
      return 75.0
    }
  }

}
