//
//  File.swift
//  Aug12WarmUp
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

struct Animal: CustomStringConvertible,Imageable, EatOrNot {
    var eatOrNot: String {
        if !self.isOnLand {
            return "Sure why not?"
        }
        return "no"
    }
    
    var ImageName: String {
        return self.type.replacingOccurrences(of: " ", with: "")
    }
    
    func getImage() -> UIImage {
        if let unwrap = UIImage.init(named: ImageName) {
            return unwrap
        }
        return UIImage()
    }
    
    var description: String {
        if isOnLand {
        return "\(type) and i live on land"
        }
        return "\(type) and i don't live on land"
    }
        var type: String
        var isOnLand: Bool
    
}




