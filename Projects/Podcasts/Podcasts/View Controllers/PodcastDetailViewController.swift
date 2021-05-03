//
//  PodcastDetailViewController.swift
//  Podcasts
//
//  Created by Angela Garrovillas on 9/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class PodcastDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBAction func favButtonPressed(_ sender: UIButton) {
        guard let pod = podcast else {return}
        let favPodcast = PostFavWrapper(trackId: pod.trackId, collectionName: pod.collectionName, artworkUrl600: pod.artworkUrl600)
        PodcastAPIHelper.shared.postPodcast(fav: [favPodcast]) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let success):
                print("successfully favorited")
                print(success)
            }
        }
    }
    
    var podcast: Podcast?
    private func loadLabels() {
        guard let pod = podcast else {return}
        nameLabel.text = pod.trackName
        artistLabel.text = pod.artistName
        trackCountLabel.text = "Number of tracks: \(pod.trackCount)"
    }
    
    private func loadImage() {
        guard let pod = podcast else {return}
        ImageHelper.shared.getImage(urlString: pod.artworkUrl600) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let imageFromUrl):
                DispatchQueue.main.async {
                    self.detailImageView.image = imageFromUrl
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabels()
        loadImage()

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
