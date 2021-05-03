//
//  Countries.swift
//  ConcurrencyLab
//
//  Created by Angela Garrovillas on 9/3/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit


struct Country: Codable {
    let name: String
    let alpha2Code: String
    let capital: String
    let population: Int
    let currencies: [Currency]
    //let flag: String
    func getCurrency() -> String {
        return self.currencies[0].code
    }
    
    static func getCountries(from data: Data) -> [Country]? {
        do {
            let countries = try JSONDecoder().decode([Country].self, from: data)
            return countries
        } catch {
            print(error)
        }
        return nil
    }
    
    func getFlagPicture() -> UIImage? {
        guard let url = URL(string: "https://www.countryflags.io/\(self.alpha2Code.lowercased())/shiny/64.png") else {return nil}
        do {
        let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            return image
        } catch {
            print(error)
        }
        return nil
    }
    
    struct Currency: Codable {
        var code: String
    }
}

func filter(countries: [Country], str: String) -> [Country] {

    return countries.filter({$0.name.lowercased().contains(str.lowercased())})

}
