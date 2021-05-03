//
//  Colorable.swift
//  ColorSlider
//
//  Created by Angela Garrovillas on 8/20/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit
protocol Colors {
    var red: CGFloat {get}
    var green: CGFloat {get}
    var blue: CGFloat {get}
    func sliderDidChange()
}
