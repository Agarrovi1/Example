//
//  ViewController.swift
//  Oct11
//
//  Created by Angela Garrovillas on 10/11/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var originalY: CGPoint = self.circle.frame.origin
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("button", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var circle: UIView = {
        let view = UIView()
        var frame = view.frame
               frame.size.height = CGFloat(100)
               frame.size.width = CGFloat(100)
               view.frame = frame
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.layer.cornerRadius = view.layer.frame.height / 2
        view.clipsToBounds = true
        return view
    }()

    @objc func pressed(sender: UIButton) {
//        let alert = UIAlertController(title: "You pressed a button", message: nil, preferredStyle: .alert)
//        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(ok)
//        self.present(alert, animated: true, completion: nil)
        
//        UIView.animate(withDuration: 1.5) {
//
//        }
        UIView.animate(withDuration: 1.5, delay: 0.4, options: [.repeat], animations: {
            if self.circle.frame.origin.y < 0 {
                self.circle.frame.origin.y += 400
            } else {
                self.circle.frame.origin.y -= 200
            }
        }, completion: nil)
    }
    
    func addSubviewAndConstraints() {
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        self.view.addSubview(circle)
        
        
        
        button.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        circle.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 50).isActive = true
        circle.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        circle.heightAnchor.constraint(equalToConstant: circle.frame.height).isActive = true
        circle.widthAnchor.constraint(equalToConstant: circle.frame.width).isActive = true
    }
    func makeRounded() {
        
        circle.layer.borderColor = UIColor.black.cgColor
        circle.layer.borderWidth = 2
        let height = circle.frame.height
        circle.layer.cornerRadius = (height / 2)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewAndConstraints()
        makeRounded()
        // Do any additional setup after loading the view.
    }


}

