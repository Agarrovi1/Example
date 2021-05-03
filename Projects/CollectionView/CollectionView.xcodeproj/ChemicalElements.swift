//
//  ChemicalElements.swift
//  Elements
//
//  Created by Angela Garrovillas on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct ChemicalElement: Codable {
    let name: String
    let number: Int
    let atomicMass: Double
    let melt: Double?
    let boil: Double?
    let discoveredBy: String?
    let symbol: String
    
    private enum CodingKeys: String,CodingKey {
        case name
        case number
        case atomicMass = "atomic_mass"
        case melt
        case boil
        case discoveredBy = "discovered_by"
        case symbol
    }
    static func getElements(url: URL,completionHandler: @escaping (Result<[ChemicalElement],AppError>) -> ()) {
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: HTTPMethod.get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let dataFromUrl):
                do {
                    let elements = try JSONDecoder().decode([ChemicalElement].self, from: dataFromUrl)
                    completionHandler(.success(elements))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
