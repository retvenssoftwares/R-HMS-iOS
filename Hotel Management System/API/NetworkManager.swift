//
//  NetworkManager.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 24/11/23.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    static let baseURL = "https://api.hotelratna.com/api"
    //var dataArray: [AmenityGetData] = []
    struct UsersAuth {
        
        //MARK: - GET
        static let getDesignation = baseURL + "/getDesignation"
        static let getAmenity = baseURL + "/getAmenity"
        
        //MARK: - POST
        static let signUpUser = baseURL + "/addUser"
        static let loginUser = baseURL + "/userLogin"
        static let createProperty = baseURL + "/createProperty"
        
        //MARK: - PATCH
        static let userEdit = baseURL  + "/userEdit"
        static let loginStatus = baseURL  + "/loginStatus"
    }
    
    private init() {}
    //MARK: - userSignUp
    
    
    func postRequestSignUp(firstName:String, lastName:String, designation:String, phoneNumber:String, email:String,password:String, completion: @escaping (SignUpModels?, Error?) -> Void) {
        
        let parameters = ["firstName":firstName, "lastName":lastName, "designation":designation, "phoneNumber":phoneNumber,"email":email, "password":password ]
        let url = URL(string: "https://api.hotelratna.com/api/addUser")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                
                return
            }
            
            do {
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                let model = try JSONDecoder().decode(SignUpModels.self, from: data)
                print(json)
                completion(model, nil)
            } catch let error {
                print(error.localizedDescription)
                print(error)
                completion(nil, error)
            }
        })
        
        task.resume()
    }
    //MARK: - userLogin
    func postRequestLogin(username:String, hotelCode:String, password:String, completion: @escaping (ModelLogin?, Error?) -> Void) {
        
        let parameters = ["username":username, "hotelCode":hotelCode, "password":password ]
        let url = URL(string: "https://api.hotelratna.com/api/userLogin")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                
                return
            }
            
            do {
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                let model = try JSONDecoder().decode(ModelLogin.self, from: data)
                print(json)
                completion(model, nil)
            } catch let error {
                print(error.localizedDescription)
                print(error)
                completion(nil, error)
            }
        })
        
        task.resume()
    }
    
    //MARK: Patch API UserEdit
    func singleUserEditById(userId: String, ratePercent: String, taxName: String, registrationNumber: String, propertyTypeSOC: String, websiteUrl: String, numberOfProperties: String, propertyAddress1: String, propertyName: String, propertyType: String, postCode: String, state: String, city: String, taxPercent: String , starCategory: Double) {
        let url = URL(string: APIManager.UsersAuth.userEdit)!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        
        // Add text parameters
        let textParameters = [
            "userId": userId,
            "propertyTypeSOC": propertyTypeSOC,
            "propertyType": propertyType,
            "propertyName": propertyName,
            "ratePercent": ratePercent,
            "taxName": taxName,
            "registrationNumber": registrationNumber,
            "websiteUrl": websiteUrl,
            "numberOfProperties": numberOfProperties,
            "propertyAddress1": propertyAddress1,
            "postCode": postCode,
            "state": state,
            "city": city,
            "taxPercent": taxPercent,
            "starCategory": starCategory
        ] as [String : Any]
        
        for (key, value) in textParameters {
            body += "--\(boundary)\r\n"
            body += "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n"
            body += "\(value)\r\n"
        }
        
        body += "--\(boundary)--\r\n"
        request.httpBody = body.data(using: .utf8)
        
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    //MARK: PropertyChain
    func multiUserEditById(userId: String, propertyTypeSOC: String, websiteUrl: String, numberOfProperties: String, propertyName: String, propertyType: String) {
        let url = URL(string: APIManager.UsersAuth.userEdit)!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        
        // Add text parameters
        let textParameters = [
            "userId": userId,
            "propertyTypeSOC": propertyTypeSOC,
            "propertyType": propertyType,
            "propertyName": propertyName,
            "websiteUrl": websiteUrl,
            "numberOfProperties": numberOfProperties
        ] as [String : Any]
        
        for (key, value) in textParameters {
            body += "--\(boundary)\r\n"
            body += "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n"
            body += "\(value)\r\n"
        }
        
        body += "--\(boundary)--\r\n"
        request.httpBody = body.data(using: .utf8)
        
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }

    
    //MARK: - SendOTP
    func postRequestSendOTP(email:String, completion:@escaping(sendOTP?,Error?) -> Void){
        let parameters = ["email":email]
        let url = URL(string: "https://api.hotelratna.com/api/sendOtp")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
            
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                let model = try JSONDecoder().decode(sendOTP.self, from: data)
                print(json)
                completion(model, nil)
            } catch let error {
                print(error.localizedDescription)
                print(error)
                completion(nil, error)
            }
            
        })
        task.resume()
        
    }
    //MARK: Verify OTP
    func postRequestVerifyOTP(Otp:String,completion:@escaping(sendOTP?,Error?) -> Void){
        let parameters = ["Otp":Otp]
        let url = URL(string: "https://api.hotelratna.com/api/verifyOtp")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
            
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                let model = try JSONDecoder().decode(sendOTP.self, from: data)
                print(json)
                completion(model, nil)
            } catch let error {
                print(error.localizedDescription)
                print(error)
                completion(nil, error)
            }
            
        })
        task.resume()
        
    }
    //MARK: Reset Password
    func postRequestResetPassword(email:String,password:String, confirmPassword:String ,completion:@escaping(sendOTP?,Error?) -> Void){
        let parameters = ["email":email, "password": password, "confirmPassword": confirmPassword]
        let url = URL(string: "https://api.hotelratna.com/api/resetPassword")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
            
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                let model = try JSONDecoder().decode(sendOTP.self, from: data)
                print(json)
                completion(model, nil)
            } catch let error {
                print(error.localizedDescription)
                print(error)
                completion(nil, error)
            }
            
        })
        task.resume()
        
    }
    func postRequestRoom(userId: String,propertyId: String, roomTypeName:String, shortCode:String, noOfBeds:String, maxOccupancy:String, roomDescription:String, minimumRate:String, maximumRate:String, extraAdultRate:String, extraChildRate:String,baseAdult: String,baseChild: String,authCode: String ,completion:@escaping(createRoom?,Error?) -> Void){
       
        let parameters = [
            "userId": userId,
            "propertyId": propertyId,
            "roomTypeName": roomTypeName,
            "shortCode":shortCode,
            "noOfBed":noOfBeds,
            "maxOccupancy":maxOccupancy,
            "roomDescription": roomDescription,
            "minimumRate":minimumRate,
            "maximumRate": maximumRate,
            "extrAdultRate": extraAdultRate,
            "baseAdult": baseAdult,
            "baseChild": baseChild,
            
        ]
        let url = URL(string: "https://api.hotelratna.com/api/createRoom")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
            
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                let model = try JSONDecoder().decode(createRoom.self, from: data)
                print(json)
                completion(model, nil)
            } catch let error {
                print(error.localizedDescription)
                print(error)
                completion(nil, error)
            }
            
        })
        task.resume()
    }
    
    
    //MARK: ----------------------Congfiguration API --------------------------------------
    
