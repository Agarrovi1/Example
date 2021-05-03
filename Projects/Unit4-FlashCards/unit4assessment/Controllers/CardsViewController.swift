//
//  CardsViewController.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    //MARK: - Properties
    var cards = [Cards]() {
        didSet {
            cardCollectionView.reloadData()
        }
    }

    //MARK: - UIObjects
    lazy var cardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), collectionViewLayout: layout)
        collection.register(FlashCardCell.self, forCellWithReuseIdentifier: "cardCell")
        collection.backgroundColor = .lightGray
        return collection
    }()
    
    //MARK: - Constraints
    private func setCardUI() {
        setCollectionView()
        setDelegates()
    }
    private func setCollectionView() {
        view.addSubview(cardCollectionView)
        cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cardCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            cardCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func setDelegates() {
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
    }
    //MARK: - Functions
    private func loadSavedCards() {
        do {
            let savedCards = try CardPersistance.manager.getObjects()
            cards = savedCards
        } catch {
            print(error)
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setCardUI()
        loadSavedCards()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadSavedCards()
    }

}

//MARK: - DataSource, Delegate
extension CardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        cell.actionButton.tag = indexPath.row
        cell.actionDelegate = self
        cell.addButton.isHidden = true
        cell.actionButton.isHidden = false
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? FlashCardCell else {return}
        switch selectedCell.sideFacingUp {
        case .front:
            
            UIView.transition(with: selectedCell, duration: 2, options: [.transitionFlipFromTop, .allowUserInteraction], animations: {
                selectedCell.frontTitle.isHidden = true
                selectedCell.actionButton.isHidden = true
            }, completion: { (_) in
                selectedCell.sideFacingUp = .back
            })
        case .back:
            UIView.transition(with: selectedCell, duration: 2, options: [.transitionFlipFromTop, .allowUserInteraction], animations: {
                selectedCell.frontTitle.isHidden = false
                selectedCell.actionButton.isHidden = false
            }, completion: { (_) in
                selectedCell.sideFacingUp = .front
            })
        }
    }
}
//MARK: FlowLayout
extension CardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.width)
    }
}

//MARK: ActionSheetDelegate
extension CardsViewController: ActionSheetDelegate {
    func showActionSheet(tag: Int) {
        let card = cards[tag]
        let actionSheet = UIAlertController(title: nil, message: "What would you like to do?", preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete \(card.cardTitle)", style: .destructive) { (_) in
            do {
                try CardPersistance.manager.delete(at: tag)
                let index = IndexPath(row: tag, section: 0)
                self.cardCollectionView.deleteItems(at: [index])
                self.loadSavedCards()
            } catch {
                print(error)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        self.present(actionSheet, animated: true, completion: nil)
    }
}
