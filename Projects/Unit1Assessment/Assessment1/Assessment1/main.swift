//
//  main.swift
//  Assessment1
//
//  Created by Angela Garrovillas on 7/25/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

//make a guard about ordering too much of an item

struct Cart {
    var items: [Item]
    // Add methods below as needed
    func printItemsInside() {
        for a in self.items {
            print(a)
        }
    }
}

struct Item {
    var name: String
    var price: Double
    
}

enum PaymentType: Int {
    case cash
    case credit
}

func priceCheck() -> Item {
    print("Enter the name of product: ")
    let input = readLine()
    var product = Item(name: "", price: 0.00)
    if let answer = input {
        product.name = answer
    }
    let randomPrice = Double.random(in: 1.0...10.0)
    product.price = round(randomPrice * 100 / 100)
    print("The price of \(product.name) is \(product.price)")
    return product
}

func printShoppingCart(cart: Cart) {
    print("~ ~ ~ ~ Shopping Cart ~ ~ ~ ~")
    cart.printItemsInside()
    print("~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~")
}

//func unlistedItem() -> Item? {
//    print("Did you want to buy an unlisted item? y or n: ")
//    let input = readLine()
//    if let answer = input {
//        if answer.lowercased() == "y" {
//            return priceCheck()
//        }
//    }
//    return nil
//}

func intoShoppingCart(int: Int) -> Item {
    var item = Item(name: "", price: 0.0)
    switch int {
    case 1:
        item = Item(name: "Apple", price: 1.05)
    case 2:
        item = Item(name: "Pear", price: 1.33)
    case 3:
        item = Item(name: "Corn", price: 0.20)
    case 4:
        item = Item(name: "Honey", price: 3.45)
    case 5:
        item = Item(name: "Pork", price: 4.99)
    case 6:
        item = Item(name: "Eggs", price: 2.99)
    case 7:
        item = Item(name: "Bread", price: 1.00)
    case 8:
        item = Item(name: "Butter", price: 1.50)
    default:
        print("Item is unavailable at this time sorry, try again")
    }
    return item
}

func multipleItems(howMany: Int, intOfItem: Int) -> [Item] {
    var arr: [Item] = []
    let item = intoShoppingCart(int: intOfItem)
    guard howMany >= 1 else {
        print("Not a valid amount")
        return arr
    }
    for _ in 1...howMany {
        arr.append(item)
    }
    return arr
}

func multipleItemsForUnlisted(howMany: Int, item: Item) -> [Item] {
    var arr: [Item] = []
    let thing = item
    guard howMany >= 1 else {
        print("Not a valid amount")
        return arr
    }
    for _ in 1...howMany {
        arr.append(thing)
    }
    return arr
}


func askHowmany() -> Int {
    print("How much do you want?")
    let input = getIntFromUser()
    return input
}

func cashOrCredit() -> PaymentType {
    print("Enter 0 if you are paying by Cash or 1 if you are paying by Credit\nNote that payments in cash gets a 4% discount: ")
    let input = readLine()
    var numNum = Int()
    if let unwrap = input,let num = Int(unwrap) {
        numNum = num
    }
    switch numNum {
    case 0:
        return PaymentType.cash
    case 1:
        return PaymentType.credit
    default:
        print("Invalid input")
        cashOrCredit()
    }
    return PaymentType.cash
}

func paying(cashOrCredit: PaymentType,currentCart: Cart) {
    switch cashOrCredit {
    case .cash:
        let total = findingTotal(cart: currentCart)
        let savings = round(findingSavings(totalCost: total) * 100 / 100)
        let actualPrice = round((total - savings) * 100 / 100)
        print("Your total comes out to $\(actualPrice) and you saved $\(savings)\nThank You For Shopping Here!")
    case .credit:
        let total = round(findingTotal(cart: currentCart) * 100 / 100)
        print("Your total comes out to $\(total)\nThank You For Shopping Here!")
    }
}

func findingTotal(cart: Cart) -> Double {
    var total = 0.00
    for a in cart.items {
        total += a.price
    }
    return total
//    cart.items.reduce(0.00, {(a:Double,b:Item) -> Double in
//        a + b.price
//    })
}
func findingSavings(totalCost: Double) -> Double {
    return totalCost * 0.04
}

func getIntFromUser() -> Int {
    print("Enter your number here: ", terminator: "")
    while true {
        let input = readLine()
        if let input = input,
            let userNum = Int(input) {
            return userNum
        }
    }
}

func printItemsAvailableAtStore() {
    print("""
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
""")
}

func welcomeToFarm() {
    let money = cashOrCredit()
    var shoppingCart = Cart(items: [])
    var ordering = true
    while ordering {
        printItemsAvailableAtStore()
        let input = getIntFromUser()
        guard input > 0 && input <= 9 || input == -1 else {
            print("invalid input")
            continue
        }
        if input == -1 {
            ordering = false
            continue
        }
        if input == 9 {
            let new = priceCheck()
            let amount = askHowmany()
            let basket = multipleItemsForUnlisted(howMany: amount, item: new)
            shoppingCart.items += basket
            printShoppingCart(cart: shoppingCart)
            //print(shoppingCart.items)
                continue
        }
        let amount = askHowmany()
        let chosen = multipleItems(howMany: amount, intOfItem: input)
        shoppingCart.items += chosen
        printShoppingCart(cart: shoppingCart)
        //print(shoppingCart.items)
    }
    guard shoppingCart.items.count > 0 else {
        print("You need at least one item in shopping cart to proceed to checkout")
        return welcomeToFarm()
    }
    
    paying(cashOrCredit: money, currentCart: shoppingCart)
}
welcomeToFarm()
