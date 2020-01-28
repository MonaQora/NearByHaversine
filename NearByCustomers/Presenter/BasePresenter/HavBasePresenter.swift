//
//  HavBasePresenter.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

protocol BaseListPresenterProtocol {
    func numberOfRows(section: Int) -> Int?
    func modelAt<T>(index: Int) -> T?
    func findNearbyCustomersList()
}

class BasePresenter {
    var view : BaseViewProtocol?
    var model: BaseListModelProtocol?

    public init(view: BaseViewProtocol?, model: BaseListModelProtocol?) {
        self.view = view
        self.model = model
    }
}

class BaseListViewPresnter: BasePresenter, BaseListPresenterProtocol {
    func listDidLoad() {
        view?.setupViewData()
        view?.setActivityIndicator(hidden: true)
    }
    
    func listDidFailLoad(error: ErrorResponse) {
        let message: String
        switch error {
        case let .custom (string):
            message = string
        default:
            message = error.localizedDescription
        }
        view?.setupErrorHandling(message: message)
        view?.setActivityIndicator(hidden: true)
    }
    
    func numberOfRows(section: Int) -> Int? {
        return (model?.numberOfRowsAt(section: section))
    }
    
   func modelAt<T>(index: Int) -> T? {
        return (model?.modelAt(index: index))
    }

}

extension BaseListPresenterProtocol {
    func findNearbyCustomersList() {
    }
}
