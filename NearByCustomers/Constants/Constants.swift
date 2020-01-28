//
//  Constants.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/27/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import Foundation

struct ErrorMessage {
    static let wrongURLMessage = "Wrong url format"
    static let unidentifiedResponseMessage = "Unidentified response"
    static let noDataMessage = "Somthing went wrong, No data fetched"
    static let defaultErroeMessage = "Somthing went wrong"
    static let noNearCustomers = "No customers are nearby your office"
    static let errorTitle = "Error"
    static let closeButton = "Close"
}

struct URLString {
    static let listOfCustomers = "https://s3.amazonaws.com/intercom-take-home-test/customers.txt"
}

struct Earth {
    static let radius = 6356.752
    static let officeLat = 53.339428
    static let officeLon = -6.257664
}

struct ViewTitles {
    static let customersListViewTitle = "Customers List"
}
