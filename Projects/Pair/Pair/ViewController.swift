//
//  ViewController.swift
//  Pair
//
//  Created by Angela Garrovillas on 12/1/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
     https://itunes.apple.com/search?media=podcast&limit=200&term=swift
     1.Use the endpoint above to create a Swift model from the JSON payload.
     2.Add a search bar and table view to your main view controller.
     3.Each cell should at minimum display an image and the name of the Podcast.
     4.The user should be able to search for any podcast.
     5.Selecting a particular podcast should segue to a detail view. If time allows:
     6.Write adequate unit tests.
     */
    
    //TODO practice what we did in half the time
    //knowing code like @escaping
    //or complete these tasks

    let api = APIClient()
    let test = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getPodcastData(search: "pizza pie") { (results) in
            
        }
        
        
    }


}

