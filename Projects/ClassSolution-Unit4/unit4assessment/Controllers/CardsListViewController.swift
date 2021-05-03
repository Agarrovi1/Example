//
//  CardsListViewController.swift
//  unit4assessment
//
//  Created by David Rifkin on 10/28/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

enum CardDataLocation {
    case local
    case remote
}

class CardsListViewController: UIViewController {
    
    var dataLocation: CardDataLocation! = .local
    
    private var cards = [Card]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 50, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.6996423602, green: 0.7059319615, blue: 0.9313206077, alpha: 1)
        //we need a cell!
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    private func loadData() {
        if dataLocation == .local {
            loadDataFromPersistence()
        } else if dataLocation == .remote {
            loadDataFromOnline()
        }
    }
    
    private func loadDataFromPersistence() {
        do {
            cards = try CardPersistenceHelper.manager.getCards()
        } catch {
            print(error)
        }
    }
    
    private func loadDataFromOnline() {
        CardsApiClient.shared.getCardData { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let cardsFromOnline):
                    self.cards = cardsFromOnline
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
    }
    
}
extension CardsListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //we'll need a new cell
        return UICollectionViewCell()
        
    }
    
}

extension CardsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 400 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
}
