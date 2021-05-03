//
//  ShoppingListTableViewController.swift
//  EditingTableViewLab
//
//  Created by Angela Garrovillas on 8/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {
    //MARK: - Properties
    var shoppingList = unpuchasedPurchased()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupShoppingData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    private func setupShoppingData() {
        let items = ShoppingItemFetchingClient.getShoppingItems()
        shoppingList.unpurchased = items
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return shoppingList.unpurchased.count
        case 1:
            return shoppingList.purchased.count
        default:
            print("something up in numberORowsInSection")
        }
        print("something up in numberORowsInSection")
        return shoppingList.unpurchased.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let section = indexPath.section
        let row = indexPath.row
        switch section {
        case 0:
            cell.backgroundColor = UIColor(red: 0.939, green: 0.556, blue: 0.369, alpha: 1)
            cell.textLabel?.text = shoppingList.both[section][row].name
            cell.detailTextLabel?.text = shoppingList.both[section][row].price.description
            return cell
        default:
            cell.backgroundColor = UIColor(red: 0.939, green: 0.556, blue: 0.369, alpha: 1)
            cell.textLabel?.text = shoppingList.both[section][row].name
            cell.detailTextLabel?.text = shoppingList.both[section][row].price.description
            return cell
        }
        cell.textLabel?.text = shoppingList.both[section][row].name
        cell.detailTextLabel?.text = shoppingList.both[section][row].price.description
        

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
