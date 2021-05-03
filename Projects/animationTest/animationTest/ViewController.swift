//
//  ViewController.swift
//  animationTest
//
//  Created by Angela Garrovillas on 1/23/21.
//  Copyright © 2021 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var myButton: UIButton = {
            let button = UIButton(frame: CGRect(x: self.view.frame.midX, y: 100, width: 50, height: 50))
            button.setTitle("Press Me!", for: .normal)
            button.backgroundColor = .blue
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            button.layer.cornerRadius =  button.frame.width / 2
            return button
        }()
        
        lazy var myView: UIView = {
            let view = UIView(frame: CGRect(x: (self.myButton.frame.minX - myButton.frame.width / 2) , y: self.myButton.frame.minY + 100, width: 100, height: 100))
            view.backgroundColor = .green
            view.layer.cornerRadius = view.frame.height / 2
            return view
        }()
        /*
        @objc func buttonPressed(sender: UIButton) {
            let alert = UIAlertController.init(title: nil, message: "You pressed a button", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .destructive, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true)
        }
     
     */
    func animate(view: UIView, path: UIBezierPath) {
      // 1
      let animation = CAKeyframeAnimation(keyPath: "position")

      // 2
      animation.path = path.cgPath

      // 3
      animation.repeatCount = 1

      // 4
      animation.duration = 5

      // 5
      view.layer.add(animation, forKey: "animation")
    }
        
        @objc func buttonPressed(sender: UIButton) {
//            UIView.animate(withDuration: 1.5) {
//    //            self.myView.frame.origin.y += 200
//                if self.myView.frame.origin.y < 600 {
//                    self.myView.frame.origin.y += 200
//                } else {
//                    self.myView.frame = CGRect(x: self.myView.frame.minX - self.myButton.frame.width / 2, y: 100, width: 50, height: 50)
//                }
//            }
            startAnimating()
        }
    
    func startAnimating() {
      // 1
      let path = UIBezierPath()

      // 2
        let initialPoint = self.getPoint(for: 0)
      path.move(to: initialPoint)

      // 3
      for angle in 1...360 { path.addLine(to: self.getPoint(for: angle)) }

      // 4
      path.close()

      // 5
      self.animate(view: self.myView, path: path)
    }
    
    private func getPoint(for angle: Int) -> CGPoint {
      // 1
        let radius = Double(self.myButton.frame.width * 2)

      // 2
      let radian = Double(angle) * Double.pi / Double(180)

      // 3
      let newCenterX = Double(myButton.frame.origin.x + (myButton.frame.height / 2)) + radius * cos(radian)
    let newCenterY = Double(myButton.frame.origin.y + (myButton.frame.width / 2)) + radius * sin(radian)

      return CGPoint(x: newCenterX, y: newCenterY)
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            self.view.addSubview(myView)
            self.view.addSubview(myButton)
        }

}

