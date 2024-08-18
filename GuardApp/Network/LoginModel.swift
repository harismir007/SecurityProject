//
//  LoginModel.swift
//  GuardApp
//
//  Created by Haris on 18/08/2024.
//

import Foundation
struct LoginModel : Codable {
    let status : String?
    let type : String?
    let data : UserDetail?
    let message : String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case type = "Type"
        case data = "Data"
        case message = "Message"
    }
}
struct UserDetail : Codable {
    let id : Int?
    let name : String?
    let email : String?
    let username : String?
    let user_role : String?
    let status : Int?
    let is_blocked : Int?
    let dob : String?
    let active : Int?
    let gender : String?
    let first_name : String?
    let last_name : String?
    let email_verified_at : String?
    let contact_no : String?
    let avatar : String?
    let address : String?
    let city : String?
    let permission : String?
    let joining_date : String?
    let leaving_date : String?
    let settings_string : String?
    let last_loggedIn : String?
    let created_at : String?
    let updated_at : String?
    let deleted_at : String?
    let token : String?
    
}
