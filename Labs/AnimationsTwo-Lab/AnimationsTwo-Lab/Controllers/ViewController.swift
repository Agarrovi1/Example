//
//  ViewController.swift
//  AnimationsTwo-Lab
//
//  Created by Angela Garrovillas on 10/14/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    //MARK: Images
    lazy var linearBall = BallImage()
    lazy var easeInBall = BallImage()
    lazy var easeOutBall = BallImage()
    lazy var easeInOutBall = BallImage()
    
    //MARK: Buttons
    lazy var linearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Linear", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 0
        button.addTarget(self, action: #selector(animateOptionButtonsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var easeInButton: UIButton = {
        let button = UIButton()
        button.setTitle("EaseIn", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
        button.addTarget(self, action: #selector(animateOptionButtonsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var easeOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("EaseOut", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 2
        button.addTarget(self, action: #selector(animateOptionButtonsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var easeInOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("EaseInOut", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 3
        button.addTarget(self, action: #selector(animateOptionButtonsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        return button
    }()
    lazy var animateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(animateButtonPressed), for: .touchUpInside)
        return button
    }()
    //MARK: - Constraint Functions
    private func setupUI() {
        setupLinearButton()
        setupEaseInButton()
        setupEaseOutButton()
        setupEaseInOutButton()
        
        setUp(ball: linearBall, to: linearButton)
        setUp(ball: easeInBall, to: easeInButton)
        setUp(ball: easeOutBall, to: easeOutButton)
        setUp(ball: easeInOutBall, to: easeInOutButton)
        
        setupResetButton()
        setupAnimateButton()
    }
    private func setupLinearButton() {
        view.addSubview(linearButton)
        linearButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        linearButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
    }
    private func setupEaseInButton() {
        view.addSubview(easeInButton)
        easeInButton.leadingAnchor.constraint(equalTo: linearButton.trailingAnchor, constant: 40).isActive = true
        easeInButton.topAnchor.constraint(equalTo: linearButton.topAnchor).isActive = true
    }
    private func setupEaseOutButton() {
        view.addSubview(easeOutButton)
        easeOutButton.leadingAnchor.constraint(equalTo: easeInButton.trailingAnchor, constant: 40).isActive = true
        easeOutButton.topAnchor.constraint(equalTo: linearButton.topAnchor).isActive = true
    }
    private func setupEaseInOutButton() {
        view.addSubview(easeInOutButton)
        easeInOutButton.leadingAnchor.constraint(equalTo: easeOutButton.trailingAnchor, constant: 40).isActive = true
        easeInOutButton.topAnchor.constraint(equalTo: linearButton.topAnchor).isActive = true
    }
    
    private func setUp(ball: UIView, to button: UIButton) {
        view.addSubview(ball)
        ball.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        ball.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        ball.heightAnchor.constraint(equalToConstant: ball.frame.height).isActive = true
        ball.widthAnchor.constraint(equalToConstant: ball.frame.width).isActive = true
    }
    private func setupResetButton() {
        view.addSubview(resetButton)
        resetButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        resetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    private func setupAnimateButton() {
        view.addSubview(animateButton)
        animateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        animateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    private func animate(ball: UIView,animateOption: UIView.AnimationOptions) {
        
            UIView.animate(withDuration: 3, delay: 0, options: animateOption, animations: {
                ball.center = CGPoint(x: ball.center.x, y: ball.center.y + 600)
            }, completion: nil)
        
    }
    //MARK: - @objc Functions
    @objc func resetButtonPressed() {
        setUp(ball: linearBall, to: linearButton)
        setUp(ball: easeInBall, to: easeInButton)
        setUp(ball: easeOutBall, to: easeOutButton)
        setUp(ball: easeInOutBall, to: easeInOutButton)
        view.layoutIfNeeded()
    }
    @objc func animateButtonPressed() {
       
            self.animate(ball: self.linearBall, animateOption: .curveLinear)
            self.animate(ball: self.easeInBall, animateOption: .curveEaseIn)
            self.animate(ball: self.easeOutBall, animateOption: .curveEaseOut)
            self.animate(ball: self.easeInOutBall, animateOption: .curveEaseInOut)
    }
    @objc func animateOptionButtonsPressed(sender: UIButton) {
        if sender.tag == 0 {
            linearBall.isHidden = linearBall.isHidden == true ? false : true
        } else if sender.tag == 1 {
            easeInBall.isHidden = easeInBall.isHidden == true ? false : true
        } else if sender.tag == 2 {
            easeOutBall.isHidden = easeOutBall.isHidden == true ? false : true
        } else if sender.tag == 3 {
            easeInOutBall.isHidden = easeInOutBall.isHidden == true ? false : true
        }
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }


}

