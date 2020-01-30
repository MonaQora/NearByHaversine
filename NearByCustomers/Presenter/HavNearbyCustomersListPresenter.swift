//
//  HavNearbyCustomersListPresenter.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/29/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

class NearbyCustomersListPresenter: BaseListViewPresnter {

    override init(view: BaseViewProtocol?, model: BaseListModelProtocol?) {
        super.init(view: view, model: model)
        self.fetchListOfNearbyCustomersList()
    }
    
    func fetchListOfNearbyCustomersList()  {
        if let model = self.model{
            model.fetchListInfo(){[weak self] listCustomers, error in
                if listCustomers != nil {
                    self?.listDidLoad()
                }
                else {
                    self?.listDidFailLoad(error: error!)
                }
            }
        }
        else {
            let error = ErrorResponse.custom(string: ErrorMessage.noNearCustomers)
            self.listDidFailLoad(error: error)
        }
    }
}
