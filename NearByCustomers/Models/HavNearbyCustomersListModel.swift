//
//  HavNearbyCustomersListModel.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/29/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

class NearbyCustomersListModel {
    var customersList = [Customer]()
    
    init(customersList: [Customer]) {
        self.customersList = customersList
    }
}

extension NearbyCustomersListModel: BaseListModelProtocol {
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
