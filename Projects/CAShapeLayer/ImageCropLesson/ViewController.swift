//
//  ViewController.swift
//  ImageCropLesson
//
//  Created by C4Q on 1/7/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IB Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cropButton: UIButton!
    
    
    //MARK: Properties
    private let strokeColor: UIColor = .purple
    private let lineWidth: CGFloat = 2.0
    private var shapeLayer = CAShapeLayer()
    private var path = UIBezierPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: IB Actions
    
    
    @IBAction func cropButtonPressed(_ sender: UIButton) {
        imageView.layer.mask = shapeLayer
        shapeLayer.fillColor = UIColor.black.cgColor
        imageView.renderImageToLayer()
        imageView.turnOffInteraction()
        cropButton.toggle()
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        shapeLayer.removeFromSuperlayer()
        path = UIBezierPath()
        shapeLayer = CAShapeLayer()
        imageView.isUserInteractionEnabled = true
    }
    
    private func addPathToShapeLayer() {
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        imageView.layer.addSublayer(shapeLayer)
    }
    

}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == imageView {
                let touchPoint = touch.location(in: imageView)
                path.move(to: touchPoint)
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == imageView {
                let touchPoint = touch.location(in: imageView)
                path.addLine(to: touchPoint)
                addPathToShapeLayer()
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == imageView {
                let touchPoint = touch.location(in: imageView)
                path.addLine(to: touchPoint)
                path.close()
                addPathToShapeLayer()
                cropButton.toggle()
                imageView.turnOffInteraction()
            }
        }
    }
}
