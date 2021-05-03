//
//  Layout.swift
//  BetterCodePractices
//
//  Created by Angela Garrovillas on 1/30/20.
//  Copyright © 2020 Olimpia. All rights reserved.
//

import UIKit

enum DeviceSize {
    case iPad
    case iPhone
}
struct Layout {
    func getDeviceType(device: DeviceSize, view: UIView) {
        switch device {
        case .iPad:
            view.backgroundColor = .gray
        case .iPhone:
            view.backgroundColor = . white
        }
    }
}
