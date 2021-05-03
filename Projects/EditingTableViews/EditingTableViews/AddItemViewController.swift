//
//  AddItemViewController.swift
//  EditingTableViews
//
//  Created by Angela Garrovillas on 8/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    var price: String!
    var name:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
       priceTextField.delegate = self
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let textFromName = nameTextField.text else {return}
//        guard let textFromPrice = priceTextField.text else {return}
//        guard let priceAsDouble = Double(textFromPrice) else {return}
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