//    func createPropertyByUser(userId: String,country: String, state:String, city:String, noOfBeds:String, propertyAddress2:String, propertyAddress1:String, amenityIds:String, propertyDescription:String, websiteUrl:String, propertyRating:String,propertyName: String,hotelLogo: String,authCode: String , phone: String, longitude: String,latitude: String,propertyEmail: String , reservationPhone: String,completion:@escaping(createRoom?,Error?) -> Void){
//       
//        let parameters = [
//            "userId": userId,
//            "state": state,
//            "propertyName": propertyName,
//            "city":city,
//            "propertyAddress2":propertyAddress2,
//            "propertyAddress1":propertyAddress1,
//            "amenityIds": amenityIds,
//            "propertyDescription":propertyDescription,
//            "websiteUrl": websiteUrl,
//            "propertyRating": propertyRating,
//            "propertyName": propertyName,
//            "hotelLogo": hotelLogo,
//            "country": country,
//            "phone": phone,
//            "reservationPhone": reservationPhone,
//            "propertyEmail":propertyEmail,
//            "latitude":latitude,
//            "longitude":longitude
//        ]
//        let url = URL(string: "https://api.hotelratna.com/api/createRoom")!
//        let session = URLSession.shared
//        var request = URLRequest(url: url)
//        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        } catch let error {
//            print(error.localizedDescription)
//            completion(nil, error)
//            
//        }
//        
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue(authCode, forHTTPHeaderField: "authcode")
//        
//        let task = session.dataTask(with: request, completionHandler: { data, response, error in
//            
//            guard error == nil else {
//                completion(nil, error)
//                return
//            }
//            
//            guard let data = data else {
//                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
//                
//                return
//            }
//            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
//                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
//                    return
//                }
//                let model = try JSONDecoder().decode(createRoom.self, from: data)
//                print(json)
//                completion(model, nil)
//            } catch let error {
//                print(error.localizedDescription)
//                print(error)
//                completion(nil, error)
//            }
//            
//        })
//        task.resume()
//    }
    
    
    //MARK: getAmenities
    
    
    func createPropertyByUser(userId: String, enterProperty: String, country: String, state: String, city: String, noOfBeds: String, propertyAddress2: String, propertyAddress1: String, amenityIds: String, propertyDescription: String, websiteUrl: String, propertyRating: String, propertyName: String, hotelLogo: UIImage, authCode: String, phone: String, longitude: String, latitude: String, propertyEmail: String, reservationPhone: String, completion: @escaping (Result<CreateUserPropertyModel, AFError>) -> Void) {

        let apiUrl = APIManager.UsersAuth.createProperty

        // Convert UIImage to Data
        guard let imageData = hotelLogo.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert hotelLogo to data")
            completion(.failure(AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: NSError()))))
            return
        }

        let parameters: [String: Any] = [
//            "userId": userId,
//            "state": state,
//            "propertyName": propertyName,
//            "city": city,
//            "propertyAddress2": propertyAddress2,
//            "propertyAddress1": propertyAddress1,
//            "amenityIds": amenityIds,
//            "propertyDescription": propertyDescription,
//            "websiteUrl": websiteUrl,
//            "propertyRating": propertyRating,
//            "phone": phone,
//            "reservationPhone": reservationPhone,
//            "propertyEmail": propertyEmail,
//            "latitude": latitude,
//            "longitude": longitude,
//            "country": country
            
            "propertyName": propertyName,
            "propertyType": enterProperty,
            "propertyRating": propertyRating,
            "websiteUrl": websiteUrl,
            "propertyDescription": propertyDescription,
            "amenityIds": amenityIds,
            "propertyAddress1": propertyAddress1,
            "propertyAddress2": propertyAddress2,
            "city": city,
            "state": state,
            "country": country,
            "phone": phone,
            "reservationPhone": reservationPhone,
            "propertyEmail": propertyEmail,
            "latitude": latitude,
            "longitude": longitude,
            "userId": userId
        ]

        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in parameters {
                if let data = "\(value)".data(using: .utf8) {
                    multipartFormData.append(data, withName: key)
                }
            }
            multipartFormData.append(imageData, withName: "\(hotelLogo)", fileName: "\(hotelLogo).jpg", mimeType: "image/jpeg")
        }, to: apiUrl)
        .responseDecodable(of: CreateUserPropertyModel.self) { response in
            completion(response.result)
        }
    }

    
