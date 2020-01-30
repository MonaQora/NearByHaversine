//
//  HavCustomersListModel.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import Foundation

class CustomersListModel {
    var service: ListOfCustomersServiceProtocol?
    private var customersList = [Customer]()
    
    init() {
        service = ListOfCustomersService()
    }
}

extension CustomersListModel: BaseListModelProtocol {
    
    func fetchListInfo(completion: @escaping (AnyObject?, ErrorResponse?) -> Void) {
        service?.loadListOfCustomers {[weak self] list, error in
            if let list = list {
                self?.customersList = list
            }
            completion(list as AnyObject?, error)
        }
    }
    
    func numberOfRowsAt(section: Int) -> Int {
        return customersList.count
    }
    
    func modelAt<T>(index: Int) -> T? {
        let customer = self.customersList[index]
        return customer as? T
    }
    
    func findNearByCustomers(completion: @escaping ([Customer]?, ErrorResponse?) -> Void) {
        var customersNearByList = [Customer]()
        for customer in customersList {
            let customerLat = Double(customer.latitude)
            let customerLon = Double(customer.longitude)
            if let lat = customerLat, let lon = customerLon {
                let distance = HavarsineDistance.calculateDistanceBetweenTwoLocation(fLocationLat: lat, fLocationLon: lon, sLocationLat:Earth.officeLat, sLocationLon: Earth.officeLon)
                if distance <= 100 {
                    customersNearByList.append(customer)
                }
            }
        }
        if customersNearByList.count > 0 {
            let sortedList = customersNearByList.sorted {
                $0.userID < $1.userID
            }
            completion(sortedList, nil)
        }
        else {
            completion(nil, ErrorResponse.custom(string: ErrorMessage.noNearCustomers))
        }
    }
}
