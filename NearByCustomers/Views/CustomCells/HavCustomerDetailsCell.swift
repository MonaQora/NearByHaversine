//
//  HavCustomerDetailsCell.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

class CustomerDetailsCell: UITableViewCell, BaseTableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    func configure<T>(_ infoModel: T) {
        let customer = infoModel as! Customer
        self.userNameLabel.text = customer.name
        self.locationLabel.text = customer.customerLocation
    }
}
