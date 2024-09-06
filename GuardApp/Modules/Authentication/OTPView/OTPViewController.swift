//
//  OTPViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 24/08/2024.
//

import UIKit
import SVPinView

class OTPViewController: BaseViewController {
    
    //MARK: - Properties
    let viewControllerFactory = ViewControllerFactory()
    
    //MARK: - Outlets
    @IBOutlet weak var otpView: SVPinView!
    
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    
    @IBAction func confirmOTPAction(_ sender: Any) {
        self.moveToChangePasswordVC()
    }
    
}

extension OTPViewController {
    func moveToChangePasswordVC() {
        if let navigationController = self.navigationController {
            let changePasswordVC = self.viewControllerFactory.changePasswordViewController(navigationController: navigationController)
            navigationController.pushViewController(changePasswordVC, animated: true)
        }
    }
}
