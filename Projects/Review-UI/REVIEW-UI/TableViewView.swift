//
//  TableViewView.swift
//  REVIEW-UI
//
//  Created by Angela Garrovillas on 10/10/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import UIKit

class TableViewView: UIView {

    lazy var tableView: UITableView = {
        let foodTable = UITableView()
        //register a cell
        foodTable.frame = bounds //* need this to get it to show
        foodTable.register(RecipeTableViewCell.self, forCellReuseIdentifier: "recipeCell")
        return foodTable
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        viewSetup()
    }
    private func viewSetup() {
        addSubview(tableView)
    }
}
