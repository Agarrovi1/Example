//
//  ColorTableViewCell.swift
//  PracticeTableViewCell
//
//  Created by Angela Garrovillas on 8/9/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    @IBOutlet weak var colorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
