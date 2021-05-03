//
//  PodcastsTests.swift
//  PodcastsTests
//
//  Created by Angela Garrovillas on 9/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import XCTest
@testable import Podcasts

class PodcastsTests: XCTestCase {

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
    func testgetPodcast() {
        guard let url = URL(string: "https://itunes.apple.com/search?media=podcast&limit=200&term=night") else {
            XCTAssertTrue(false, "could not make url")
            return
        }
        PodcastWrapper.getPodcasts(url: url) { (result) in
            switch result {
            case .failure(let _):
                XCTAssertTrue(false, "result is failure")
            case .success(let podcasts):
                XCTAssertTrue(true, "")
                XCTAssertTrue(podcasts.count > 10, "expected podcasts but got \(podcasts.count)")
            }
        }
    }

}
