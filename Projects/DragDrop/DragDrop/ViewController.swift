//
//  ViewController.swift
//  DragDrop
//
//  Created by Angela Garrovillas on 11/9/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var itemNames = ["cupcake","download","eevee","Kwiz","missile","rowlet"]

    @IBOutlet weak var DragDropCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DragDropCollectionView.delegate = self
        DragDropCollectionView.dataSource = self
        DragDropCollectionView.dragDelegate = self
        DragDropCollectionView.dropDelegate = self
        DragDropCollectionView.dragInteractionEnabled = true
        
    }
    
    func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationPath: IndexPath, collectionView: UICollectionView) {
        if let item = coordinator.items.first,
            let sourceIndexPath = item.sourceIndexPath {
                collectionView.performBatchUpdates({
                    itemNames.remove(at:sourceIndexPath.item)
                    itemNames.insert(item.dragItem.localObject as! String, at: destinationPath.item)
                    collectionView.deleteItems(at: [sourceIndexPath])
                    collectionView.insertItems(at: [destinationPath])
                }, completion: nil)
            coordinator.drop(item.dragItem, toItemAt: destinationPath)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dragCell", for: indexPath) as? DragDropCell else {
            return  UICollectionViewCell()
        }
        let imgName = itemNames[indexPath.row]
        cell.dragImage.contentMode = .scaleAspectFill
        cell.dragImage.layer.masksToBounds = true
        cell.dragImage.image = UIImage.init(named: imgName)
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

extension ViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = itemNames[indexPath.row]
        let nsItem = item as NSString
        let itemProvider = NSItemProvider(object: nsItem)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
    
    
}

extension ViewController: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
           return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        var destinationPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationPath = IndexPath(row: row - 1, section: 0)
        }
        if coordinator.proposal.operation == .move {
            reorderItems(coordinator: coordinator, destinationPath: destinationPath, collectionView: collectionView)
        }
        
    }
    
    
}
