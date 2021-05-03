//
//  ViewController.swift
//  animations-continued
//
//  Created by David Rifkin on 10/14/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var myView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var flipButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Flip", for: .normal)
        button.addTarget(self, action: #selector(flipButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var keyButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Key", for: .normal)
        button.addTarget(self, action: #selector(keyButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var myViewCenterYConstraint: NSLayoutConstraint = {
        myView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpSubviews()
        setUpConstraints()
    }
    
    @objc private func keyButtonPressed() {
        let origin = myView.center
        UIView.animateKeyframes(withDuration: 2.4, delay: 0, options: [.calculationModePaced], animations: {
        //TODO: - keyframe animation that has the view "fall down" but sway side to side as it does that (like a leaf)
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.8) {
                self.myView.transform = CGAffineTransform(translationX: -100, y: 50)
//                self.myView.center = CGPoint(x: self.myView.center.x - 100, y: self.myView.center.y + 50)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.8) {
                self.myView.transform = CGAffineTransform(translationX: 100, y: 100)
//                self.myView.center = CGPoint(x: self.myView.center.x + 200, y: self.myView.center.y + 50)
            }
            UIView.addKeyframe(withRelativeStartTime: 1.6, relativeDuration: 0.8) {
                self.myView.transform = CGAffineTransform(translationX: -100, y: 150)
//                self.myView.center = CGPoint(x: self.myView.center.x - 200, y: self.myView.center.y + 50)
            }
            
            //old code (grow, twist, make into rectangle
//            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4) {
//                self.myView.transform = CGAffineTransform(scaleX: 2, y: 2)
//            }
//            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4) {
//                self.myView.transform = CGAffineTransform(rotationAngle: 45)
//            }
//            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.4) {                self.myView.transform = CGAffineTransform(scaleX: 2, y: 1)
//            }
//        }, completion: { _ in
//            UIView.animate(withDuration: 0.4, animations: {
//                self.myView.alpha = 0.0
//            })
        },completion: { _ in
            self.myView.center = origin
            self.view.layoutIfNeeded()
        })
    }
    
    @objc private func flipButtonPressed() {
        UIView.transition(with: myView, duration: 1.2, options: [ .transitionCurlUp,.curveEaseIn], animations: {
            if self.myView.backgroundColor == .blue {
                self.myView.backgroundColor = .red
            } else {
                self.myView.backgroundColor = .blue
            }
        }, completion: nil)
    }
    
    private func setUpSubviews() {
        self.view.addSubview(myView)
        self.view.addSubview(flipButton)
        self.view.addSubview(keyButton)

    }
    
    private func setUpConstraints(){
        setUpMyViewConstraints()
        setUpFlipButtonConstraints()
        setUpKeyButtonConstraints()
    }
    
    private func setUpKeyButtonConstraints() {
        keyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keyButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            keyButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            keyButton.widthAnchor.constraint(equalToConstant: 75),
            keyButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func setUpFlipButtonConstraints(){
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flipButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            flipButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            flipButton.widthAnchor.constraint(equalToConstant: 75),
            flipButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func setUpMyViewConstraints(){
        myView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myViewCenterYConstraint,
            myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myView.widthAnchor.constraint(equalToConstant: 150),
            myView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

