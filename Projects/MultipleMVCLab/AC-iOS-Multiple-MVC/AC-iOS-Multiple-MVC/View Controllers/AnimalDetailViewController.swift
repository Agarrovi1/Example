//
//  AnimalDetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Angela Garrovillas on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailOrigin: UILabel!
    @IBOutlet weak var detailClassification: UILabel!
    @IBOutlet weak var detailInfo: UITextView!
    
    var animal: ZooAnimal!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        detailImage.image = UIImage(named: "\(animal.imageNumber)")
        detailName.text = animal.name
        detailOrigin.text = "Origin: \(animal.origin)"
        detailClassification.text = "Classification: \(animal.classification)"
        detailInfo.text = animal.info
        
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
