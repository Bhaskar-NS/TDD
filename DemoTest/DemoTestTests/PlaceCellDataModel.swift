//
//  PlaceCellDataModel.swift
//  DemoTestTests
//
//  Created by Bhaskar NS3 on 25/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import XCTest
@testable import DemoTest

class PlaceCellDataModelTests: XCTestCase {
    
    var sut: PlaceCellDataModel!
    var place: Place!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let attributes: [String: Any] = ["name": "CCD", "vicinity": "Jantha Bazar", "rating": 4.8, "opening_hours": ["open_now": false]]
        place = Place(attributes: attributes)
        sut = PlaceCellDataModel(place: place)
        
    }
    
    func testAttributes() {
        //checking nil in attributes
        XCTAssertNotNil(sut.name, "name is nil in PlaceCellDataModel")
        XCTAssertNotNil(sut.address, "address is nil in PlaceCellDataModel")
        XCTAssertNotNil(sut.rating, "rating is nil in PlaceCellDataModel")
        XCTAssertNotNil(sut.openStatusText, "openingHours is nil in PlaceCellDataModel")
        
        //check whether attributes have desired values
        
        XCTAssertEqual(sut.name, place.name)
        XCTAssertEqual(sut.address, place.address)
        XCTAssertEqual(sut.rating, place.rating?.description)
        
        guard let isOpen = place.openStatus else {
            XCTFail("openingHours is nil in PlaceCellDataModel")
            return
        }
        
        let openStatusText = isOpen ? "We are open. Hop in now!!" : "Sorry we are closed."
        XCTAssertEqual(sut.openStatusText, openStatusText)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        place = nil
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

}
