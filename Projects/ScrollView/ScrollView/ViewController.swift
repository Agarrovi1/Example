//
//  ViewController.swift
//  ScrollView
//
//  Created by Angela Garrovillas on 10/17/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
       // scroll.frame = UIScreen.main.bounds
        //scroll.contentOffset = CGPoint(x: 0, y: 0)
        scroll.scrollRectToVisible(scroll.bounds, animated: true)
        scroll.backgroundColor = .white
        return scroll
    }()
    lazy var viewForScroll: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.text = "Boo"
        label.textAlignment = .center
        return label
    }()
    func setUpUI() {
        setupScrollView()
        addNewThing()
    }
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
        
        scrollView.addSubview(viewForScroll)
        viewForScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewForScroll.topAnchor.constraint(equalTo: scrollView.topAnchor),
        viewForScroll.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: 50),
        viewForScroll.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        viewForScroll.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)])
        
    }
    func addNewThing() {
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: 20).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        view.layoutIfNeeded()
        scrollView.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }


}

