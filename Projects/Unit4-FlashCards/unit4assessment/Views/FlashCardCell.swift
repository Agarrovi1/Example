//
//  FlashCardCell.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
enum SideFacingUp {
    case front
    case back
}

class FlashCardCell: UICollectionViewCell {
    //MARK: UIObjects
    let backFacts = CardBackView()
    let frontTitle = CardFrontView()
    let addButton = UIButton(type: .contactAdd)
    let actionButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.actions, for: .normal)
        button.tintColor = .purple
        return button
    }()
    
    //MARK: Properties
    var sideFacingUp: SideFacingUp = .front
    var delegate: AlertDelegate?
    var actionDelegate: ActionSheetDelegate?
    
    //MARK: SetUp
    private func setFlashCardCellUI() {
        setBackView()
        setFrontView()
        setupAddButton()
        setupActionButton()
    }
    private func setBackView() {
        contentView.addSubview(backFacts)
        backFacts.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backFacts.topAnchor.constraint(equalTo: contentView.topAnchor),
            backFacts.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backFacts.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backFacts.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    private func setFrontView() {
        contentView.addSubview(frontTitle)
        frontTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        frontTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
        frontTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        frontTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        frontTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    private func setupAddButton() {
        addButton.backgroundColor = .green
        addButton.layer.cornerRadius = 20
        addButton.addTarget(self, action: #selector(addButtonPressed(sender:)), for: .touchUpInside)
        
        contentView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25)])
    }
    private func setupActionButton() {
        contentView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.addTarget(self, action: #selector(actionButtonPressed(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            actionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            actionButton.heightAnchor.constraint(equalToConstant: 40),
            actionButton.widthAnchor.constraint(equalToConstant: 40)])
    }
    
    //MARK: Functions
    @objc func addButtonPressed(sender: UIButton) {
        print("button pressed")
        do {
            let cards = try CardPersistance.manager.getObjects()
            if cards.contains(where: { (card) -> Bool in
                card.cardTitle == frontTitle.label.text
            }) {
                self.delegate?.showAlreadyHaveAlert(tag: sender.tag)
            } else {
                self.delegate?.showAlert(tag: sender.tag)
            }
        } catch {
            print(error)
        }
    }
    @objc func actionButtonPressed(sender: UIButton) {
        actionDelegate?.showActionSheet(tag: sender.tag)
    }
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        setFlashCardCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


