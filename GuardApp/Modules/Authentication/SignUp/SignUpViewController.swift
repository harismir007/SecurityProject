//
//  SignUpViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import UIKit
import Combine

class SignUpViewController: BaseViewController {
    
    //MARK: - Properties
    var viewModel: SignUpViewModel!
    let viewControllerFactory = ViewControllerFactory()
    private var subscribers: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    ///TextFields
    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var cnicTextField: CustomTextField!
    @IBOutlet weak var contactNumberTextField: CustomTextField!
    @IBOutlet weak var dateOfBirthTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    
    ///Views
    @IBOutlet weak var uploadLicenseView: UIView!{
        didSet {
            uploadLicenseView.layer.cornerRadius = 15
            uploadLicenseView.clipsToBounds = true
        }
    }
    
    ///Labels
    @IBOutlet weak var bottomLabel: UILabel! {
        didSet {
            bottomLabel.addAttributes(on: "Login account", attributes: [
                .font: UIFont.buttonFont,
                .foregroundColor: UIColor.appPrimaryColor
            ])
            bottomLabel.isUserInteractionEnabled = true
            bottomLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLabel)))
        }
    }
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        self.bindViews()
    }
    
    //MARK: - Actions
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if let navigationController = self.navigationController {
            let loginUpVC = viewControllerFactory.loginViewController(navigationController: navigationController)
            navigationController.pushViewController(loginUpVC, animated: true)
        }
    }
}

extension SignUpViewController {
    private func bindViews() {
        userNameTextField.didChangeTextPublisher.sink { [weak self] userName in
            self?.viewModel.userName = userName ?? ""
        }.store(in: &subscribers)
        
        cnicTextField.didChangeTextPublisher.sink { [weak self] cnic in
            self?.viewModel.cnic = cnic ?? ""
        }.store(in: &subscribers)
        
        contactNumberTextField.didChangeTextPublisher.sink { [weak self] contactNumber in
            self?.viewModel.contactNumber = contactNumber ?? ""
        }.store(in: &subscribers)
        
        dateOfBirthTextField.didChangeTextPublisher.sink { [weak self] dateOfBirth in
            self?.viewModel.dateOfBirth = dateOfBirth ?? ""
        }.store(in: &subscribers)
        
        emailTextField.didChangeTextPublisher.sink { [weak self] email in
            self?.viewModel.email = email ?? ""
        }.store(in: &subscribers)
        
        passwordTextField.didChangeTextPublisher.sink { [weak self] password in
            self?.viewModel.password = password ?? ""
        }.store(in: &subscribers)
        
        confirmPasswordTextField.didChangeTextPublisher.sink { [weak self] confirmPassword in
            self?.viewModel.confirmPassword = confirmPassword ?? ""
        }.store(in: &subscribers)
        
        self.viewModel.$isInputValid.sink { [weak self] isValid in
            //            self?.nextButton.isEnabled = isValid
        }.store(in: &subscribers)
        
    }
}
