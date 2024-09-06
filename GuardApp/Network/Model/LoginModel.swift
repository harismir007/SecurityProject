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

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        data = try values.decodeIfPresent(UserDetail.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
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

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case email = "email"
        case username = "username"
        case user_role = "user_role"
        case status = "status"
        case is_blocked = "is_blocked"
        case dob = "dob"
        case active = "active"
        case gender = "gender"
        case first_name = "first_name"
        case last_name = "last_name"
        case email_verified_at = "email_verified_at"
        case contact_no = "contact_no"
        case avatar = "avatar"
        case address = "address"
        case city = "city"
        case permission = "permission"
        case joining_date = "joining_date"
        case leaving_date = "leaving_date"
        case settings_string = "settings_string"
        case last_loggedIn = "last_loggedIn"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        case token = "token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        user_role = try values.decodeIfPresent(String.self, forKey: .user_role)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        is_blocked = try values.decodeIfPresent(Int.self, forKey: .is_blocked)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        active = try values.decodeIfPresent(Int.self, forKey: .active)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email_verified_at = try values.decodeIfPresent(String.self, forKey: .email_verified_at)
        contact_no = try values.decodeIfPresent(String.self, forKey: .contact_no)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        permission = try values.decodeIfPresent(String.self, forKey: .permission)
        joining_date = try values.decodeIfPresent(String.self, forKey: .joining_date)
        leaving_date = try values.decodeIfPresent(String.self, forKey: .leaving_date)
        settings_string = try values.decodeIfPresent(String.self, forKey: .settings_string)
        last_loggedIn = try values.decodeIfPresent(String.self, forKey: .last_loggedIn)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}
