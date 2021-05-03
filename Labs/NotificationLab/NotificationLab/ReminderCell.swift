//
//  ReminderCell.swift
//  NotificationLab
//
//  Created by Angela Garrovillas on 10/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
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
        self.contentView.backgroundColor = .clear
        self.textLabel?.text = nil
        self.textLabel?.textColor = .white
        self.detailTextLabel?.text = nil
        self.detailTextLabel?.textColor = .white
    }
}
