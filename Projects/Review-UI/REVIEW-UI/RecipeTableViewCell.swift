//
//  RecipeTableViewCell.swift
//  REVIEW-UI
//
//  Created by Angela Garrovillas on 10/10/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    lazy var name: UILabel = {
        let name = UILabel()
        return name
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(name)
        setConstraints()
        
    }
    private func setConstraints() {
        name.translatesAutoresizingMaskIntoConstraints = false
        [name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
         name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)].forEach({$0.isActive = true})
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
