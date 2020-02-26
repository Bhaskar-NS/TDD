//
//  PlaceTests.swift
//  DemoTestTests
//
//  Created by Bhaskar NS3 on 24/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import XCTest
@testable import DemoTest

class PlaceTests: XCTestCase {

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
    
    func testAttributes() {
        let attributes: [String: Any] = ["name": "CCD", "vicinity": "Jantha Bazar", "rating": 4.8, "opening_hours": ["open_now": false]]
        let place = Place(attributes: attributes)
        XCTAssertEqual(place.name, "CCD")
        XCTAssertEqual(place.address, "Jantha Bazar")
        XCTAssertEqual(place.rating,  4.8)
        XCTAssertEqual(place.openStatus, false)
        
    }

}
