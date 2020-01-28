//
//  HavCustomersListModelTests.swift
//  NearByCustomersTests
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import XCTest
@testable import NearByCustomers

class HavCustomersListModelTests: XCTestCase {
    private var customersListModel: CustomersListModel?
    private var service: ListOfCustomersServiceMock!

    override func setUp() {
        service = ListOfCustomersServiceMock()
        customersListModel = CustomersListModel()
        customersListModel?.service = service
    }

    override func tearDown() {
        customersListModel = nil
        service = nil
    }
    
    func testFetchListInfoSuccess() {
        let expectation = XCTestExpectation(description: "Sucess fetch list of customer")
        var customersListResponse:[Customer]?
        var errorResponse: ErrorResponse?
        customersListModel?.fetchListInfo {list, error in
            customersListResponse = list as? [Customer]
            errorResponse = error
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
        XCTAssertNil(errorResponse)
        XCTAssertNotNil(customersListResponse)
    }
    
    func testFetchListInfoReturnError() {
        let expectation = XCTestExpectation(description: "Failure fetch list of customer")
        var customersListResponse:[Customer]?
        var errorResponse: ErrorResponse?
        service.successLoad = false
        customersListModel?.fetchListInfo {list, error in
            customersListResponse = list as? [Customer]
            errorResponse = error
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
        XCTAssertNil(customersListResponse)
        XCTAssertNotNil(errorResponse)
        
        switch errorResponse {
        case let .custom (string):
            XCTAssertEqual(string, "Somthing went wrong")
        default:
            break
        }
    }
    
    func testNumberOfRowsReturnRightCount () {
        let expectation = XCTestExpectation(description: "Sucess return right number of customers")
        customersListModel?.fetchListInfo {_, _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
        XCTAssertEqual(customersListModel?.numberOfRowsAt(section: 0), 8)
    }
    
    func testmodelAtReturnRightModel() {
        let expectation = XCTestExpectation(description: "Sucess return right customer")
        customersListModel?.fetchListInfo {_, _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
        let customerRow4: Customer = (customersListModel?.modelAt(index: 4))!
        XCTAssertNotNil(customerRow4)
        XCTAssertEqual(customerRow4.userID, 4)
    }
    
    func testGetListOfNearByCustomerSuccess() {
        let expectation = XCTestExpectation(description: "Sucess load list of near by customers")
        var nearCustomersListResponse = [Customer]()
        customersListModel?.fetchListInfo { _, _ in
            self.customersListModel?.findNearByCustomers { nearByList in
                nearCustomersListResponse = nearByList!
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 20.0)
        XCTAssertEqual(nearCustomersListResponse.count, 4)
        XCTAssertEqual(nearCustomersListResponse[0].userID, 0)
        XCTAssertEqual(nearCustomersListResponse[1].userID, 2)
        XCTAssertEqual(nearCustomersListResponse[2].userID, 5)
        XCTAssertEqual(nearCustomersListResponse[3].userID, 7)
    }
}

class ListOfCustomersServiceMock: ListOfCustomersServiceProtocol {
    var customersList: [Customer] = [Customer.init(latitude: "52.986375", userID: 0, name: "Mona Qora", longitude: "-6.043701"), Customer.init(latitude: "52.3191841", userID: 1, name: "Menna Gilldan", longitude: "-8.5072391"), Customer.init(latitude: "53.038056", userID: 2, name: "Koka Qora", longitude: "-7.653889"), Customer.init(latitude: "52.2559432", userID: 3, name: "Aya Gilldan", longitude: "-7.1048927"), Customer.init(latitude: "52.366037", userID: 4, name: "Mariem Qora", longitude: "-8.179118"), Customer.init(latitude: "54.0894797", userID: 5, name: "Peter Aziz", longitude: "-6.18671"),Customer.init(latitude: "54.080556", userID: 6, name: "Lobna Qora", longitude: "-8.522366"), Customer.init(latitude: "53.1302756", userID: 7, name: "Abdelrahim Ahmed", longitude: "-6.2397222")]
    var successLoad = true
    let errorMessage = "Somthing went wrong"
    func loadListOfCustomers(completion: @escaping ([Customer]?, ErrorResponse?) -> ()) {
        if successLoad {
            completion(customersList, nil)
        }
        else {
            completion(nil, ErrorResponse.custom(string: errorMessage))
        }
    }
    
}
