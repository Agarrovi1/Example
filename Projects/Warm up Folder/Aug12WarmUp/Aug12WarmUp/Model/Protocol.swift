//
//  File.swift
//  Aug12WarmUp
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

protocol Imageable {
    var ImageName: String { get }
    func getImage() -> UIImage
}
protocol EatOrNot {
    var eatOrNot: String { get }
}
