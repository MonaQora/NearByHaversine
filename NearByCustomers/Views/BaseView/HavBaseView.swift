//
//  HavBaseView.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

protocol BaseViewProtocol {
    func setupViewData()
    func setupErrorHandling(message: String)
    func setActivityIndicator(hidden: Bool)
    func navigateToListOfNearbyCustomersList(_ nearbyCustomers:[Customer]) 
}

class BaseViewController: UIViewController {
    var loadingIndicator = UIActivityIndicatorView()
    
    func setupErrorHandling(message: String) {
        self.setupAlertView(title: ErrorMessage.errorTitle, message: message, buttonTitle: ErrorMessage.closeButton)
    }
    
    func setActivityIndicator(hidden: Bool) {
        DispatchQueue.main.async {
            self.setupActivityIndicator(hidden: hidden)
        }
    }
    
    func setupAlertView(title: String, message: String, buttonTitle: String) {
            let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    func setupActivityIndicator(hidden: Bool) {
        if hidden {
            self.loadingIndicator.removeFromSuperview()
                self.loadingIndicator.stopAnimating()
        }
        else {
            let center = CGPoint(x: UIScreen.main.bounds.size.width/2.0, y: UIScreen.main.bounds.size.height/2.0)
            loadingIndicator.center = center
            loadingIndicator.autoresizingMask = (UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleRightMargin.rawValue) | UInt8(UIView.AutoresizingMask.flexibleLeftMargin.rawValue) | UInt8(UIView.AutoresizingMask.flexibleBottomMargin.rawValue) | UInt8(UIView.AutoresizingMask.flexibleTopMargin.rawValue))))
            view.addSubview(loadingIndicator)
                self.loadingIndicator.startAnimating()
        }
    }
}

extension BaseViewProtocol {
    func navigateToListOfNearbyCustomersList(_ nearbyCustomers:[Customer]) {
    }
}
