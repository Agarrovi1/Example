//
//  DetailedViewController.swift
//  REVIEW-UI
//
//  Created by Angela Garrovillas on 10/10/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var detailedView = DetailedView()
    var singleRecipe: MoreData?

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setupUI()
        // Do any additional setup after loading the view.
    }
    func addSubView() {
        self.view.addSubview(detailedView)
    }
    func setupUI() {
        guard let recipe = singleRecipe else {
            return
        }
        ImageHelper.shared.fetchImage(urlString: recipe.recipe.image) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    self.detailedView.recipeImage.image = image
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
