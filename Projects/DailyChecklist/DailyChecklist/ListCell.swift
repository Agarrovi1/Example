//
//  ListCell.swift
//  DailyChecklist
//
//  Created by Angela Garrovillas on 10/14/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    //MARK: - Objects
    var listLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    //MARK: - Constraints
    private func listConstraints() {
        contentView.addSubview(listLabel)
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            listLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            listLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor)])
    }
    
    //MARK: - Overrides
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        listConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
