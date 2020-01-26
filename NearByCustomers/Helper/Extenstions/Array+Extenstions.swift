//
//  Array+Extenstions.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/27/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import Foundation

extension Array where Element == String {
    var string: String {
        let stringArray = self.map{ String($0) }
        return stringArray.joined(separator: ",")
    }
}
