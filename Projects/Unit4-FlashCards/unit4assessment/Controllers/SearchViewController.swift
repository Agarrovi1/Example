//
//  SearchViewController.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var cards = [Cards]() {
        didSet {
            searchCollectionView.reloadData()
        }
    }
    
    //MARK: - UI Objects
    lazy var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), collectionViewLayout: layout)
        collection.register(FlashCardCell.self, forCellWithReuseIdentifier: "cardCell")
        collection.backgroundColor = .lightGray
        return collection
    }()
    
    //MARK: - SetUp
    private func setupSearchUI() {
        setDelegates()
        setupCollectionView()
    }
    private func setDelegates() {
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
    }
    
    //MARK: Constraints
    private func setupCollectionView() {
        view.addSubview(searchCollectionView)
        searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    //MARK: - Functions
    private func loadCards() {
        CardAPIClient.helper.getCards { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cards):
                DispatchQueue.main.async {
                    self.cards = cards
                }
            }
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setupSearchUI()
        loadCards()
    }
    
    
}
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? FlashCardCell else {
            return UICollectionViewCell()
        }
        let flashCard = cards[indexPath.row]
        cell.frontTitle.label.text = flashCard.cardTitle
        cell.backFacts.textView.text = flashCard.makeFactString()
        cell.addButton.tag = indexPath.row
        cell.delegate = self
        cell.actionButton.isHidden = true
        cell.addButton.isHidden = false
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? FlashCardCell else {return}
        switch selectedCell.sideFacingUp {
        case .front:
            
            UIView.transition(with: selectedCell, duration: 2, options: [.transitionFlipFromTop], animations: {
                selectedCell.frontTitle.isHidden = true
                selectedCell.addButton.isHidden = true
            }, completion: { (_) in
                selectedCell.sideFacingUp = .back
            })
        case .back:
            UIView.transition(with: selectedCell, duration: 2, options: [.transitionFlipFromTop], animations: {
                selectedCell.frontTitle.isHidden = false
                selectedCell.addButton.isHidden = false
            }, completion: { (_) in
                selectedCell.sideFacingUp = .front
            })
        }
    }
}

//MARK: FlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.width)
    }
}

extension SearchViewController: AlertDelegate {
    func showAlert(tag: Int) {
        let card = cards[tag]
        do {
           try CardPersistance.manager.save(newElement: card)
            print("saved")
        } catch {
            print(error)
        }
        let alert = UIAlertController(title: "Card Added", message: "\(card.cardTitle) was added to Cards", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlreadyHaveAlert(tag: Int) {
        let card = cards[tag]
        let alert = UIAlertController(title: "Card Not Added", message: "\(card.cardTitle) already exists in Cards", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        print("not Saved")
    }
}
