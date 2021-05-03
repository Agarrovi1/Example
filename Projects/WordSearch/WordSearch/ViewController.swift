//
//  ViewController.swift
//  WordSearch
//
//  Created by Angela Garrovillas on 8/30/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var wordCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordCollectionView.delegate = self
        wordCollectionView.dataSource = self
        
        
//        let flowLayout = UICollectionViewFlowLayout()
        
//        flowLayout.estimatedItemSize = boxSize
//        flowLayout.itemSize = boxSize
//        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        wordCollectionView.collectionViewLayout = flowLayout
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letterCell", for: indexPath) as? LetterCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.letterLabel.text = "A"
        cell.letterLabel.textAlignment = .center
        return cell
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let boxSize = CGSize(width: view.bounds.width / 10, height: view.bounds.width / 10)
        return boxSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
