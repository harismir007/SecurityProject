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
