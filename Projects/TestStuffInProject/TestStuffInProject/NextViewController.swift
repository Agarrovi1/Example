//
//  NextViewController.swift
//  TestStuffInProject
//
//  Created by Angela Garrovillas on 9/15/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var calculateBy = CalculateBy.neither
    func loadBackgroundColor() {
        switch calculateBy {
        case .monthly:
            self.view.backgroundColor = .blue
        case .total:
            self.view.backgroundColor = .green
        case .neither:
            self.view.backgroundColor = .red
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBackgroundColor()

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
