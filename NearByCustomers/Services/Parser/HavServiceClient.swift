//
//  HavServiceClient.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/27/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

struct ResourceList<T> {
    let urlString: String
    let parse: (Data) -> [T]?
}

class ServiceClient: NSObject {
    func load<T>(resource: ResourceList<T>, completion: @escaping ((Response<[T], ErrorResponse>) -> Void)) {
        var url:URL?
        if resource.urlString.isEmpty || (URL(string: resource.urlString) == nil){
            completion(Response.failure(ErrorResponse.custom(string: ErrorMessage.wrongURLMessage)))
            return
        }
        else {
             url = URL(string: resource.urlString)!
             let sessionConfig = URLSessionConfiguration.default
             sessionConfig.timeoutIntervalForRequest = 30.0
            sessionConfig.timeoutIntervalForResource = 30.0
             let session = URLSession(configuration: sessionConfig)
            session.dataTask(with: url!) { data, response, error in
                if let error = error {
                    completion(Response.failure(ErrorResponse.native(string: error.localizedDescription)))
                }
                else if let data = data  {
                    if (resource.parse(data) != nil) {
                        let list = resource.parse(data)!
                        completion(Response.success(list))
                    }
                    else {
                        completion(Response.failure(ErrorResponse.custom(string: ErrorMessage.unidentifiedResponseMessage)))
                    }
                }
                else {
                    completion(Response.failure(ErrorResponse.custom(string: ErrorMessage.noDataMessage)))
                }
                
            }.resume()
        }
    }
}

