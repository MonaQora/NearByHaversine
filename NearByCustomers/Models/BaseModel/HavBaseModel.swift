//
//  HavBaseModel.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

protocol BaseListModelProtocol {
    func fetchListInfo(completion: @escaping (AnyObject?, ErrorResponse?) -> Void)
    func numberOfRowsAt(section: Int) -> Int
    func modelAt<T>(index: Int) -> T?
    func findNearByCustomers(completion: @escaping ([Customer]?, ErrorResponse?) -> Void)
}

extension BaseListModelProtocol {
    func findNearByCustomers(completion: @escaping ([Customer]?, ErrorResponse?) -> Void) {
    }
}
