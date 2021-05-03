//
//  ViewController.swift
//  CollectionView
//
//  Created by Angela Garrovillas on 9/26/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var elementCollectionView: UICollectionView!
    
    var elements = [ChemicalElement]() {
        didSet {
            elementCollectionView.reloadData()
        }
    }
    
    func loadData() {
        ElementAPIClient.manager.getElements { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let elementsFromJSON):
                DispatchQueue.main.async {
                    self.elements = elementsFromJSON
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        elementCollectionView.dataSource = self
        loadData()
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = elementCollectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? ElementCollectionViewCell else {
            return UICollectionViewCell()
        }
        let element = elements[indexPath.row]
        cell.symbolLabel.text = element.symbol
        cell.atomicMassLabel.text = "\(element.atomicMass)"
        cell.imageView.backgroundColor = getColorForElement(elementNum: element.number)
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
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
        let width = collectionView.bounds.size.width
        let numberOfColumns: CGFloat = 3
        let cellWidth: CGFloat = (width - ((numberOfColumns - 1) * 8)) / numberOfColumns
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
