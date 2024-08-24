//
//  ForgetPasswordViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 01/08/2024.
//

import UIKit
import Combine

class ForgetPasswordViewController: BaseViewController {
    //MARK: - Properties
    var viewModel: ForgetPasswordViewModel!
    let viewControllerFactory = ViewControllerFactory()
    private var subscribers: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: CustomTextField!
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
    @IBAction func sendOtpAction(_ sender: Any) {
        if let navigationController = self.navigationController {
            let otpVC = self.viewControllerFactory.otpViewController(navigationController: navigationController)
            navigationController.pushViewController(otpVC, animated: true)
        }
    }
}
