//
//  ElementsTests.swift
//  ElementsTests
//
//  Created by Angela Garrovillas on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest

class ElementsTests: XCTestCase {

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
    func testNetworkHelper() {
        let urlString = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        guard let url = URL(string: urlString) else {
            XCTAssertTrue(false, "bad url")
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: HTTPMethod.get) { (result) in
            switch result {
            case .failure(let error):
                XCTAssertTrue(false, "expecting no error got \(error)")
            case.success(let data):
                XCTAssertTrue(!data.isEmpty, "expected data got \(data)")
            }
        }
    }
    func testGetElements() {
        let urlString = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        guard let url = URL(string: urlString) else {
            XCTAssertTrue(false, "bad url")
            return
        }
        ChemicalElement.getElements(url: url) { (result) in
            switch result {
            case .failure(let error):
                XCTAssertTrue(false, "expecting success got \(error)")
            case .success(let elements):
                XCTAssertTrue(!elements.isEmpty, "expected elements got \(elements)")
                XCTAssertTrue(elements.count >= 100, "expected at least 100 elements got \(elements.count)")
            }
        }
    }
    func testElementInfo() {
        let urlString = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        guard let url = URL(string: urlString) else {
            XCTAssertTrue(false, "bad url")
            return
        }
        let hydrogen = ChemicalElement(name: "Hydrogen", number: 1, atomicMass: 1.008, melt: 13.99, boil: 20.271, discoveredBy: "Henry Cavendish", symbol: "H")
        ChemicalElement.getElements(url: url) { (result) in
            switch result {
            case .failure(let error):
                XCTAssertTrue(false, "expecting success got \(error)")
            case .success(let elements):
                let hydrogenTest = elements[0]
                XCTAssertTrue(hydrogen.name == hydrogenTest.name)
                XCTAssertTrue(hydrogen.atomicMass == hydrogenTest.atomicMass)
                XCTAssertTrue(hydrogen.melt == hydrogenTest.melt)
                XCTAssertTrue(hydrogen.boil == hydrogenTest.boil)
                XCTAssertTrue(hydrogen.discoveredBy == hydrogenTest.discoveredBy)
                XCTAssertTrue(hydrogen.symbol == hydrogenTest.symbol)
            }
        }
    }

}
