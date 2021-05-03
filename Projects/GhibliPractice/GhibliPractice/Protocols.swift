//
//  Protocols.swift
//  GhibliPractice
//
//  Created by Angela Garrovillas on 10/4/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
protocol FilmCellDelegate: AnyObject {
    func showActionSheet(tag: Int)
}

protocol SettingsDelegate: AnyObject {
    //AnyObject will be able to conform
    func darkModeOn()
    func darkModeOff()
    
}
