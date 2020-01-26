//
//  HavServiceReponse.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/27/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import Foundation

enum Response<T, E: Error> {
    case success(T)
    case failure(E)
}

enum ErrorResponse: Error {
    case custom(string: String)
    case native(string: String)
}
