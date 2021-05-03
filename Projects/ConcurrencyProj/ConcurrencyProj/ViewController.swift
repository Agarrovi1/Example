//
//  ViewController.swift
//  ConcurrencyProj
//
//  Created by Angela Garrovillas on 9/3/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func getImageWhenPressed(_ sender: UIButton) {
        activityIndicator.startAnimating()
        loadImage()
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    func loadImage() {
        DispatchQueue.global(qos: .userInitiated).async {
            let urlStr = "https://apod.nasa.gov/apod/image/1711/OrionDust_Battistella_1824.jpg"
            guard let url = URL(string: urlStr) else {return}
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                //dispatchqueue can be called within each other
                DispatchQueue.main.async {
                    //imageView is in the main thread, main thread handles all User Interaction
                    self.imageView.image = image
                    self.activityIndicator.stopAnimating()
                }
            } catch {
                print(error)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadImage()
        // Do any additional setup after loading the view.
    }


}

