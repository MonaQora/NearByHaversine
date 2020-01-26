//
//  HavCustomerDataModel.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/27/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import Foundation

struct Customer: Codable {
    let latitude: String
    let userID: Int
    let name: String
    let longitude: String
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case userID = "user_id"
        case name = "name"
        case longitude = "longitude"
    }
}
