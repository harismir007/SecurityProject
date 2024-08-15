//
//  LoginViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: LoginViewModel!
    let viewControllerFactory = ViewControllerFactory()
    private var subscribers: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    ///Labels
    @IBOutlet weak var forgetPasswordLabel: UILabel! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgetLabelTapped))
               forgetPasswordLabel.isUserInteractionEnabled = true
               forgetPasswordLabel.addGestureRecognizer(tapGesture)
        }
    }
    @IBOutlet weak var bottomLabel: UILabel!{
        didSet {
            bottomLabel.addAttributes(on: "Create account", attributes: [
                .font: UIFont.buttonFont,
                .foregroundColor: UIColor.appPrimaryColor
            ])
            bottomLabel.isUserInteractionEnabled = true
            bottomLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLabel)))
        }
    }
    
    
    //MARK: - ViewCall
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Actions
    @IBAction func loginAction(_ sender: Any) {
        //        if let navigationController = self.navigationController {
        //            let dashboardVC = viewControllerFactory.dashboardViewController(navigationController: navigationController)
        //            navigationController.pushViewController(dashboardVC, animated: true)
        //        }
        if let navigationController = self.navigationController {
            let dashboardVC = viewControllerFactory.tabBarViewController(navigationController: navigationController)
            navigationController.pushViewController(dashboardVC, animated: true)
        }
    }
    
}

extension LoginViewController {
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if let navigationController = self.navigationController {
            let signUpVC = viewControllerFactory.signUpViewController(navigationController: navigationController)
            navigationController.pushViewController(signUpVC, animated: true)
        }
    }
    @objc func forgetLabelTapped() {
        if let navigationController = self.navigationController {
            let forgetPasswordVC = viewControllerFactory.forgetPasswordViewController(navigationController: navigationController)
            navigationController.pushViewController(forgetPasswordVC, animated: true)
        }
    }
}

extension LoginViewController {
    private func bindViews() {
        self.emailTextField.didChangeTextPublisher.sink { [weak self] email in
            self?.viewModel.email = email ?? ""
        }.store(in: &subscribers)
        
        self.passwordTextField.didChangeTextPublisher.sink { [weak self] password in
            self?.viewModel.password = password ?? ""
        }.store(in: &subscribers)
        
        self.viewModel.$isInputValid.sink { [weak self] isValid in
            //            self?.nextButton.isEnabled = isValid
        }.store(in: &subscribers)
        
    }
}
