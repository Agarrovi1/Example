//
//  CartScreen.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class CartScreenVC: UIViewController {
//MARK: - UIObjects
    var cartTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartCell.self, forCellReuseIdentifier: "cartCell")
        return tableView
    }()
    //MARK: -Properties
    var cart = CartInfo(recipeIdToCount: [:]) {
        didSet {
            recipeIdsInCart = cart.recipeIdToCount.compactMap{ (key: Int, value: Int) -> Int? in
                if value == 0 {
                    return nil
                } else {
                    return key
                }
            }
                //Array(cart.recipeIdToCount.keys)
        }
    }
    var recipeIdsInCart = [Int]() {
        didSet {
            loadMultipleRecipes(ids: recipeIdsInCart)
        }
    }
    var recipes = [Recipe]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.cartTableView.reloadData()
            }
        }
    }
    
    //MARK: - Constraints
    private func addTableViewConstraints() {
        view.addSubview(cartTableView)
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cartTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cartTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cartTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cartTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    //MARK: - Methods
    private func setDelegates() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    private func loadCartInfo() {
        do {
            let savedCart = try getCartInfo()
            cart = savedCart
        } catch {
            print(error)
        }
    }
    private func loadMultipleRecipes(ids: [Int]) {
        getMultipleRecipes(ids: ids) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let savedRecipes):
                DispatchQueue.main.async { [weak self] in
                    self?.recipes = savedRecipes
                }
            }
        }
    }
    private func loadImage(in cell: CartCell, urlString: String) {
        getImage(withUrlString: urlString) { (results) in
            switch results {
            case .failure(let error):
                print(error)
            case .success(let imageFromUrl):
                DispatchQueue.main.async {
                    cell.spinner.stopAnimating()
                    cell.recipeImageView.image = imageFromUrl
                }
            }
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        addTableViewConstraints()
        setDelegates()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCartInfo()
    }
    

}

//MARK: TableViewDelegate/DataSource
extension CartScreenVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as? CartCell else {
            return UITableViewCell()
        }
        cell.recipeImageView.backgroundColor = .gray
        cell.spinner.startAnimating()
        let recipe = recipes[indexPath.row]
        cell.titleLabel.text = recipe.title
        cell.numberLabel.text = "Amount in cart: \(cart.recipeIdToCount[recipe.id] ?? 0)"
        
        loadImage(in: cell, urlString: recipe.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailScreenVC()
        detailVC.segueFrom = .cart
        detailVC.recipe = recipes[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
