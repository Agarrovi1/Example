//
//  ElementDetailViewController.swift
//  Elements
//
//  Created by Angela Garrovillas on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementDetailViewController: UIViewController {

    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var discoveredByLabel: UILabel!
    @IBOutlet weak var boilingPointLabel: UILabel!
    @IBOutlet weak var meltingPointLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameAndSymbolLabel: UILabel!
    @IBOutlet weak var elementImageView: UIImageView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    var element: ChemicalElement?
    
    private func setLabelInfo() {
        guard let element = element else {return}
        nameAndSymbolLabel.text = "(\(element.symbol)) \(element.name)"
        numberLabel.text = "Number: \(element.number)"
        weightLabel.text = "Atomic Mass: \(element.atomicMass)"
        setOptionalInfo()
    }
    
    private func setOptionalInfo() {
        guard let element = element else {return}
        if let melt = element.melt {
            meltingPointLabel.text = "Melting Point: \(melt) K"
        } else {
            meltingPointLabel.text = "Melting Point: Null"
        }
        
        if let boil = element.boil {
            boilingPointLabel.text = "Boiling Point: \(boil) K"
        } else {
            boilingPointLabel.text = "Boiling Point: Null"
        }
        
        if let discoverer = element.discoveredBy {
            discoveredByLabel.text = "Discovered By: \(discoverer)"
        } else {
            discoveredByLabel.text = "Discovered By: Null"
        }
    }
    
    private func setImage() {
        guard let element = element else {return}
        ImageHelper.shared.getFullImage(with: element.name) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.elementImageView.image = UIImage(named: "noImage")
                    print(error)
                case .success(let imageFromUrl):
                    self.loadingSpinner.stopAnimating()
                    self.elementImageView.image = imageFromUrl
                }
            }
            
        }
    }
    
    @IBAction func favButtonPressed(_ sender: UIButton) {
        guard let element = element else {return}
        let favElement = FavoriteElement(elementName: element.name, elementSymbol: element.symbol)
        ElementAPIClient.manager.postFavElement(fav: favElement) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                print("could not favorite/post")
            case .success(let data):
                print(data)
                print("successfully favorited")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelInfo()
        setImage()
    }
    

}
