//
//  DetailScreenVC.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit
enum SegueFrom {
    case browse
    case cart
}

class DetailScreenVC: UIViewController {
    //MARK: - UIObjects
    private var detailTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    private var detailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    private var countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "Number of Items in Cart: 0"
        return label
    }()
    private var countStepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.stepValue = 1
        return stepper
    }()
    var spinner: UIActivityIndicatorView = {
        let spin = UIActivityIndicatorView()
        spin.hidesWhenStopped = true
        return spin
    }()
    
    //MARK: - Properties
    var recipe: Recipe?
    var segueFrom: SegueFrom = .browse
    var baseUrl: String?
    
    //MARK: - Constraints
    private func addAllDetailConstraints() {
        addDetailTitleConstraints()
        addDetailImageConstraints()
        addCountLabelConstraints()
        addStepperConstraints()
        addActivityIndicator()
    }
    private func addDetailTitleConstraints() {
        view.addSubview(detailTitle)
        detailTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            detailTitle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            detailTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    private func addDetailImageConstraints() {
        view.addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailImage.topAnchor.constraint(equalTo: detailTitle.bottomAnchor),
            detailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            detailImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)])
    }
    private func addCountLabelConstraints() {
        view.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 10),
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.widthAnchor.constraint(equalTo: detailTitle.widthAnchor),
            countLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)])
    }
    private func addStepperConstraints() {
        view.addSubview(countStepper)
        countStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countStepper.topAnchor.constraint(equalTo: countLabel.bottomAnchor),
            countStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    private func addActivityIndicator() {
        view.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        NSLayoutConstraint.activate([
            spinner.centerYAnchor.constraint(equalTo: detailImage.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: detailImage.centerXAnchor)])
    }
    
    //MARK: - Methods
    private func loadRecipe() {
        getRecipeBy(id: recipe?.id ?? 215435) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let recipeFromJSON):
                DispatchQueue.main.async { [weak self] in
                    self?.detailTitle.text = recipeFromJSON.title
                }
            }
        }
    }
    private func loadDetailImage() {
        var imageUrl = ""
        
        switch segueFrom {
        case .browse:
            imageUrl = "\(baseUrl ?? "")\(recipe?.image ?? "")"
        case .cart:
            imageUrl = recipe?.image ?? ""
        }
        
        getImage(withUrlString: imageUrl) { (results) in
            switch results {
            case .failure(let error):
                print(error)
            case .success(let imageFromJSON):
                DispatchQueue.main.async { [weak self] in
                    self?.detailImage.image = imageFromJSON
                    self?.spinner.stopAnimating()
                }
            }
        }
    }
    
    func loadCountOfRecipe() {
        do {
            let cart = try getCartInfo()
            if let count = cart.recipeIdToCount[recipe?.id ?? 0] {
                countLabel.text = "Number of Items in Cart: \(count)"
                countStepper.value = Double(count)
            } else {
                countLabel.text = "Number of Items in Cart: 0"
                countStepper.value = 0
            }
        } catch {
            print(error)
        }
    }
    
    //MARK: Objc Func
    @objc private func stepperStepped() {
        let count = Int(countStepper.value)
        do {
            try save(recipeId: recipe?.id ?? 0, recipeCount: count)
            countLabel.text = "Number of Items in Cart: \(Int(countStepper.value))"
        } catch {
            print(error)
        }
        
            
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        addAllDetailConstraints()
        countStepper.addTarget(self, action: #selector(stepperStepped), for: .valueChanged)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadRecipe()
        loadDetailImage()
        loadCountOfRecipe()
        
    }
    

}
