//
//  PlaceCellDataModel.swift
//  DemoTest
//
//  Created by Bhaskar NS3 on 25/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import Foundation

struct PlaceCellDataModel: Equatable {
    var name: String
    var address: String
    var rating: String
    var openStatusText: String
    
    init(place: Place) {
        name = place.name ?? ""
        address = place.address ?? ""
        rating = place.rating?.description ?? "0.0"
        name = place.name ?? ""
        guard let isOpen = place.openStatus else {
            openStatusText = "Sorry we are closed."
            return
        }
        openStatusText = isOpen ? "We are open. Hop in now!!" : "Sorry we are closed."
    }
}
