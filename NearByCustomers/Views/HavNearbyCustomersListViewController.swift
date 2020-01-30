//
//  HavNearbyCustomersListViewController.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/29/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

class NearbyCustomersListViewController: BaseViewController {

    private var nearbyCustomersListViewPresenter: NearbyCustomersListPresenter!
    private var datasource: TableViewDataSource<CustomerDetailsCell, Customer>!
    private let cellIdentifier: String = "CustomerDetailsCell"
    var customersList = [Customer]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        nearbyCustomersListViewPresenter = NearbyCustomersListPresenter.init(view: self, model: NearbyCustomersListModel(customersList: customersList))
        self.title = ViewTitles.nearbyCustomersListViewTitle
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        setupTableViewDataSource()
    }
    
    func setupTableViewDataSource() {
        self.datasource = TableViewDataSource(cellIdentifier: self.cellIdentifier, viewPresnter: self.nearbyCustomersListViewPresenter) { cell, dataModel in
            cell.configure(dataModel)
        }
        self.tableView.dataSource = self.datasource
    }
}

extension NearbyCustomersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension NearbyCustomersListViewController: BaseViewProtocol {
    func setupViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

