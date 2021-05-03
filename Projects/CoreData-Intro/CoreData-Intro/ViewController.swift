//
//  ViewController.swift
//  CoreData-Intro
//
//  Created by Angela Garrovillas on 11/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        (user.posts as! [Post])[0].addToComments(<#T##value: Comment##Comment#>)
        // Do any additional setup after loading the view.
    }


}

