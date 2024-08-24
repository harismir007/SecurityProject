//
//  SignUpViewModel.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 01/08/2024.
//

import Foundation

class SignUpViewModel: ViewModel {
    
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
    @Published var isSignUpSuccessful: Bool = false
    
    //MARK: - Initializer
    override init() {
        
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
    
    func callSignUp() {
        guard email.isValidEmailAddress() else {
            errorMessage = "Enter a valid email address"
            return
        }
        guard password.count > 6, password == confirmPassword else {
            errorMessage = "Enter a valid password greater than 6 characters"
            return
        }
        
        let param = [ "name"         : userName,
                      "email"        : email,
                      "username"     : userName,
                      "password"     : password,
                      "user_role"    : "",
                      "status"       : "",
                      "is_blocked"   : "",
                      "dob"          : dateOfBirth,
                      "gender"       : "",
                      "first_name"   : "",
                      "last_name"    : "",
                      "contact_no"   : contactNumber,
                      "address"      : "",
                      "city"         : "",
                      "permission"   : "",
                      "joining_date" : "",
                      "leaving_date" : "",] as NSDictionary
        
        NetworkClient.shared.fetchGenericData(parameters: param, service: Services.signup) { (response: SignUpModel!, error: String!) in
            if let error {
                self.errorMessage = error
                self.isSignUpSuccessful = false
                return
            }
            if let response {
                self.isSignUpSuccessful = true
            }
        }
    }

}
