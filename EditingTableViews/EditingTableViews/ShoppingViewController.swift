import UIKit

class ShoppingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //var allItems = ShoppingItemFetchingClient.getShoppingItems()
    var shoppingItems = [ShoppingItem]()
    
    @IBAction func editButton(_ sender: UIButton) {
        if shoppingItemsTableView.isEditing {
            //set it so that its not editing
            shoppingItemsTableView.setEditing(false, animated: true)
            sender.setTitle("Edit", for: .normal)
        } else {
            //set it so that it is editing
            shoppingItemsTableView.setEditing(true, animated: true)
            sender.setTitle("Done", for: .normal)
        }
        
    }
    @IBOutlet weak var shoppingItemsTableView: UITableView!
    @IBAction func unwind(segue: UIStoryboardSegue) {
        //suppose the source is an AddItemViewController
        guard let sourceViewController = segue.source as? AddItemViewController else {return}
        guard let textFromName = sourceViewController.nameTextField.text else {return}
        guard let textFromPrice = sourceViewController.priceTextField.text else {return}
        guard let priceAsDouble = Double(textFromPrice) else {return}
        let newItem = ShoppingItem(name: textFromName, price: priceAsDouble)
        //Update Data/Model
        shoppingItems.append(newItem)
//        shoppingItemsTableView.reloadData()
        //shoppingList.count -> always be able to use this
        //update UI
        let lastIndex = shoppingItemsTableView.numberOfRows(inSection: 0)
        let lastIndexPath = IndexPath(row: lastIndex, section: 0)
        shoppingItemsTableView.insertRows(at: [lastIndexPath], with: .automatic)        
    }
    
//    @IBAction func unwindToShoppingList(_ unwindSegue: UIStoryboardSegue) {
//        //suppose the source is an AddItemViewController
//        guard let sourceViewController = unwindSegue.source as? AddItemViewController else {return}
//        guard let textFromName = sourceViewController.nameTextField.text else {return}
//        guard let textFromPrice = sourceViewController.priceTextField.text else {return}
//        guard let priceAsDouble = Double(textFromPrice) else {return}
//        let newItem = ShoppingItem(name: textFromName, price: priceAsDouble)
//        //shoppingList.count -> always be able to use this
//        //update UI
//        let lastIndex = shoppingItemsTableView.numberOfRows(inSection: 0)
//        let lastIndexPath = IndexPath(row: lastIndex, section: 0)
//        shoppingItemsTableView.insertRows(at: [lastIndexPath], with: .automatic)
//        //Update Data/Model
//        shoppingItems.append(newItem)
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne") else {
            return UITableViewCell()
        }
        let item = shoppingItems[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            shoppingItems.remove(at: indexPath.row)
            shoppingItemsTableView.deleteRows(at: [indexPath], with: .fade)
            print("we hit delete")
        default:
            print("we did something")
        }
    }
    
    private func loadShoppingItems() {
        let allItems = ShoppingItemFetchingClient.getShoppingItems()
        shoppingItems = allItems
    }
    
    private func configureShoppingItemsTableView() {
        shoppingItemsTableView.dataSource = self
        shoppingItemsTableView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureShoppingItemsTableView()
        loadShoppingItems()
        shoppingItemsTableView.isEditing = false

    }
}

