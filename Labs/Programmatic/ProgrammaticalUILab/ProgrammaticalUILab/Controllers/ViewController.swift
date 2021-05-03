//
//  ViewController.swift
//  ProgrammaticalUILab
//
//  Created by Angela Garrovillas on 10/7/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    var color = Color.generateRandomRGBValues()
    var score = ScoreBoard()
    
    
    //MARK: - Buttons
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.setTitle("Red", for: .normal)
        button.titleLabel?.textColor = .red
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var greenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Green", for: .normal)
        button.titleLabel?.textColor = .green
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Blue", for: .normal)
        button.titleLabel?.textColor = .blue
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Labels
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score:"
        return label
    }()
    
    lazy var highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "High Score:"
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Guess the closest color!"
        return label
    }()
    
    //MARK: - ImageView
    lazy var colorView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = color.changeToUIColor()
        return imageView
    }()
    
    //MARK: - Functions
    private func setupSubViews() {
        view.addSubview(redButton)
        redButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenButton)
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueButton)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(highScoreLabel)
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func addConstraints() {
        let margins = view.layoutMarginsGuide
        
        scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        highScoreLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 10).isActive = true
        highScoreLabel.leadingAnchor.constraint(equalTo: scoreLabel.leadingAnchor).isActive = true
        highScoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        colorView.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 30).isActive = true
        colorView.leadingAnchor.constraint(equalTo: highScoreLabel.leadingAnchor, constant: 20).isActive = true
        colorView.trailingAnchor.constraint(equalTo: margins.trailingAnchor,constant: -70).isActive = true
        
        
        greenButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        greenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenButton.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 50).isActive = true
        greenButton.leadingAnchor.constraint(equalTo: redButton.trailingAnchor, constant: 20).isActive = true
        
        redButton.centerYAnchor.constraint(equalTo: greenButton.centerYAnchor).isActive = true
        redButton.leadingAnchor.constraint(equalTo: scoreLabel.leadingAnchor).isActive = true
        redButton.widthAnchor.constraint(equalTo: greenButton.widthAnchor).isActive = true
        
        blueButton.centerYAnchor.constraint(equalTo: greenButton.centerYAnchor).isActive = true
        blueButton.leadingAnchor.constraint(equalTo: greenButton.trailingAnchor, constant: 20).isActive = true
        blueButton.widthAnchor.constraint(equalTo: greenButton.widthAnchor).isActive = true
        
        infoLabel.topAnchor.constraint(equalTo: greenButton.bottomAnchor, constant: 20).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: greenButton.centerXAnchor).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: redButton.leadingAnchor).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func buttonPressed(sender: UIButton) {
        let correctColor = color.findTheGreatest()
        if sender.titleLabel?.text == correctColor {
            score.youWonScore()
            infoLabel.text = "Correct!"
        } else {
            score.youLostScore()
            infoLabel.text = "Incorrect!"
        }
        updateScoreLabels()
        updateNewColorIntoView()
    }
    private func updateScoreLabels() {
        scoreLabel.text = "Score: \(score.score)"
        highScoreLabel.text = "High Score: \(score.highScore)"
    }
    private func updateNewColorIntoView() {
        color = Color.generateRandomRGBValues()
        colorView.backgroundColor = color.changeToUIColor()
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        addConstraints()
        view.backgroundColor = .white
    }


}

