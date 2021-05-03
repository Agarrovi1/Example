//
//  ViewController.swift
//  BezierPathLab
//
//  Created by Angela Garrovillas on 1/9/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var leadingPoint = CGPoint(x: view.frame.minX, y: view.frame.maxY / 2)
    lazy var trailingPoint = CGPoint(x: view.frame.maxX, y: view.frame.maxY / 2)
    
    //MARK: Properties
    private let strokeColor: UIColor = .purple
    private let lineWidth: CGFloat = 2.0
    private var shapeLayer = CAShapeLayer()
    private var path = UIBezierPath()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        path.move(to: leadingPoint)
        // Do any additional setup after loading the view.
    }

    private func addPathToShapeLayer(path: UIBezierPath) {
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    private func startNewPath() {
        shapeLayer.removeFromSuperlayer()
        shapeLayer = CAShapeLayer()
        path = UIBezierPath()
        path.move(to: leadingPoint)
    }
    func findMidPoint(touchPoint: CGPoint) -> CGPoint {
        let averageX = (touchPoint.x + view.center.x) / 2
        let averageY = (touchPoint.y + view.center.y) / 2
        return CGPoint(x: averageX, y: averageY)
    }

}

extension ViewController {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startNewPath()
        if let touch = touches.first {
            let touchPoint = touch.location(in: view)
            path.addLine(to: touchPoint)
            path.move(to: touchPoint)
            path.addLine(to: trailingPoint)
            path.addQuadCurve(to: leadingPoint, controlPoint: touchPoint)
            addPathToShapeLayer(path: path)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        startNewPath()
        if let touch = touches.first {
            let touchPoint = touch.location(in: view)
            path.addLine(to: touchPoint)
            path.move(to: touchPoint)
            path.addLine(to: trailingPoint)
            path.addQuadCurve(to: leadingPoint, controlPoint: touchPoint)
            addPathToShapeLayer(path: path)
            
        }
    }
}

/*
 func draw(_ rect: CGRect) {
     ...
  
     path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
                         radius: self.frame.size.height/2,
                         startAngle: CGFloat(180.0).toRadians(),
                         endAngle: CGFloat(0.0).toRadians(),
                         clockwise: true)
  
     ...
 }
 */
