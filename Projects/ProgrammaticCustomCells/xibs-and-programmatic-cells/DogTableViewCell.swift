//
//  DogTableViewCell.swift
//  xibs-and-programmatic-cells
//
//  Created by Angela Garrovillas on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    //@IBOutlet weak var dogNameLabel: UILabel!
        lazy var dogNameLabel: UILabel = {
            let myLabel = UILabel()
            myLabel.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1) //Color literal
            myLabel.text = "I don't know"
            return myLabel
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "dawgCell")
        self.contentView.addSubview(dogNameLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        dogNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dogNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 10).isActive = true
        dogNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: 10).isActive = true
        dogNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10).isActive = true
        dogNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -10).isActive = true
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.addSubview(dogNameLabel)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
