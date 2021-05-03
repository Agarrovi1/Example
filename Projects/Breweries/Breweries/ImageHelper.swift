//
//  ImageHelper.swift
//  Breweries
//
//  Created by Angela Garrovillas on 9/5/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    private init() {}
    
    func fetchImage(urlString: String,completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        NetworkManager.shared.fetchData(urlStr: urlString) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                guard let image = UIImage(data: data) else {completionHandler(.failure(.badImageData))
                    return
                }
                completionHandler(.success(image))
            }
        }
    }
}
