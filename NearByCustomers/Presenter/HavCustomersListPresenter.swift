//
//  HavCustomersListPresenter.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

class CustomersListPresenter: BaseListViewPresnter {
    override init(view: BaseViewProtocol?, model: BaseListModelProtocol?) {
        super.init(view: view, model: model)
        self.fetchListOfCustomersList()
    }
    
    func fetchListOfCustomersList()  {
        view?.setActivityIndicator(hidden: false)
        if let model = self.model {
            model.fetchListInfo() {[weak self] listCustomers, error in
                if listCustomers != nil {
                    self?.listDidLoad()
                }
                else {
                    self?.listDidFailLoad(error: error!)
                }
            }
        }
        else {
            let error = ErrorResponse.custom(string: ErrorMessage.noDataMessage)
            self.listDidFailLoad(error: error)
        }
    }
    
    func findNearbyCustomersList() {
        if let model = self.model {
            view?.setActivityIndicator(hidden: false)
            model.findNearByCustomers {[weak self] listNearby, error in
                if let listNearby = listNearby {
                    self?.view?.setActivityIndicator(hidden: true)
                    self?.view?.navigateToListOfNearbyCustomersList(listNearby)
                }
                else {
                    self?.listDidFailLoad(error: error!)
                }
            }
        }
    }
}
