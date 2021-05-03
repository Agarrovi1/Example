//
//  ViewController.swift
//  ScrollView
//
//  Created by Anthony Gonzalez on 10/17/19.
//  Copyright © 2019 Antnee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let pic = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        pic.image = UIImage(named: "peekaboo")
        pic.contentMode = .scaleAspectFill
        return pic
    }()
    
    var scrollView = UIScrollView(frame: UIScreen.main.bounds)
    @objc func keyboardTriggered(sender: Notification) {
        //we'll adjust the size of our scrollview, or adjust the position of our views if they're not in  a scroll view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        scrollView.updateContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
//        scrollView.contentSize = CGSize(width:2000, height: view.bounds.height + 500)
        scrollView.isScrollEnabled = true
        scrollView.addSubview(imageView)
        
        imageView.center = CGPoint(x: 600, y: 1000)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardTriggered(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
}


extension UIScrollView {
    func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
        
        contentSize.width = subviews.sorted(by: { $0.frame.maxX < $1.frame.maxX }).last?.frame.maxX ?? contentSize.width
    }
}




