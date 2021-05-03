//
//  ViewController.swift
//  ReviewLifeCycle
//
//  Created by Angela Garrovillas on 1/14/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view exists, and we can do some stuff to that object
        //ex: we can load stuff off the internet
        //ex: we can set up how this object (a subclass of UIViewController) might interact with other objects
        //ex: create object for sceneKit
        //var people : [People] = People.getPeople()
        //self.view.addSubview(myNewSubView)
        //analogy: arrived at a restaurant
        print("viewDidLoad")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear", "isAnimated: \(animated)")
        //we'll set the initial state of the UI, provided those things aren't "expensive" or don't take up a lot of processing power
        //how are we going to present the user the initial visual state and interaction capabilities
        //ex: set the initial value of a label
        //ex: designate which UI object will be the first responder
        //ex: update a table view
        //ex: enable/disable UIControls or gestures, hide/show UI objects
        //ex: set background color
        //analogy: being seated - set up a menu at your seat, they might pull back chair or set up utensils
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear", "isAnimated: \(animated)")
        //analogy: start to take order
        //actually doing things related to the user's interaction or continued attention span to the app
        //ex: trigger a leading indicator
        //ex: start an animation
        //ex: expensive operations (try to present SceneKit object in the view)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear", "isAnimated: \(animated)")
        //analogy: you've eaten and had the full dining experience, and someone comes over and says "here's the check, thanks so much"
        //ex: update API with "final" level or score in a game
        //ex: set user default everytime if the view is going to eventually disappear
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear", "isAnimated: \(animated)")
        //analogy: cleaning table after patron leaves
        //teardown
    }


}

