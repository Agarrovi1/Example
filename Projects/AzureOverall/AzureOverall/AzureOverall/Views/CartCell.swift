//
//  CartCell.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addAllCartCellConstraints()
        
        setExampleText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UIObjects
    var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    var spinner: UIActivityIndicatorView = {
        let spin = UIActivityIndicatorView()
        spin.hidesWhenStopped = true
        return spin
    }()
    
    //MARK: - Constraints
    private func addAllCartCellConstraints() {
        addImageConstraints()
        addTitleLabelConstraints()
        addNumberLabelConstraints()
        addActivityIndicator()
    }
    private func addImageConstraints() {
        contentView.addSubview(recipeImageView)
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            recipeImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3)])
    }
    private func addTitleLabelConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
    }
    private func addNumberLabelConstraints() {
        contentView.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            numberLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)])
    }
    private func addActivityIndicator() {
        contentView.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        NSLayoutConstraint.activate([
            spinner.centerYAnchor.constraint(equalTo: recipeImageView.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: recipeImageView.centerXAnchor)])
    }
    
    private func setExampleText() {
        titleLabel.text = "Double Cheese Burger"
        numberLabel.text = "Amount in cart: 5"
    }
    
}
