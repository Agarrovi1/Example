//
//  BrowseCell.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class BrowseCell: UICollectionViewCell {
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UIObjects
    var recipeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    var servingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    var prepTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    var spinner: UIActivityIndicatorView = {
        let spin = UIActivityIndicatorView(style: .medium)
        spin.hidesWhenStopped = true
        return spin
    }()
    
    //MARK: - Set up
    private func setupCell() {
        addAllCellConstraints()
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
        //setExampleText()
    }
    
    private func setExampleText() {
        titleLabel.text = "What to make for dinner tonight?? Bruschetta Style Pork & Pasta"
        servingLabel.text = "Serving size: 4"
        prepTimeLabel.text = "Prep Time(min): 45"
    }
    
    //MARK: - Constraints
    private func addAllCellConstraints() {
        addImageConstraints()
        addTitleLabelConstraints()
        addServingLabelConstraints()
        addPrepTimeLabelConstraints()
        addActivityIndicator()
    }
    private func addImageConstraints() {
        contentView.addSubview(recipeImage)
        recipeImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipeImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6)])
    }
    private func addTitleLabelConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.13)])
    }
    private func addServingLabelConstraints() {
        contentView.addSubview(servingLabel)
        servingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            servingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            servingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            servingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            servingLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.13)])
    }
    private func addPrepTimeLabelConstraints() {
        contentView.addSubview(prepTimeLabel)
        prepTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prepTimeLabel.topAnchor.constraint(equalTo: servingLabel.bottomAnchor),
            prepTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            prepTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            prepTimeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.13)])
    }
    private func addActivityIndicator() {
        recipeImage.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        NSLayoutConstraint.activate([
            spinner.centerYAnchor.constraint(equalTo: recipeImage.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: recipeImage.centerXAnchor)])
    }
}
