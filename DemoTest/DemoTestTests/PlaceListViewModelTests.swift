//
//  PlaceListViewModelTests.swift
//  DemoTestTests
//
//  Created by Bhaskar NS3 on 25/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import XCTest
@testable import DemoTest

class PlaceListViewModelTests: XCTestCase {
    
    var sut: PlaceListViewModel!
    var mockPlaceDataFetcher: MockPlaceDataFetcher!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PlaceListViewModel(dataFetcher: MockPlaceDataFetcher())
        mockPlaceDataFetcher = MockPlaceDataFetcher()
        sut.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockPlaceDataFetcher = nil
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
    
    func testOutputAttributes() {
        let tableModel = tableDataModel()
        XCTAssertEqual(sut.title, "Place List")
        XCTAssertEqual(sut.numberOfRows, tableModel.count)
    }
    
    func testTableDataModelForIndexpath() {
        let indexpath = IndexPath(row: 0, section: 0)
        XCTAssertEqual(mockPlaceDataFetcher.tableDataModel[0], sut.tableCellDataModelForIndexPath(indexpath))
    }
    
    func tableDataModel() -> [PlaceCellDataModel] {
        var dataModel = [PlaceCellDataModel]()
        for place in mockPlaceDataFetcher.places {
            dataModel.append(PlaceCellDataModel(place: place))
        }
        return dataModel
    }

}

class MockPlaceDataFetcher: PlaceDataFetcherProtocol {
    var places = [Place]()
    var tableDataModel = [PlaceCellDataModel]()
    
    init() {
        let place1 = Place(attributes: ["name": "CCD", "vicinity": "Jantha Bazar", "rating": 4.8, "opening_hours": ["open_now": false]])
        places.append(place1)
        tableDataModel.append(PlaceCellDataModel(place: place1))
        let place2 = Place(attributes: ["name": "Cafe Mondo", "vicinity": "Jaynagar", "rating": 4.5, "opening_hours": ["open_now": true]])
        places.append(place2)
        tableDataModel.append(PlaceCellDataModel(place: place2))
    }
    
    func fetchPlaces(completion: ([Place]?, _ errorMessage: String?) ->()) {
        completion(places, nil)
    }
    
}

