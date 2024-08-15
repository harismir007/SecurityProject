//
//  SOSViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 04/08/2024.
//

import UIKit
import Combine

class SOSViewController: UIViewController  {
    
    //MARK: - Properties
    var viewModel: SOSViewModel!
    var tableViewDelegate: TableViewDelegate!
    private var subscribers: Set<AnyCancellable> = []

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableViewDelegate = TableViewDelegate(tableView: tableView)
            tableView.dataSource = tableViewDelegate
            tableView.delegate = tableViewDelegate
        }
    }
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        self.setUpTableViewData()
        
    }
}

extension SOSViewController {
    private func setUpTableViewData() {
        var cellModels: [TableCellModel] = []
        let jobs = [
            SOSTableViewCellItem(sosTitle: "Police", sosNumber: "911"),
            SOSTableViewCellItem(sosTitle: "Rescue", sosNumber: "1122"),
            SOSTableViewCellItem(sosTitle: "Ambulance", sosNumber: "111111"),
            SOSTableViewCellItem(sosTitle: "Gov", sosNumber: "999999"),
            SOSTableViewCellItem(sosTitle: "Home", sosNumber: "0290202002")
            
        ]
        
        let models = jobs.map { SOSTableViewCellModel(data: $0) }
        cellModels.append(contentsOf: models)
        
        tableViewDelegate.cellModels = cellModels
        tableView.reloadData()
    }
}
