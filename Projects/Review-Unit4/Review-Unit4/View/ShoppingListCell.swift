//
//  ShoppingListCell.swift
//  Review-Unit4
//
//  Created by Angela Garrovillas on 10/23/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ShoppingListCell: UICollectionViewCell {
    //MARK: UIObjects
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        var frame = imageView.frame.size
        frame.height = 100
        frame.width = 200
        imageView.frame.size = frame
        return imageView
    }()
    
    //MARK: Constraints
    private func setupCellUI() {
        setImage()
        setNameLabel()
        setPriceLabel()
    }
    private func setImage() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10)])
    }
    private func setNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
    }
    private func setPriceLabel() {
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        contentView.backgroundColor = .white
        setupCellUI()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
