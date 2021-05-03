//
//  AnimalTableViewCell.swift
//  Aug12WarmUp
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//print("im a cell and you just selected me!")
        //responds to self.selected is being changed
        // Configure the view for the selected state
    }

}
