//
//  ViewController.swift
//  TestStuffInProject
//
//  Created by Angela Garrovillas on 9/15/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var calculate = CalculateBy.neither
    
//    @IBAction func totalButtonPressed(_ sender: UIButton) {
//            calculate = .total
//            performSegue(withIdentifier: "showTotal", sender: CalculateBy.total)
//    }
//    
//    @IBAction func monthlyButtonPressed(_ sender: UIButton) {
//        calculate = .monthly
//        performSegue(withIdentifier: "showMonthly", sender: CalculateBy.total)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTotal" {
            guard let destination = segue.destination as? NextViewController else {return}
            destination.calculateBy = CalculateBy.total
        } else {
            guard let destination = segue.destination as? NextViewController else {return}
            destination.calculateBy = CalculateBy.monthly
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

