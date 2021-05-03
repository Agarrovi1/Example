//
//  ViewController.swift
//  KeyboardHandling-Lab
//
//  Created by Angela Garrovillas on 10/17/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var redView = DurarHRScreen()
    var tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideRedView))
    
    @objc func hideRedView() {
        print("tapped")
        UIView.transition(with: self.view, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
            self.redView.isHidden = true
        }) { (_) in
            self.redView.removeFromSuperview()
        }
    }
    func setUpDurar() {
        view.addSubview(redView)
        NSLayoutConstraint.activate([
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            redView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDurar()
    self.redView.addGestureRecognizer(tapGesture)
    }


}

