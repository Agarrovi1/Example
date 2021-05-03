//
//  SongDetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Angela Garrovillas on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songArtistLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    var song: Song!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    func setUpView() {
        songArtistLabel.text = song.artist
        songNameLabel.text = song.name
    }

}
