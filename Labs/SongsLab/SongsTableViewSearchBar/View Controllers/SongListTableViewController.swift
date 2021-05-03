//
//  SongListTableViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Angela Garrovillas on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController,UISearchBarDelegate {
    let songs = Song.loveSongs
    var songSearchResults: [Song] {
        get {
        guard let searchString = searchString else {
            return songs
        }
        guard searchString != "" else {
            return songs
        }
        if let scopeTitles = searchBarOutlet.scopeButtonTitles {
            let currentScopeIndex = searchBarOutlet.selectedScopeButtonIndex
            switch scopeTitles[currentScopeIndex] {
            case "Song":
                return filterSongNameNotCaseSensitive(arrOfSongs: songs, string: searchString)
            case "Artist":
                return filterArtistNotCaseSensitive(arrOfSongs: songs, string: searchString)
            default:
                return songs
            }
        }
        return songs
    }
    }
    var searchString: String? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songSearchResults.count == 0 ? 1 : songSearchResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if songSearchResults.count == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.text = "No Search Result Found"
            return cell
        }
        let song = songSearchResults[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        return cell
    }
    
    //MARK: - Search Bar Delegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
        if songSearchResults.count == 0 {
            searchBar.resignFirstResponder()
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SongDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        destination.song = songSearchResults[indexPath.row]
    }
 

}
