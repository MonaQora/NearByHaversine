//
//  NearbyCustomersListModelTests.swift
//  NearByCustomersTests
//
//  Created by Mona Qora on 1/30/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import XCTest
@testable import NearByCustomers

class NearbyCustomersListModelTests: XCTestCase {
    private var nearbyCustomersListModel: NearbyCustomersListModel?

    override func setUp() {
        let nearbyList = [Customer.init(latitude: "52.986375", userID: 0, name: "Mona Qora", longitude: "-6.043701"),  Customer.init(latitude: "53.038056", userID: 2, name: "Koka Qora", longitude: "-7.653889")]
        nearbyCustomersListModel = NearbyCustomersListModel.init(customersList: nearbyList)
    }

    override func tearDown() {
        nearbyCustomersListModel = nil
    }

    func testNumberOfRowsReturnRightCount () {
        XCTAssertEqual(nearbyCustomersListModel?.numberOfRowsAt(section: 0), 2)
    }
    
    func testModelAtReturnRightModel() {
        let customerRow1: Customer = (nearbyCustomersListModel?.modelAt(index: 1))!
        XCTAssertNotNil(customerRow1)
        XCTAssertEqual(customerRow1.userID, 2)
    }
}