//    func createPropertyByUser(userId: String,country: String, state: String,city: String,noOfBeds: String,propertyAddress2: String,propertyAddress1: String,amenityIds: String,propertyDescription: String,websiteUrl: String,propertyRating: String,propertyName: String,hotelLogo: UIImage,authCode: String,phone: String,longitude: String,latitude: String,propertyEmail: String,reservationPhone: String, completion: @escaping (Result<CreateUserPropertyModel, AFError>) -> Void) {
//
//        let apiUrl = APIManager.UsersAuth.createProperty
//
//            // Convert UIImage to Data
//            guard let imageData = hotelLogo.jpegData(compressionQuality: 0.5) else {
//                print("Failed to convert hotelLogo to data")
//                return
//            }
//
//        let parameters = [
//               "userId": userId,
//               "state": state,
//               "propertyName": propertyName,
//               "city": city,
//               "propertyAddress2": propertyAddress2,
//               "propertyAddress1": propertyAddress1,
//               "amenityIds": amenityIds,
//               "propertyDescription": propertyDescription,
//               "websiteUrl": websiteUrl,
//               "propertyRating": propertyRating,
//               "phone": phone,
//               "reservationPhone": reservationPhone,
//               "propertyEmail": propertyEmail,
//               "latitude": latitude,
//               "longitude": longitude,
//               "country": country
//           ]
//        AF.upload(multipartFormData: { multipartFormData in
//               for (key, value) in parameters {
//                   if let data = "\(value)".data(using: .utf8) {
//                       multipartFormData.append(data, withName: key)
//                   }
//               }
//               multipartFormData.append(imageData, withName: "hotelLogo", fileName: "hotel_logo.jpg", mimeType: "image/jpeg")
//           }, to: apiUrl)
//           .responseDecodable(of: CreateUserPropertyModel.self) { response in
//               completion(response.result)
//           }
//    }

