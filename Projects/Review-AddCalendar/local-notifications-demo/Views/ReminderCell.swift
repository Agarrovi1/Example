//
//  ReminderCell.swift
//  local-notifications-demo
//
//  Created by David Rifkin on 10/29/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ReminderCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
        // nothing to do here :)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentView.backgroundColor = .white
        self.textLabel?.text = nil
        self.detailTextLabel?.text = nil
    }
}
