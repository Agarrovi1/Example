//
//  SearchViewController.swift
//  Podcasts
//
//  Created by Angela Garrovillas on 9/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var podcastTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchString: String? = nil {
        didSet {
            loadData()
        }
    }
    
    
    var podcasts = [Podcast]() {
        didSet {
            podcastTableView.reloadData()
        }
    }
    
    private func loadData() {
        guard let searchString = searchString else {return podcasts = [Podcast]()}
        guard searchString != "" else {return podcasts = [Podcast]()}
        PodcastAPIHelper.shared.getPodcastWith(search: searchString) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let podcastsFromJSON):
                DispatchQueue.main.async {
                    self.podcasts = podcastsFromJSON
                }
            }
        }
    }
    private func setDelegates() {
        podcastTableView.dataSource = self
        searchBar.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    

    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PodcastDetailViewController, let indexPath = podcastTableView.indexPathForSelectedRow else {return}
        destination.podcast = podcasts[indexPath.row]
    }
    

}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = podcastTableView.dequeueReusableCell(withIdentifier: "podcastCell", for: indexPath) as? PodcastTableViewCell else {return UITableViewCell()}
        let pod = podcasts[indexPath.row]
        cell.podcastNameLabel.text = pod.trackName
        cell.podcastArtistLabel.text = pod.artistName
        
        ImageHelper.shared.getImage(urlString: pod.artworkUrl100) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let imageFromUrl):
                DispatchQueue.main.async {
                    cell.podcastImageVIew.image = imageFromUrl
                }
            }
        }
        return cell
    }
    
    
}