//    // MARK: - Create Room Api
//    func createRoom(userId: String,propertyId: String, roomTypeName:String, shortCode:String, noOfBeds:String, maxOccupancy:String, roomDescription:String, minimumRate:String, maximumRate:String, extraAdultRate:String, extraChildRate:String,baseAdult: String,baseChild: String,authCode: String,completion: @escaping (Result<createRoom, Error>) -> Void) {
//        let parameters: [String: Any] = [
//            "userId": userId,
//            "propertyId": propertyId,
//            "roomTypeName": roomTypeName,
//            "shortCode":shortCode,
//            "noOfBed":noOfBeds,
//            "maxOccupancy":maxOccupancy,
//            "roomDescription": roomDescription,
//            "minimumRate":minimumRate,
//            "maximumRate": maximumRate,
//            "extrAdultRate": extraAdultRate,
//            "baseAdult": baseAdult,
//            "baseChild": baseChild,
//        ]
//        
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: parameters)
//            var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/createRoom")!, timeoutInterval: Double.infinity)
//            request.addValue(authCode, forHTTPHeaderField: "authcode")
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpMethod = "POST"
//            request.httpBody = jsonData
//            
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                guard let data = data, error == nil else {
//                    completion(.failure(error ?? URLError(.unknown)))
//                    return
//                }
//                
//                do {
//                    let decoder = JSONDecoder()
//                    let createRoomResponse = try decoder.decode(CreateRoomResponse.self, from: data)
//                    completion(.success(createRoomResponse))
//                } catch {
//                    completion(.failure(error))
//                }
//            }
//            
//            task.resume()
//        } catch {
//            completion(.failure(error))
//        }
//    }
    
    //MARK: Patch API UserEdit
    func userUdatePropertySelection(userId: String, ratePercent: String, roomsInProperty: String, taxName: String, registrationNumber: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let apiUrl = URL(string: APIManager.UsersAuth.userEdit)!
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "PATCH"
        var formData = "userId=\(userId)"
        formData += "&ratePercent=\(ratePercent)"
        formData += "&roomsInProperty=\(roomsInProperty)"
        formData += "&taxName=\(taxName)"
        formData += "&registrationNumber=\(registrationNumber)"
        request.httpBody = formData.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            if let data = data {
                print("Status code: \(httpResponse.statusCode)")
                let responseString = String(data: data, encoding: .utf8)
                print("Response: \(responseString ?? "")")
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
    
    func userLoginStatus(userId: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let apiUrl = URL(string: APIManager.UsersAuth.loginStatus)!
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "PATCH"
        var formData = "userId=\(userId)"
        request.httpBody = formData.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            if let data = data {
                print("Status code: \(httpResponse.statusCode)")
                let responseString = String(data: data, encoding: .utf8)
                print("Response: \(responseString ?? "")")
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
    
    
    //    func createProperty(userId: String, authcode: String, amenityIds: String, user: createPropertyModel, completion: @escaping (Result<Data, Error>) -> Void) {
    //        guard let url = URL(string: UsersAuth.createProperty) else {
    //            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
    //            return
    //        }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        var formData = "userId=\(userId)"
    //        formData = "amenityIds=\(amenityIds)"
    //        request.httpBody = formData.data(using: .utf8)
    //        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    //        request.setValue("Bearer \(authcode)", forHTTPHeaderField: "Authorization")
    //        let requestBody: [String: Any] = [
    //            "userId": user.userId,
    //            "amenityIds": user.amenityIds
    //
    //        ]
    //        do {
    //            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
    //            request.httpBody = jsonData
    //        } catch {
    //            completion(.failure(error))
    //            return
    //        }
    //        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    //            if let error = error {
    //                completion(.failure(error))
    //                return
    //            }
    //            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
    //                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
    //                return
    //            }
    //            if let data = data {
    //                completion(.success(data))
    //            } else {
    //                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
    //            }
    //        }
    //        task.resume()
    //    }
    //
    //
    
    //
    //
    //
    //
    
    //MARK: Get API getDesignation
    func getDesignation(completion: @escaping (Result<Employee, Error>) -> Void) {
        let apiUrl = URL(string: "https://api.hotelratna.com/api/getDesignation")!
        URLSession.shared.dataTask(with: apiUrl) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "com.example", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data not found"])
                completion(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                let employee = try decoder.decode(Employee.self, from: data)
                completion(.success(employee))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
//    func getAmenityData(completion: @escaping (Result<AmenityDataModel, Error>) -> Void) {
//        let apiUrl = URL(string: APIManager.UsersAuth.getAmenity)!
//        URLSession.shared.dataTask(with: apiUrl) { data, _, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let data = data else {
//                let error = NSError(domain: "com.example", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data not found"])
//                completion(.failure(error))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let amenity = try decoder.decode(AmenityDataModel.self, from: data)
//                completion(.success(amenity))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
    
    func createUserProperty(parameters: [[String: Any]], authCode: String, completion: @escaping (Result<createPropertyModel, Error>) -> Void) {
        let apiUrl = "https://api.hotelratna.com/api/createProperty"
        let boundary = "Boundary-\(UUID().uuidString)"
        
        AF.upload(
            multipartFormData: { multipartFormData in
                for param in parameters {
                    if param["disabled"] != nil { continue }
                    let paramName = param["key"] as! String
                    
                    if param["type"] as! String == "text" {
                        let paramValue = param["value"] as! String
                        multipartFormData.append(paramValue.data(using: .utf8)!, withName: paramName)
                    } else {
                        let paramSrc = param["src"] as! String
                        let fileURL = URL(fileURLWithPath: paramSrc)
                        multipartFormData.append(fileURL, withName: paramName, fileName: fileURL.lastPathComponent, mimeType: "image/png")
                    }
                }
            },
            to: apiUrl,
            method: .post,
            headers: ["Content-Type": "multipart/form-data; boundary=\(boundary)", "authcode": authCode]
        )
        .validate()
        .responseDecodable(of: createPropertyModel.self, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
