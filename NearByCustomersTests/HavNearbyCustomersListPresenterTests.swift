//
//  HavNearbyCustomersListPresenterTests.swift
//  NearByCustomersTests
//
//  Created by Mona Qora on 1/30/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import XCTest
@testable import NearByCustomers

class NearbyCustomersListPresenterTests: XCTestCase {

    private var presenter: NearbyCustomersListPresenter!
    private var view: NearbyCustomersListViewMock!
    private var model : NearbyCustomersListModelMock!
    
    override func setUp() {
        super.setUp()
        view = NearbyCustomersListViewMock()
        model = NearbyCustomersListModelMock()
        presenter = NearbyCustomersListPresenter(view: view, model: model)
    }

    override func tearDown() {
        super.tearDown()
        model = nil
        view = nil
        presenter = nil
    }
    
    func testPresenterLoadNearbyCustomersListSucess() {
        XCTAssertTrue(view.setupViewDataHasBeenCalled)
    }
    
    func testPresenterLoadNearbyCustomersListNilModelFailure() {
        model = nil
        presenter = NearbyCustomersListPresenter(view: view, model: model)
        XCTAssertTrue(view.setupErrorHandlingHasBeenCalled)
    }
    
    func testNumberOfRowsSuccess() {
        let num = presenter.numberOfRows(section: 0)
        XCTAssertEqual(num, 2)
    }
    
    func testModelAtSuccess() {
        let model:Customer = presenter.modelAt(index: 1)!
        XCTAssertEqual(model.userID, 2)
    }
}

class NearbyCustomersListModelMock: BaseListModelProtocol {
    var customersList = [Customer.init(latitude: "52.986375", userID: 0, name: "Mona Qora", longitude: "-6.043701"),  Customer.init(latitude: "53.038056", userID: 2, name: "Koka Qora", longitude: "-7.653889")]

    func fetchListInfo(completion: @escaping (AnyObject?, ErrorResponse?) -> Void) {
    }
    
    func numberOfRowsAt(section: Int) -> Int {
        return customersList.count
    }
    
    func modelAt<T>(index: Int) -> T? {
        let customer = self.customersList[index]
        return customer as? T
    }
}

class NearbyCustomersListViewMock: BaseViewController, BaseViewProtocol {
    
    private(set) var setupViewDataHasBeenCalled: Bool = false
    private(set) var setupErrorHandlingHasBeenCalled: Bool = false

    func setupViewData() {
        setupViewDataHasBeenCalled = true
    }
    
    override func setupErrorHandling(message: String)  {
        setupErrorHandlingHasBeenCalled = true
    }
}
