//
//  JobsDetailViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 04/08/2024.
//

import UIKit
import Combine

class JobsDetailViewController: UIViewController {
    //MARK: - Properties
    var viewModel: JobsDetailViewModel!
    private var subscribers: Set<AnyCancellable> = []

    //MARK: - Outlets
    @IBOutlet weak var uploadLicenseView: UIView!{
        didSet {
            uploadLicenseView.layer.cornerRadius = 15
            uploadLicenseView.clipsToBounds = true
        }
    }
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
    }
}
