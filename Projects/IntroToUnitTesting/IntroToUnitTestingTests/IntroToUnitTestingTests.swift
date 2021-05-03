//
//  IntroToUnitTestingTests.swift
//  IntroToUnitTestingTests
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import XCTest
@testable import IntroToUnitTesting

class IntroToUnitTestingTests: XCTestCase {

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
    //Test 1 - check that there's a (one) blob
    func testLoadWeather() {
        //test what i am loading is weather, that we got a blob
        let data = getWeatherDataFromJSON()
        let weather = WeatherWrapper.getWeather(from: data)
        //XCTAssertTrue(false, "there is no object")//makes the test fail (since not true) and prints out message
        XCTAssertTrue(weather.message != nil, "There was no object")
    }
    private func getWeatherDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "sampleData", ofType: "json") else {return Data()}
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("\(jsonError)")
            
        }
    }
    
    //test 2 - check that there are three things in the blob in the property "list"
    func testListHasThreeItems() {
        let data = getWeatherDataFromJSON()
        let weather = WeatherWrapper.getWeather(from: data)
        XCTAssertTrue(weather.list.count == 3, "weather.list.count doesn't have 3 elements, it has \(weather.list.count) elements")
        
    }

}
