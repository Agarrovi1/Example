//
//  ElementTableViewCell.swift
//  Elements
//
//  Created by Angela Garrovillas on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    @IBOutlet weak var elementImageView: UIImageView!
    @IBOutlet weak var elementNameLabel: UILabel!
    @IBOutlet weak var symbolAndNumLabel: UILabel!
    @IBOutlet weak var elementWeightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
