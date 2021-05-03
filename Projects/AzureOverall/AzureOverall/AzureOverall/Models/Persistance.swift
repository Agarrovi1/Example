//
//  Persistance.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation

private let fileName = "UserCartInfo.plist"

private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

private func filePathFromDocumentsDirectory(name: String) -> URL {
    return documentsDirectory.appendingPathComponent(name)
}

private var url: URL {
    return filePathFromDocumentsDirectory(name: fileName)
}

//MARK: FileManager Persistance Func
func getCartInfo() throws -> CartInfo {
    guard let data = FileManager.default.contents(atPath: url.path) else {
        return CartInfo(recipeIdToCount: [:])
    }
    return try PropertyListDecoder().decode(CartInfo.self, from: data)
}

private func replace(cartInfo: CartInfo) throws {
  let serializedData = try PropertyListEncoder().encode(cartInfo)
  try serializedData.write(to: url, options: Data.WritingOptions.atomic)
}

func save(recipeId: Int, recipeCount: Int) throws {
    var cart = try getCartInfo()
    if recipeCount == 0 {
        cart.recipeIdToCount[recipeId] = nil
        print(cart.recipeIdToCount)
    }
    cart.recipeIdToCount[recipeId] = recipeCount
    try replace(cartInfo: cart)
}

