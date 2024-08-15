//
//  SignUpViewModel.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 01/08/2024.
//

import Foundation

class SignUpViewModel {
    
    //    MARK: - Properties
    
    var userName = "" {
        didSet {
            validateInput()
        }
    }
    
    var cnic = "" {
        didSet {
            validateInput()
        }
    }
    
    var contactNumber = "" {
        didSet {
            validateInput()
        }
    }
    
    var dateOfBirth = "" {
        didSet {
            validateInput()
        }
    }
    
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
    
    var confirmPassword = "" {
        didSet {
            validateInput()
        }
    }
    
    @Published var isInputValid: Bool = false
    
    
    //MARK: - Initializer
    init() {
        
    }
    
}

//MARK: - Validation
extension SignUpViewModel {
    private func validateInput() {
        isInputValid = userName.isNotEmpty &&
        cnic.isNotEmpty &&
        contactNumber.isNotEmpty &&
        dateOfBirth.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty
    }
}
