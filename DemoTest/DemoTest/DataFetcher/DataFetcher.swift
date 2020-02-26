//
//  DataFetcher.swift
//  DemoTest
//
//  Created by Bhaskar NS3 on 25/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import Foundation

class PlaceDataFetcher: PlaceDataFetcherProtocol {
    
    func fetchPlaces(completion: ([Place]?,_ errorMessage: String?)->()) {
        guard let path = Bundle.main.path(forResource: "PlacesList", ofType: "json") else {
            completion(nil, "There is a problem in fetching places for you.")
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            guard let jsonResult = json as? [String: Any] else {
                completion(nil, "There is a problem in fetching places for you.")
                return
            }
            guard let results = jsonResult["results"] as? [[String: Any]] else { return }
            completion(self.placesListFrom(results: results), nil)
            
        } catch {
            completion(nil, "There is a problem in fetching places for you.")
        }
    }
    
    private func placesListFrom(results: [[String: Any]]) -> [Place] {
        var places = [Place]()
        for place in results {
            places.append(Place(attributes: place))
        }
        return places
    }
    
}
