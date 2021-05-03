//
//  CardBackView.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class CardBackView: UIView {
    
    let textView = UITextView()
    
    func setupTextView() {
        textView.textColor = .blue
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .center
        textView.font = UIFont.systemFont(ofSize: 20)
        
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
