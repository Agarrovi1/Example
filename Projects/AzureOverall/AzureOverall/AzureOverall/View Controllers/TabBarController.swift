//
//  TabBarController.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var navForBrowse = UINavigationController(rootViewController: BrowseScreenVC())
    var navForCart = UINavigationController(rootViewController: CartScreenVC())
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navForBrowse.tabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        navForCart.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 1)
        viewControllers = [navForBrowse,navForCart]
    }
    

    

}
