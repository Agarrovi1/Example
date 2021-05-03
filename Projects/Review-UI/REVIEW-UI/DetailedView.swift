//
//  DetailedView.swift
//  REVIEW-UI
//
//  Created by Angela Garrovillas on 10/10/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import UIKit

class DetailedView: UIView {

    lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        addSubview(recipeImage)
        setConstraints()
    }
    private func setConstraints() {
        recipeImage.translatesAutoresizingMaskIntoConstraints = false
        [recipeImage.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
         recipeImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
            ].forEach({$0.isActive = true})
    }
}

/*
 ,
  recipeImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
  recipeImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
 recipeImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50)
 */
