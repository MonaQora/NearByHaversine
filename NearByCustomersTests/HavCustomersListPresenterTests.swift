//
//  HavCustomersListPresenterTests.swift
//  NearByCustomersTests
//
//  Created by Mona Qora on 1/29/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import XCTest
@testable import NearByCustomers

class CustomersListPresenterTests: XCTestCase {

    private var presenter: CustomersListPresenter!
    private var view: CustomersListViewMock!
    private var model : CustomersListModelMock!
    
    override func setUp() {
        super.setUp()
        view = CustomersListViewMock()
        model = CustomersListModelMock()
        presenter = CustomersListPresenter(view: view, model: model)
    }

    override func tearDown() {
        super.tearDown()
        model = nil
        view = nil
        presenter = nil
    }

    func testPresenterLoadCustomersListSucess() {
        presenter.fetchListOfCustomersList()
        XCTAssertTrue(view.setupViewDataHasBeenCalled)
    }
    
    func testPresenterSetupErrorHandlingSucess() {
        model.successLoad = false
        presenter.fetchListOfCustomersList()
        XCTAssertTrue(view.setupErrorHandlingHasBeenCalled)
    }
    
    func testPresenterLoadCustomersListNilModelFailure() {
        model = nil
        presenter = CustomersListPresenter(view: view, model: model)
        presenter.fetchListOfCustomersList()
        XCTAssertTrue(view.setupErrorHandlingHasBeenCalled)
    }
    
    func testPresenterLoadNearbyCustomersListSucess() {
        presenter.findNearbyCustomersList()
        XCTAssertTrue(view.navigateToListOfNearbyCustomersListHasBeenCalled)
    }
    
    func testNumberOfRowsSuccess() {
        let num = presenter.numberOfRows(section: 0)
        XCTAssertEqual(num, 4)
    }
    
    func testModelAtSuccess() {
        let model:Customer = presenter.modelAt(index: 2)!
        XCTAssertEqual(model.userID, 2)
    }
}

class CustomersListModelMock: BaseListModelProtocol {
    var successLoad = true
    var successLoadNearby = true
    private var customersList: [Customer]?
    private let errorMessage = "Somthing went wrong"

    func fetchListInfo(completion: @escaping (AnyObject?, ErrorResponse?) -> Void) {
        if successLoad {
            customersList = [Customer.init(latitude: "52.986375", userID: 0, name: "Mona Qora", longitude: "-6.043701"), Customer.init(latitude: "52.3191841", userID: 1, name: "Menna Gilldan", longitude: "-8.5072391"), Customer.init(latitude: "53.038056", userID: 2, name: "Koka Qora", longitude: "-7.653889"), Customer.init(latitude: "52.2559432", userID: 3, name: "Aya Gilldan", longitude: "-7.1048927")]
            completion(customersList as AnyObject?, nil)
        }
        else {
            completion(nil, ErrorResponse.custom(string: errorMessage))
        }
    }
    
    func numberOfRowsAt(section: Int) -> Int {
        return customersList?.count ?? 0
    }
    
    func modelAt<T>(index: Int) -> T? {
        let customer = self.customersList?[index]
        return customer as? T
    }
    
    func findNearByCustomers(completion: @escaping ([Customer]?, ErrorResponse?) -> Void) {
        if successLoadNearby {
            let nearbyList = [Customer.init(latitude: "52.986375", userID: 0, name: "Mona Qora", longitude: "-6.043701"),  Customer.init(latitude: "53.038056", userID: 2, name: "Koka Qora", longitude: "-7.653889")]
            completion(nearbyList, nil)
        }
        else {
            completion(nil, ErrorResponse.custom(string: errorMessage))
        }
    }
}

class CustomersListViewMock: BaseViewProtocol {
    
    private(set) var setupViewDataHasBeenCalled: Bool = false
    private(set) var setupErrorHandlingHasBeenCalled: Bool = false
    private(set) var navigateToListOfNearbyCustomersListHasBeenCalled: Bool = false

    func setupViewData() {
        setupViewDataHasBeenCalled = true
    }
    
    func setActivityIndicator(hidden: Bool) {
    }
    
    func setupErrorHandling(message: String)  {
        setupErrorHandlingHasBeenCalled = true
    }
    
    func navigateToListOfNearbyCustomersList(_ nearbyCustomers: [Customer]) {
        navigateToListOfNearbyCustomersListHasBeenCalled = true
    }
}
