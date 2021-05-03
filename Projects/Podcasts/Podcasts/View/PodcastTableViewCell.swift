//
//  PodcastTableViewCell.swift
//  Podcasts
//
//  Created by Angela Garrovillas on 9/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class PodcastTableViewCell: UITableViewCell {
    @IBOutlet weak var podcastImageVIew: UIImageView!
    @IBOutlet weak var podcastNameLabel: UILabel!
    @IBOutlet weak var podcastArtistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
