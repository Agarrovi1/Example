//
//  MovieTableViewCell.swift
//  WarmUpMovies
//
//  Created by Angela Garrovillas on 8/9/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
