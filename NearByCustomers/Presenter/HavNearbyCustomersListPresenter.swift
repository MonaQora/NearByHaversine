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
        if let _ = self.model{
            self.listDidLoad()
        }
        else {
            let error = ErrorResponse.custom(string: ErrorMessage.noDataMessage)
            self.listDidFailLoad(error: error)
        }
    }
}
