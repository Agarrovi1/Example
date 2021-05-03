//
//  ViewController.swift
//  REVIEW-UI
//
//  Created by Olimpia on 10/10/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var foodView = TableViewView()
    
    var recipes = [MoreData]() {
        didSet {
            foodView.tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setDelegate()
        getUsData()
        
    }
    
    func getUsData() {
        APIManager.manager.getData { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let recipesFromJson):
                DispatchQueue.main.async {
                    self.recipes = recipesFromJson
                }
            }
        }
    }
    func setDelegate() {
        foodView.tableView.delegate = self
        foodView.tableView.dataSource = self
    }

    func addSubViews() {
        self.view.addSubview(foodView.tableView)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        let singleRecipe = recipes[indexPath.row]
        cell.name.text = singleRecipe.recipe.label
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        let detailedVC = DetailedViewController()
        detailedVC.singleRecipe = recipe
        self.navigationController?.pushViewController(detailedVC, animated: true)
        
    }
    
}
