//
//  ViewController.swift
//  Review-Unit4
//
//  Created by Angela Garrovillas on 10/23/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    var shoppingList = defaultList
    
    
    //MARK: - UIObjects
    var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.register(ShoppingListCell.self, forCellWithReuseIdentifier: "itemCell")

        collection.backgroundColor = .green
        return collection
    }()
    lazy var plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonPressed))
    lazy var personButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
    lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        gesture.minimumPressDuration = 1
        gesture.cancelsTouchesInView = false
        return gesture
    }()

    //MARK: - Constraints
    private func setupUI() {
        setDelegates()
        setupCollectionView()
        setNavButtons()
        view.layoutIfNeeded()
    }
    private func setupCollectionView() {
        listCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listCollectionView)
        NSLayoutConstraint.activate([
            listCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    private func setNavButtons() {
        self.navigationItem.rightBarButtonItem = plusButton
        self.navigationItem.leftBarButtonItem = personButton
    }
    
    //MARK: - Functions
    private func setDelegates() {
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
    }
    @objc func plusButtonPressed() {
        let createVC = CreateViewController()
        self.navigationController?.pushViewController(createVC, animated: true)
    }
    @objc func longPressed() {
        print("long press")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupUI()
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ShoppingListCell else {
            return UICollectionViewCell()
        }
        let item = shoppingList[indexPath.row]
        cell.nameLabel.text = item.name.capitalized
        cell.priceLabel.text = "$\(item.price)"
        cell.gestureRecognizers = [longPressGesture]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - (8 * 2)) / 3
        return CGSize(width: width, height: width)
    }
}
