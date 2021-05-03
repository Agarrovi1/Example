//
//  SeaAnimalTableViewCell.swift
//  Aug12WarmUp
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class SeaAnimalTableViewCell: UITableViewCell {
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var eatOrNotLabel: UILabel!
    @IBOutlet weak var seaAnimalNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
