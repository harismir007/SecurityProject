//
//  ChangePasswordViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 24/08/2024.
//

import UIKit

class ChangePasswordViewController: BaseViewController {
    //MARK: - Properties
    let viewControllerFactory = ViewControllerFactory()
    
    
    //MARK: - Outlets
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    @IBAction func changePasswordAction(_ sender: Any) {
        self.moveToLoginVC()
    }
}

extension ChangePasswordViewController {
    func moveToLoginVC() {
        if let navigationController = self.navigationController {
            let loginVC = self.viewControllerFactory.loginViewController(navigationController: navigationController)
            navigationController.pushViewController(loginVC, animated: true)
        }
    }
}
