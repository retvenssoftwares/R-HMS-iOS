//
//  User.swift
//  Hotel Management System
//
//  Created by mayur bobade on 13/11/23.
//

import Foundation

//MARK: - Signup Api POST
struct SignUpModel: Codable {
    var firstName: String
    var lastName: String
    var designation: String
    var phoneNumber: String
    var password: String
    var email: String
    
    enum CodingKeys: String, CodingKey {
        case firstName, lastName, designation, phoneNumber, password, email
    }
}

//MARK: - Login Api POST
struct LoginModel: Codable {
    var username: String
    var hotelCode: String
    var password: String
    var deviceType: String
    
    enum CodingKeys: String, CodingKey {
        case username, hotelCode, password, deviceType
    }
}

struct UserLoginModel: Codable {
    var id: String
    var address: String
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case id, address, token
    }
}

//MARK: Patch Model
//MARK: Property Selection image data
struct UserEditModel: Codable {
    var userId: String
    var ratePercent: String
    var roomsInProperty: String
    var taxName: String
    var registrationNumber: String
    
    enum ApiKeys: String, CodingKey {
        case userId, ratePercent, roomsInProperty, taxName, registrationNumber
    }
}

//MARK: - Login Status Check
struct UserLoginStatusModel: Codable {
    var userId: String
    
    enum ApiKeys: String, CodingKey {
        case userId
    }
}

//MARK: - Login Api POST
struct createPropertyModel: Codable {
    var userId: String
    var amenityIds: String
    
    enum propertyKeys: String, CodingKey {
        case userId, amenityIds
    }
}
