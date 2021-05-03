//
//  PersonsTableViewController.swift
//  Aug15
//
//  Created by Angela Garrovillas on 8/15/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
        
    }
    
    let people = Person.allPeople
    var personSearchResults: [Person] {
        //when we have no search term, return the value of the initial set of people
        guard let searchString = searchString else {
            return people
        }
        guard searchString != "" else {
            return people
        }
        if let scopeTitles = searchBarOutlet.scopeButtonTitles {
            let currentScopeIndex = searchBarOutlet.selectedScopeButtonIndex
            switch scopeTitles[currentScopeIndex] {
            case "Name":
                return people.filter({$0.name.contains(searchString.lowercased())})
            case "Phone":
                return people.filter({$0.phone.contains(searchString.lowercased().replacingOccurrences(of: "-", with: ""))})
            default:
                return people.filter({$0.name.contains(searchString.lowercased()) || $0.phone.contains(searchString.lowercased())})
            }
        }
        return people.filter({$0.name.contains(searchString.lowercased()) || $0.phone.contains(searchString.lowercased())})
    }
    var didLaunch = false
    var searchString: String? = nil {
        didSet {
            print(searchString)
            //every time it changes, reload data
            self.tableView.reloadData()
        }
    }
    //user input
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return personSearchResults.count
        //return people.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personSearchResults[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne") else  {
            return UITableViewCell()
        }
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.phone
        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//Use extensions to make it cleaner
extension PersonsTableViewController: UISearchBarDelegate {
    //MARK: -- SearchBar methods
    //    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    //        print("something")
    //    }
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchString = searchBar.text
//    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
        //searches as we type
        //searched update live
    }
    
}
