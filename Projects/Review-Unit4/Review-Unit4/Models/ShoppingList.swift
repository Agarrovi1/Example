//
//  ShoppingList.swift
//  Review-Unit4
//
//  Created by Angela Garrovillas on 10/23/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
var example = """
🌽🍐🍎Welcome to Pursuit Farms🍎🍐🌽
Here's what's available today:
1)Apple $1.05
2)Pear $1.33
3)Corn $0.20
4)Honey $3.45
5)Pork $4.99
6)Eggs $2.99
7)Bread $1.00
8)Butter $1.50
Enter the number of the item you want to buy. Type in 9 to enter in an unlisted item. If you want to proceed to purchase enter -1
🍖🥚🍞 ~ 🍯 ~ 🍞🥚🍖
"""
struct ShopItem {
    var name: String
    var price: Double
}

var defaultList = [ShopItem(name: "apple", price: 1.05),
                   ShopItem(name: "pear", price: 1.33),
                   ShopItem(name: "corn", price: 0.20),
                   ShopItem(name: "honey", price: 4.99),
                   ShopItem(name: "pork", price: 4.99),
                   ShopItem(name: "eggs", price: 2.99),
                   ShopItem(name: "bread", price: 1.00),
                   ShopItem(name: "butter", price: 1.50)]
