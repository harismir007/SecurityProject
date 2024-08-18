//
//  DashboardViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import UIKit
import Combine

class DashboardViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: DashboardViewModel!
    var tableViewDelegate: TableViewDelegate!
    var collectionViewDelegate: CollectionViewDelegate!
    let viewControllerFactory = ViewControllerFactory()
    private var subscribers: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    
    ///Old Design Outlets
    ///
    ///
    //    @IBOutlet weak var noJobView: UIView!{
    //        didSet {
    //            noJobView.layer.cornerRadius = 15
    //            noJobView.clipsToBounds = true
    //            noJobView.isHidden = true
    //        }
    //    }
    
    //    @IBOutlet weak var assignJobsStack: UIStackView!{
    //        didSet {
    //            assignJobsStack.isUserInteractionEnabled = true
    //            assignJobsStack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gotoAvailableJobs)))
    //        }
    //    }
    
    //    @IBOutlet weak var collectionView: UICollectionView! {
    //        didSet {
    //            collectionViewDelegate = CollectionViewDelegate(collectionView: collectionView)
    //            collectionView.dataSource = collectionViewDelegate
    //            collectionView.delegate = collectionViewDelegate
    //        }
    //    }
    //
    //    @IBOutlet weak var sosButtonImage: UIImageView!{
    //        didSet {
    //            sosButtonImage.isUserInteractionEnabled = true
    //            sosButtonImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gotoSOSView)))
    //        }
    //    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var currentJobView: UIView!{
        didSet {
            currentJobView.layer.borderColor = UIColor.gray.cgColor
        }
    }
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var jobLocationLabel: UILabel!
    @IBOutlet weak var jobTimingLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    @IBOutlet weak var viewJobButton: UIButton!{
        didSet {
            viewJobButton.layer.cornerRadius = viewJobButton.frame.height/2
            viewJobButton.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var jobsListView: UIView!{
        didSet {
            jobsListView.clipsToBounds = true
            jobsListView.layer.cornerRadius = 15
            jobsListView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    @IBOutlet weak var availableJobsStack: UIStackView!{
        didSet {
            availableJobsStack.isUserInteractionEnabled = true
            availableJobsStack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gotoAvailableJobs)))
        }
    }
    
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
        // self.setUpCollectionViewData()
        self.bindViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    //MARK: - Actions
    
    @IBAction func viewJobAction(_ sender: Any) {
        
    }
}

extension DashboardViewController {
    private func setUpTableViewData() {
        var cellModels: [TableCellModel] = []
        let jobs = [
            JobsTableViewCellItem(jobTitle: "Event Security Guard", jobLocation: "Downtown Office Building", hideIcons: false, hideCheckInButton: false, hideTimingStack: false),
            JobsTableViewCellItem(jobTitle: "Warehouse Security Guard", jobLocation: "Lakeside Residential Complex", hideIcons: false, hideCheckInButton: false, hideTimingStack: false),
            JobsTableViewCellItem(jobTitle: "Construction Site Guard", jobLocation: "Riverside Corporate Park, Riverside Corporate Park, Riverside Corporate Park, Riverside Corporate Park", hideIcons: false, hideCheckInButton: false, hideTimingStack: false)
        ]
        
        let models = jobs.map { JobsTableViewCellModel(data: $0) }
        cellModels.append(contentsOf: models)
        
        tableViewDelegate.cellModels = cellModels
        tableView.reloadData()
    }
    
    //    private func setUpCollectionViewData() {
    //        var cellModels: [CollectionCellModel] = []
    //        let jobs = [
    //            JobsCollectionViewCellItem(jobTitle: "Event Security Guard", jobLocation: "Downtown Office Building", jobTiming: "08:00 AM - 04:00 PM"),
    //            JobsCollectionViewCellItem(jobTitle: "Warehouse Security Guard", jobLocation: "Lakeside Residential Complex", jobTiming: "08:00 AM - 04:00 PM"),
    //            JobsCollectionViewCellItem(jobTitle: "Construction Site Guard", jobLocation: "Riverside Corporate Park", jobTiming: "08:00 AM - 04:00 PM")
    //        ]
    //
    //        let models = jobs.map { JobsCollectionViewCellModel(width: 300, height: 170, data: $0) }
    //        cellModels.append(contentsOf: models)
    //        collectionViewDelegate.cellModels = cellModels
    //        collectionView.reloadData()
    //    }
}

extension DashboardViewController {
    fileprivate func bindViews() {
        //        self.viewModel.$isJobsAvailable.receive(on: RunLoop.main).sink { [weak self] isJobsAvailable in
        //            self?.noJobView.isHidden = isJobsAvailable
        //        }.store(in: &subscribers)
    }
    
    @objc func gotoAvailableJobs(gesture: UITapGestureRecognizer) {
        if let navigationController = self.navigationController {
            //            let jobsVC = viewControllerFactory.jobsViewController(navigationController: navigationController)
            //            navigationController.pushViewController(jobsVC, animated: true)
            
            let jobsVC = viewControllerFactory.assignJobsViewController(navigationController: navigationController)
            navigationController.pushViewController(jobsVC, animated: true)
        }
    }
    
    @objc func gotoSOSView(gesture: UITapGestureRecognizer) {
        if let navigationController = self.navigationController {
            let sosVC = viewControllerFactory.jobsDetailViewController(navigationController: navigationController)
            navigationController.pushViewController(sosVC, animated: true)
        }
    }
}
