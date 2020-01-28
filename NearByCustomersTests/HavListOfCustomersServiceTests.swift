//
//  HavListOfCustomersServiceTests.swift
//  NearByCustomersTests
//
//  Created by Mona Qora on 1/27/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import XCTest
@testable import NearByCustomers

class HavListOfCustomersServiceTests: XCTestCase {
    var service: ListOfCustomersServiceProtocol!
    
    override func setUp() {
        super.setUp()
        service = ListOfCustomersService()
    }

    override func tearDown() {
        super.tearDown()
        service = nil
    }

    func testListOfCustomersService() {
        let expectation = XCTestExpectation(description: "Sucess excute customers list service")
        var customersListResponse:[Customer]?
        var errorResponse: ErrorResponse?
        service.loadListOfCustomers {data, error in
            errorResponse = error
            customersListResponse = data
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30.0)
        if errorResponse == nil {
            XCTAssertNotNil(customersListResponse)
        }
        if customersListResponse == nil {
            XCTAssertNotNil(errorResponse)
        }
    }

}

