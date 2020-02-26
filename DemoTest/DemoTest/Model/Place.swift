//
//  Place.swift
//  DemoTest
//
//  Created by Bhaskar NS3 on 24/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import Foundation

struct Place {
    var name: String?
    var address: String?
    var rating: Double?
    var openStatus: Bool?
    
    init(attributes: [String: Any]) {
        self.address = attributes["vicinity"] as? String
        self.name = attributes["name"] as? String
        self.rating = attributes["rating"] as? Double
        if let openingHours = attributes["opening_hours"] as? [String: Any] {
            self.openStatus = openingHours["open_now"] as? Bool
        }
    }
}
