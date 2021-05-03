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
        pic.translatesAutoresizingMaskIntoConstraints = true
        
        pic.image = UIImage(named: "peekaboo")
        pic.contentMode = .scaleAspectFill
        return pic
    }()
    
    var scrollView = UIScrollView(frame: UIScreen.main.bounds)
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.scrollView.contentSize = CGSize(width:2000, height: 5000)
        scrollView.isScrollEnabled = true
        scrollView.addSubview(imageView)
        
        imageView.center = CGPoint(x: 250, y: 1000)
    }
}

