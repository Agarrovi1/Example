//
//  REVIEW_UITests.swift
//  REVIEW-UITests
//
//  Created by Olimpia on 10/10/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import XCTest
@testable import REVIEW_UI

class REVIEW_UITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testGetSampleData() {
        guard let pathData = Bundle.main.path(forResource: "recipe", ofType: "json") else {
            XCTAssertTrue(false, "could not get pathToData")
            return
        }
        let internalURL = URL(fileURLWithPath: pathData)
        do {
            let data = try Data(contentsOf: internalURL)
            XCTAssertTrue(!data.isEmpty, "was expecting data but got \(data)")
        } catch {
            XCTAssertTrue(false, "Got error: \(error)")
        }
    }
    func testGetRecipes() {
        guard let pathData = Bundle.main.path(forResource: "recipe", ofType: "json") else {
            XCTAssertTrue(false, "could not get pathToData")
            return
        }
        let internalURL = URL(fileURLWithPath: pathData)
        do {
            let data = try Data(contentsOf: internalURL)
            let recipes = DetailedData.getRecipies(from: data)
            XCTAssertTrue(recipes.count > 0, "expecting recipes but got \(recipes.count)")
            
        } catch {
            XCTAssertTrue(false, "Got error: \(error)")
        }
    }

}
