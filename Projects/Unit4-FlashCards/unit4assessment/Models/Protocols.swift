//
//  Protocols.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
protocol AlertDelegate {
    func showAlert(tag: Int)
    func showAlreadyHaveAlert(tag: Int)
}

protocol ActionSheetDelegate {
    func showActionSheet(tag: Int)
}
