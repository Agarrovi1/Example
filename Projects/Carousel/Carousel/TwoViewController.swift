//
//  TwoViewController.swift
//  Carousel
//
//  Created by Jocelyn Boyd on 1/14/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemPink
      let labelInst = UILabel()
          self.view.addSubview(labelInst)
          labelInst.text = "Page 2"
          labelInst.translatesAutoresizingMaskIntoConstraints = false
          labelInst.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
          labelInst.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
