//
//  ViewController.swift
//  July30-second
//
//  Created by Angela Garrovillas on 7/30/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentRecipe = 0

    @IBAction func leftButtonPressed(_ sender: UIButton) {
        //we look at recipe one index lower
        if currentRecipe == 0 {
            currentRecipe = recipes.count - 1
        } else {
            currentRecipe -= 1
        }
        updateTheUI(index: currentRecipe)
    }
    @IBAction func middleButtonPressed(_ sender: UIButton) {
    }
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        //we look at recipe one index higher
        if currentRecipe == recipes.count - 1 {
            currentRecipe = 0
        } else {
            currentRecipe += 1
        }
        updateTheUI(index: currentRecipe)
    }
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeText: UITextView!
    
    private func updateTheUI(index: Int) {
        let gettingInfo = getInfoFromModel(index: index)
        recipeName.text = gettingInfo.0
        recipeImage.image = gettingInfo.1
        recipeText.text = gettingInfo.2
    }
    private func getInfoFromModel(index: Int) -> (String,UIImage,String) {
        let recipe = recipes[currentRecipe]
        return (recipe.name,recipe.image,recipe.directions.reduce("", {(a,b) -> String in return a + b}))
        //a lot of work for view controller
        //
    }
    let recipes = Recipe.getRecipes()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       updateTheUI(index: currentRecipe)
    }


}

