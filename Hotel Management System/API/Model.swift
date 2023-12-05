//
//  Model.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 24/11/23.
//
import Foundation


//MARK: - Signup Api POST
struct SignModel: Codable {
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

//MARK: - Cheak
struct SignUpModels:Codable{
    var message, userId:String?
    var statuscode:Int?
}

//MARK: - CheaksLogin

struct ModelLogin:Codable{
    var message:String?
    var statuscode:Int?
    var data:LoginCheak?
}

struct LoginCheak:Codable{
    var userId,token:String?
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

struct propertyUpdate: Codable {
    let propertyTypeSOC: String
    var message: String?
    var statuscode: Int?
    // Add other properties as needed
}

 struct sendOTP:Codable{
     var message:String
     var statusCode:Int
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
//MARK: - Create Room Model
//struct CreateRoomResponse: Codable {
//    var message,roomTypeId: String
//    var roomTypeId:Int
//}

struct createRoom:Codable{
    var message:String
    var roomTypeId:String
    var statuscode:Int
}

struct Pr: Codable {
    var message,propertyName: String?
    var statuscode: Int?
}

struct UserUpdateModel: Codable {
    var message,propertyName: String
    var statuscode: Int
    // ... other properties you want to update

    // You can customize the coding keys if the property names don't match the API
    
}


struct UserEditRequest: Codable {
    let userId: String
    let propertyTypeSOC: String
    let propertyName: String
}


struct PropertyUpdateRequest: Codable {
    var PropertyTypeSOC: String?
    var roomsInProperty: String?
    var ratePercents: String?
    var taxNumber: String?
    var registrationNumber: String?
    var propertyType: String?
    var baseCurrency: String?
    var propertyAddress: String?
    var PropertyName: String?
    var propertyTypeName: String?
    var postCode: String?
    var state: String?
    var city: String?
    var starCategory: String?
}


struct CreatePropertyModel:Codable{
    var message, userId:String?
    var statuscode:Int?
    var propertyTypeSOC: String?
}
