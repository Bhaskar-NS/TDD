//
//  PlaceListViewModel.swift
//  DemoTest
//
//  Created by Bhaskar NS3 on 25/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import Foundation


protocol PlaceDataFetcherProtocol {
    func fetchPlaces(completion: ([Place]?, _ errorMessage: String?) ->())
}


class PlaceListViewModel {
    
    var dataFetcher: PlaceDataFetcherProtocol!
    
    //Mark: - output
    var title = ""
    var numberOfRows = 0
    var displayError: (String)->() = {_ in}
    
    //Mark: - input
    var viewDidLoad: () -> () = { }
    
    private var tableDataSource = [PlaceCellDataModel]()
    private var dataModel: [Place]! {
        didSet {
            configureTableDataSource()
            configureOutput()
        }
    }
    
    init(dataFetcher: PlaceDataFetcherProtocol) {
        self.dataFetcher = dataFetcher
        viewDidLoad = { [weak self] in
            self?.getPlacesData()
        }
    }
    
    func getPlacesData() {
        dataFetcher.fetchPlaces { [weak self] (placeList, error) in
            guard let places = placeList  else {
                displayError(error ?? "")
                return
            }
            self?.dataModel = places
        }
    }
    
    private func configureTableDataSource() {
        for place in dataModel {
            tableDataSource.append(PlaceCellDataModel(place: place))
        }
    }
    
    private func configureOutput() {
        title = "Place List"
        numberOfRows = tableDataSource.count
    }
    
    func tableCellDataModelForIndexPath(_ indexpath: IndexPath) -> PlaceCellDataModel {
        return tableDataSource[indexpath.row]
    }
    
}
