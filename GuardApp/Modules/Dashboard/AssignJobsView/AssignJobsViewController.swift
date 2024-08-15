//
//  AssignJobsViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 15/08/2024.
//

import UIKit
import Combine

class AssignJobsViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: AssignJobsViewModel!
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
        self.setUpTableViewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}

extension AssignJobsViewController {
    private func setUpTableViewData() {
        var cellModels: [TableCellModel] = []
        let jobs = [
            JobsTableViewCellItem(jobTitle: "Event Security Guard", jobLocation: "Downtown Office Building", hideIcons: true, hideCheckInButton: true, hideTimingStack: false),
            JobsTableViewCellItem(jobTitle: "Warehouse Security Guard", jobLocation: "Lakeside Residential Complex", hideIcons: true, hideCheckInButton: false, hideTimingStack: false),
            JobsTableViewCellItem(jobTitle: "Construction Site Guard", jobLocation: "Riverside Corporate Park, Riverside Corporate Park, Riverside Corporate Park, Riverside Corporate Park", hideIcons: false, hideCheckInButton: false, hideTimingStack: false)
        ]
        
        let models = jobs.map { JobsTableViewCellModel(data: $0) }
        cellModels.append(contentsOf: models)
        
        tableViewDelegate.cellModels = cellModels
        tableView.reloadData()
    }
}
