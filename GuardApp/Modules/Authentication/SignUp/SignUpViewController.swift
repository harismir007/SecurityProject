//
//  SignUpViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import UIKit
import Combine
import iOSDropDown

class SignUpViewController: BaseViewController {
    
    //MARK: - Properties
    var viewModel: SignUpViewModel!
    let viewControllerFactory = ViewControllerFactory()
    private var subscribers: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    ///TextFields
    @IBOutlet weak var titleTextField: DropDown!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var middleTextField: CustomTextField!
    @IBOutlet weak var surnameTextField: CustomTextField!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var mobileNumberTextField: CustomTextField!
    @IBOutlet weak var telephoneTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    @IBOutlet weak var nationalInsuranceTextField: CustomTextField!
    
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
        self.navigateToLogin()
    }
    
    @IBAction func uploadLicenseAction(_ sender: Any) {
        // TODO: - Image Picker
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        self.viewModel.callSignUp()
    }
    
    private func navigateToLogin() {
        if let navigationController = self.navigationController {
            let loginUpVC = viewControllerFactory.loginViewController(navigationController: navigationController)
            navigationController.pushViewController(loginUpVC, animated: true)
        }
    }
}

extension SignUpViewController {
    private func bindViews() {
        titleTextField.didChangeTextPublisher.sink { [weak self] userName in
            self?.viewModel.userName = userName ?? ""
        }.store(in: &subscribers)
        
        firstNameTextField.didChangeTextPublisher.sink { [weak self] cnic in
            self?.viewModel.cnic = cnic ?? ""
        }.store(in: &subscribers)
        
        middleTextField.didChangeTextPublisher.sink { [weak self] contactNumber in
            self?.viewModel.contactNumber = contactNumber ?? ""
        }.store(in: &subscribers)
        
        surnameTextField.didChangeTextPublisher.sink { [weak self] contactNumber in
            self?.viewModel.contactNumber = contactNumber ?? ""
        }.store(in: &subscribers)

        mobileNumberTextField.didChangeTextPublisher.sink { [weak self] dateOfBirth in
            self?.viewModel.dateOfBirth = dateOfBirth ?? ""
        }.store(in: &subscribers)

        telephoneTextField.didChangeTextPublisher.sink { [weak self] dateOfBirth in
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
        
        nationalInsuranceTextField.didChangeTextPublisher.sink { [weak self] dateOfBirth in
            self?.viewModel.dateOfBirth = dateOfBirth ?? ""
        }.store(in: &subscribers)

        
        self.viewModel.$isInputValid.sink { isValid in
            //            self?.nextButton.isEnabled = isValid
        }.store(in: &subscribers)
        
        self.viewModel.$errorMessage.sink { [weak self] errorMessage in
            if errorMessage == "" { return }
            self?.showAlert(title: "Error", message: errorMessage)
        }.store(in: &subscribers)
        
        self.viewModel.$isSignUpSuccessful.sink { [weak self]  isValid in
            if isValid {
                self?.navigateToLogin()
            }
        }.store(in: &subscribers)
        
    }
}
