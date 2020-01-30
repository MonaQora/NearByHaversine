//
//  HavCustomersListViewController.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

class CustomersListViewController: BaseViewController {

    private var customersListViewPresenter: CustomersListPresenter!
    private var datasource: TableViewDataSource<CustomerDetailsCell, Customer>!
    private let cellIdentifier: String = "CustomerDetailsCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var findNearbyCustomers: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findNearbyCustomers.isEnabled = false
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        customersListViewPresenter = CustomersListPresenter.init(view: self, model: CustomersListModel())
        self.title = ViewTitles.customersListViewTitle
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        setupTableViewDataSource()
    }
    
    func setupTableViewDataSource() {
        self.datasource = TableViewDataSource(cellIdentifier: self.cellIdentifier, viewPresnter: self.customersListViewPresenter) { cell, dataModel in
            cell.configure(dataModel)
        }
        self.tableView.dataSource = self.datasource
    }
    
    @IBAction func findNearbyCustomers(_ sender: Any) {
        customersListViewPresenter.findNearbyCustomersList()
    }
    
}

extension CustomersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension CustomersListViewController: BaseViewProtocol {
    func setupViewData() {
        DispatchQueue.main.async {
            self.findNearbyCustomers.isEnabled = true
            self.tableView.reloadData()
        }
    }
    
    func navigateToListOfNearbyCustomersList(_ nearbyCustomers:[Customer]) {
        let nearbyCustomerVC = storyboard!.instantiateViewController(withIdentifier: "NearbyCustomersList") as! NearbyCustomersListViewController
        nearbyCustomerVC.customersList = nearbyCustomers
        self.navigationController?.pushViewController(nearbyCustomerVC, animated: true)
    }
}
