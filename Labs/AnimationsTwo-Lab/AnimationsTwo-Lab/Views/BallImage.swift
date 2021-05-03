//
//  BallImage.swift
//  AnimationsTwo-Lab
//
//  Created by Angela Garrovillas on 10/14/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class BallImage: UIView {

    let imageView = UIImageView()
    func setImage() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = self.frame
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.image = #imageLiteral(resourceName: "rainbowBall")
    }

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = self.frame.height / 2
        setImage()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
