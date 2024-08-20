//
//  LoginViewModel.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import Foundation

class LoginViewModel {
    
    //MARK: - Properties
    @Published var isInputValid: Bool = false
    @Published var isLoggedInSuccessful: Bool = false
    @Published var errorMessage: String = ""
    
    var email = "" {
        didSet {
            validateInput()
        }
    }
    
    var password = "" {
        didSet {
            validateInput()
        }
    }
    
    //MARK: - Initializer
    init() {
        
    }
    
}

//MARK: - Validation
extension LoginViewModel {
    private func validateInput() {
        isInputValid = email.isNotEmpty &&
        password.isNotEmpty
    }
}

extension LoginViewModel {
    func callLogin() {
        guard email.isValidEmailAddress() else {
            errorMessage = "Enter a valid email address"
            return
        }
        guard password.count > 6 else {
            errorMessage = "Enter a valid password greater than 6 characters"
            return
        }
        
        let param = ["email" : email,
                     "Password": password] as NSDictionary
        
        NetworkClient.shared.fetchGenericData(parameters: param, service: Services.signin) { (response: LoginModel!, error: String!) in
            if let error {
                self.errorMessage = error
                self.isLoggedInSuccessful = false
                return
            }
            if let response {
                Constants.userData = response.data
                self.isLoggedInSuccessful = true
            }
        }
    }
}
