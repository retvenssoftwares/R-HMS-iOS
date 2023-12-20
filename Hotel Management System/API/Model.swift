//
//  Model.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 24/11/23.
//
import Foundation
import UIKit


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
    var statusCode: String
    
    enum propertyKeys: String, CodingKey {
        case userId, amenityIds, statusCode
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

struct CreateUserPropertyModel: Codable {
    let success: Bool
    let message: String?
    let statusCode: Int
    let data: CreateUserPropertyData?

    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
        case statusCode
    }
}

struct YourResponseType: Codable {
    let propertyId: String
    let message: String
    let statusCode: Int
}

struct CreateUserPropertyData: Codable {
    let roomId: String
    let roomName: String
    let roomDescription: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case roomId
        case roomName
        case roomDescription
        case imageUrl
    }
    
    struct CreatePropertyModel:Codable{
        var message, userId:String?
        var statuscode:Int?
        var propertyTypeSOC: String?
    }
}


//MARK: Get - AmenityData


struct AmenityData {
    let amenityId: String
    let amenityName: String
}
//struct AmenityDataModel: Codable {
//    let data: [AmenityData]
//}
//
//struct AmenityData: Codable {
//    let amenityId: String
//    let amenityName: String
//    let amenityType: String
//    let amenityIconLink: String
//   
//    private enum CodingKeys: String, CodingKey {
//        case amenityId = "_amenityId"
//        case amenityName
//        case amenityType
//        case amenityIconLink
//    }
//    
//    var amenityIcon: UIImage? {
//            guard let url = URL(string: amenityIconLink),
//                  let data = try? Data(contentsOf: url),
//                  let image = UIImage(data: data) else {
//                return nil
//            }
//            return image
//        }
//}


struct Property: Codable {
    let propertyName: String
    let propertyType: String
    let propertyRating: String
    let websiteUrl: String
    let propertyDescription: String
    let amenityIds: String
    let propertyAddress1: String
    let propertyAddress2: String
    let city: String
    let state: String
    let country: String
    let phone: String
    let reservationPhone: String
    let propertyEmail: String
    let latitude: String
    let longitude: String
    let userId: String
    let image: String?

    enum CodingKeys: String, CodingKey {
        case propertyName, propertyType, propertyRating, websiteUrl, propertyDescription
        case amenityIds, propertyAddress1, propertyAddress2, city, state, country, phone, reservationPhone, propertyEmail
        case latitude, longitude, userId, image
    }

    init(image: UIImage?) {
        self.propertyName = "marriot"
        self.propertyType = "single"
        self.propertyRating = "5 rating"
        self.websiteUrl = "google.com"
        self.propertyDescription = "dddd"
        self.amenityIds = "dddd,djkd"
        self.propertyAddress1 = "indore"
        self.propertyAddress2 = "vijay nagar"
        self.city = "indore"
        self.state = "madhya pradesh"
        self.country = "india"
        self.phone = "9898989898"
        self.reservationPhone = "9898989898"
        self.propertyEmail = "bmayur742@gmail.com"
        self.latitude = "5.0344"
        self.longitude = "44.9893"
        self.userId = "vV90ewCL"
        self.image = image?.jpegData(compressionQuality: 0.8)?.base64EncodedString()
    }
}
struct PostResponse: Codable {
    let success: Bool
    // Add other properties if needed
}

struct CreatePropertyResponse: Decodable {
    let success: Bool
    let message: String
    // Add more properties based on your actual response
}
