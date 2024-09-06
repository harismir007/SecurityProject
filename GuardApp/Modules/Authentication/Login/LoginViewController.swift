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
        emailTextField.text = "khrm.shahzad1994@gmail.com"
        passwordTextField.text = "123456"
    }
    
    //MARK: - Actions
    @IBAction func loginAction(_ sender: Any) {
        self.navigateToForm()
      //  self.viewModel.callLogin()
    }
    
    func navigateToDashboard() {
        if let navigationController = self.navigationController {
            let dashboardVC = self.viewControllerFactory.tabBarViewController(navigationController: navigationController)
            navigationController.pushViewController(dashboardVC, animated: true)
        }
    }
    
        func navigateToForm() {
            if let navigationController = self.navigationController {
                let dashboardVC = self.viewControllerFactory.positionDetailViewController(navigationController: navigationController)
                navigationController.pushViewController(dashboardVC, animated: true)
            }
        }

    
}

extension LoginViewController {
    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
        if let navigationController = self.navigationController {
            let signUpVC = viewControllerFactory.signUpViewController(navigationController: navigationController)
            navigationController.pushViewController(signUpVC, animated: true)
        }
    }
    @objc private func forgetLabelTapped() {
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
        
        self.viewModel.$isInputValid.sink { isValid in
            //            self?.nextButton.isEnabled = isValid
        }.store(in: &subscribers)
        
        self.viewModel.$errorMessage.sink { [weak self] errorMessage in
            if (errorMessage == "") { return }
            self?.showAlert(title: "Error", message: errorMessage)
        }.store(in: &subscribers)
        
        self.viewModel.$isLoggedInSuccessful.sink { [weak self] success in
            if success {
                self?.navigateToForm()
            }
        }.store(in: &subscribers)
        
    }
}


extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

extension String {
    func isValidEmailAddress() -> Bool {
        let emailReg: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReg)
        if emailTest.evaluate(with: self) == false {
            return false
        }
        return true
    }
}
