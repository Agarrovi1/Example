//
//  MovieDetailViewController.swift
//  MultipleMVCLessonRepo
//
//  Created by Angela Garrovillas on 8/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieDescription: UITextView!
    
    var movie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie.name
        genreLabel.text = movie.genre
        moviePosterImage.image = UIImage(named: movie.posterImageName)
        movieDescription.text = movie.description

        // Do any additional setup after loading the view.
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
