//
//  ViewController.swift
//  LifeCycle
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear!!!")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated) //animated -> is parameter in ()
        print("viewDidAppear!!!")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear!!!")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear!!!")
    }
    
    //available in class interface
//    func doSomething() {
//
//    }
    
    
    //is not available in class interface
//    private func doThisOnlyInHere() {
//
//    }

}

