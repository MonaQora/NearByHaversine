//
//  HavListOfCustomersService.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/27/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import Foundation

class ListOfCustomersService {
    func loadListOfCustomers(completion: @escaping ([Customer]?, ErrorResponse?) -> ()) {
        let url = URLString.listOfCustomers
        let customerResource = ResourceList<Customer>(urlString: url) { data in
            var customerArr = [Customer]()
            if let textFile = String(data: data, encoding: .utf8) {
                let customersArr = textFile.split{$0 == "\n"}.map(String.init)
                let customerJsonString = "[\(customersArr.string)]"
                let jsonData = customerJsonString.data(using: .utf8)!
                if let user: [Customer] = try? JSONDecoder().decode([Customer].self, from: jsonData) {
                    customerArr = user
                }
            }
            return customerArr
        }
        let service = ServiceClient()
        service.load(resource: customerResource){ result in
            switch result {
            case .success(let customersList) :
                completion(customersList, nil)
            case .failure(let error) :
                completion(nil, error)
            }
        }
    }
}
