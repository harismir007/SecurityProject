//
//  SignUpModel.swift
//  GuardApp
//
//  Created by Haris on 24/08/2024.
//

import Foundation

struct SignUpModel : Codable {
    let code : Int?
    let status : String?
    let type : String?
    let data : Data?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case code = "Code"
        case status = "Status"
        case type = "Type"
        case data = "Data"
        case message = "Message"
    }

    struct Data : Codable {
        let name : String?
        let email : String?
        let username : String?
        let user_role : String?
        let status : String?
        let is_blocked : String?
        let password : String?
        let dob : String?
        let active : Int?
        let gender : String?
        let first_name : String?
        let last_name : String?
        let contact_no : String?
        let avatar : String?
        let address : String?
        let city : String?
        let permission : String?
        let joining_date : String?
        let leaving_date : String?
    }

}
