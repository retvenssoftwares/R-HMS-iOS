//
//  ApiData.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 24/11/23.
//

//import Foundation
//
//struct APIEndpoints {
//    static let baseURL = ""
//
//    struct Users {
//        
////MARK: PostApi Method
//        static let createUser = baseURL + "/createUser"
//        static let getUser = baseURL + "/getUser"
//        static let createProperty = baseURL + "/createProperty"
////MARK: Patch Api
//        static let userEdit = baseURL + "/userEdit"
//    }
//}
//
//struct ApiData {
//    var userId:String =  "cVDoB8BP"
//    var authToken:String = "b45c11b64f1436811d44ea6ac7a528e509c1fa45b56c80c881b999e9e8d30380ad2e01a17c5cd29b77adf4036111204cd4b1cadbf165da6415121345a0621a6d"
//    enum CodingKeys: String, CodingKey {
//            case userID, authToken
//    }
//}



import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://api.hotelratna.com/api"

    
    struct UsersAuth {
        
        //MARK: - GET
        static let getDesignation = baseURL + "/getDesignation"
        static let fetchProperty = baseURL + "/fetchProperty"
        static let getRoom = baseURL + "/getRoom"
        static let getInclusion =  baseURL + "/getInclusion"
        static let getRatePlansList = baseURL + "/getRatePlansList"
        static let getRoomList = baseURL + "/getRoomList"
        
        //MARK: - POST
        static let signUpUser = baseURL + "/addUser"
        static let loginUser = baseURL + "/userLogin"
        static let createProperty = baseURL + "/createProperty"
        static let sendOtp = baseURL + "/sendOtp"
        static let verifyOtp = baseURL + "/verifyOtp"
        static let resetPassword = baseURL + "/resetPassword"
        
        
        //MARK: - PATCH
        static let userEdit = baseURL  + "/userEdit"
        static let loginStatus = baseURL  + "/loginStatus"
        
    }
    
    private init() {}
    
//    func SignUpUser(user: SignUpModel, completion: @escaping (Result<Data, Error>) -> Void) {
//        guard let url = URL(string: UsersAuth.signUpUser) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        //request.addValue(userId, forHTTPHeaderField: "X-UserId")
//        //request.addValue(authToken, forHTTPHeaderField: "Authorization")
//        let requestBody: [String: Any] = [
//            "firstName": "firstName",
//            "lastName": "lastName",
//            "designation":"designation",
//            "phoneNumber":"phoneNumber",
//            "email": "email",
//            "password": "password"
//        ]
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
//            request.httpBody = jsonData
//        } catch {
//            completion(.failure(error))
//            return
//        }
//        
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
//                let defaults = UserDefaults.standard
//                defaults.set(data, forKey: "SignUp")
//                if let user = UserDefaults.standard.string(forKey: "SignUp") {
//                    print(".......data Stored SuccessFully ....\(user)")
//                }
//            } else {
//                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
//            }
//        }
//        task.resume()
//    }
//    
//    func signUpPostRequest(firstName:String, lastName:String, designation:String, phoneNumber:String, email:String,password:String, completion: @escaping (SignUpModels?, Error?) -> Void) {
//        
//        let parameters = ["firstName":firstName, "lastName":lastName, "designation":designation, "phoneNumber":phoneNumber,"email":email, "password":password ]
//        let url = URL(string: APIManager.UsersAuth.signUpUser)!
//        let session = URLSession.shared
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        } catch let error {
//            print(error.localizedDescription)
//            completion(nil, error)
//        }
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
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
//            
//            do {
//                
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
//                    
//                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
//                    return
//                }
//                let model = try JSONDecoder().decode(SignUpModels.self, from: data)
//                DispatchQueue.main.async {
//                    if let statuscode =  model.statuscode, let userId = model.userId, statuscode == 200 {
//                        
//                        //                        print(model.statuscode, model.userId)
//                        //                        vc.userId = userId
//                        //                        self.navigationController?.pushViewController(vc, animated: true)
//                    }
//                }
//                print(json)
//                completion(model, nil)
//            } catch let error {
//                print(error.localizedDescription)
//                print(error)
//                completion(nil, error)
//            }
//        })
//        
//        task.resume()
//    }
//    
//    func postRequestLogin(username:String, hotelCode:String, password:String, completion: @escaping (LoginModel?, Error?) -> Void) {
//        
//        let parameters = ["username":username, "hotelCode":hotelCode, "password":password ]
//        let url = URL(string: APIManager.UsersAuth.loginUser)!
//        let session = URLSession.shared
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        } catch let error {
//            print(error.localizedDescription)
//            completion(nil, error)
//        }
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        let task = session.dataTask(with: request, completionHandler: { data, response, error in
//            
//            guard error == nil else {
//                completion(nil, error)
//                return
//            }
//            guard let data = data else {
//                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
//                return
//            }
//            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
//                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
//                    return
//                }
//                let model = try JSONDecoder().decode(LoginModel.self, from: data)
//                print(json)
//                completion(model, nil)
//            } catch let error {
//                print(error.localizedDescription)
//                print(error)
//                completion(nil, error)
//            }
//        })
//        
//        task.resume()
//    }
//    
//    
//    
//    //MARK: Patch API UserEdit
//    func singleUserEditById(userId: String, ratePercent: String, taxName: String, registrationNumber: String, propertyTypeSOC: String, websiteUrl: String, numberOfProperties: String, propertyAddress1: String, propertyName: String, propertyType: String, postCode: String, state: String, city: String, taxPercent: String , starCategory: Double) {
//        let url = URL(string: APIManager.UsersAuth.userEdit)!
//        var request = URLRequest(url: url)
//        request.httpMethod = "PATCH"
//        
//        let boundary = "Boundary-\(UUID().uuidString)"
//        var body = ""
//        
//        // Add text parameters
//        let textParameters = [
//            "userId": userId,
//            "propertyTypeSOC": propertyTypeSOC,
//            "propertyType": propertyType,
//            "propertyName": propertyName,
//            "ratePercent": ratePercent,
//            "taxName": taxName,
//            "registrationNumber": registrationNumber,
//            "websiteUrl": websiteUrl,
//            "numberOfProperties": numberOfProperties,
//            "propertyAddress1": propertyAddress1,
//            "postCode": postCode,
//            "state": state,
//            "city": city,
//            "taxPercent": taxPercent,
//            "starCategory": starCategory
//        ] as [String : Any]
//        
//        for (key, value) in textParameters {
//            body += "--\(boundary)\r\n"
//            body += "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n"
//            body += "\(value)\r\n"
//        }
//        
//        body += "--\(boundary)--\r\n"
//        request.httpBody = body.data(using: .utf8)
//        
//        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                if let error = error {
//                    print("Error: \(error)")
//                }
//                return
//            }
//            print(String(data: data, encoding: .utf8)!)
//        }
//        
//        task.resume()
//    }
//    
//    //MARK: PropertyChain
//    func multiUserEditById(userId: String, propertyTypeSOC: String, websiteUrl: String, numberOfProperties: String, propertyName: String, propertyType: String) {
//        let url = URL(string: APIManager.UsersAuth.userEdit)!
//        var request = URLRequest(url: url)
//        request.httpMethod = "PATCH"
//        
//        let boundary = "Boundary-\(UUID().uuidString)"
//        var body = ""
//        
//        // Add text parameters
//        let textParameters = [
//            "userId": userId,
//            "propertyTypeSOC": propertyTypeSOC,
//            "propertyType": propertyType,
//            "propertyName": propertyName,
//            "websiteUrl": websiteUrl,
//            "numberOfProperties": numberOfProperties
//        ] as [String : Any]
//        
//        for (key, value) in textParameters {
//            body += "--\(boundary)\r\n"
//            body += "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n"
//            body += "\(value)\r\n"
//        }
//        
//        body += "--\(boundary)--\r\n"
//        request.httpBody = body.data(using: .utf8)
//        
//        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                if let error = error {
//                    print("Error: \(error)")
//                }
//                return
//            }
//
//            print(String(data: data, encoding: .utf8)!)
//        }
//        
//        task.resume()
//    }
//    
//    func userLoginStatus(userId: String, completion: @escaping (Result<Data, Error>) -> Void) {
//        let apiUrl = URL(string: APIManager.UsersAuth.loginStatus)!
//        var request = URLRequest(url: apiUrl)
//        request.httpMethod = "PATCH"
//        var formData = "userId=\(userId)"
//        request.httpBody = formData.data(using: .utf8)
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
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
//                print("Status code: \(httpResponse.statusCode)")
//                let responseString = String(data: data, encoding: .utf8)
//                print("Response: \(responseString ?? "")")
//                completion(.success(data))
//            } else {
//                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
//            }
//        }
//        task.resume()
//    }
//    
//    //MARK: Get API getDesignation
//    func getDesignation(completion: @escaping (Result<Employee, Error>) -> Void) {
//        let apiUrl = URL(string: APIManager.UsersAuth.getDesignation)!
//        
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
//            
//            do {
//                let decoder = JSONDecoder()
//                let employee = try decoder.decode(Employee.self, from: data)
//                completion(.success(employee))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//    
//    func createUserProperty(parameters: [[String: Any]], authCode: String, completion: @escaping (Result<CreatePropertyModel, Error>) -> Void) {
//        let apiUrl = "https://api.hotelratna.com/api/createProperty"
//        let boundary = "Boundary-\(UUID().uuidString)"
//        
//        AF.upload(
//            multipartFormData: { multipartFormData in
//                for param in parameters {
//                    if param["disabled"] != nil { continue }
//                    let paramName = param["key"] as! String
//                    
//                    if param["type"] as! String == "text" {
//                        let paramValue = param["value"] as! String
//                        multipartFormData.append(paramValue.data(using: .utf8)!, withName: paramName)
//                    } else {
//                        let paramSrc = param["src"] as! String
//                        let fileURL = URL(fileURLWithPath: paramSrc)
//                        multipartFormData.append(fileURL, withName: paramName, fileName: fileURL.lastPathComponent, mimeType: "image/png") // Adjust mimeType as needed
//                    }
//                }
//            },
//            to: apiUrl,
//            method: .post,
//            headers: ["Content-Type": "multipart/form-data; boundary=\(boundary)", "authcode": authCode]
//        )
//        .validate()
//        .responseDecodable(of: CreatePropertyModel.self, decoder: JSONDecoder()) { response in
//            switch response.result {
//            case .success(let result):
//                completion(.success(result))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//    
////    func createProperty(userId: String, authcode: String, amenityIds: String, user: createPropertyModel, completion: @escaping (Result<Data, Error>) -> Void) {
////        guard let url = URL(string: UsersAuth.createProperty) else {
////            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
////            return
////        }
////        var request = URLRequest(url: url)
////        request.httpMethod = "POST"
////        var formData = "userId=\(userId)"
////        formData = "amenityIds=\(amenityIds)"
////        request.httpBody = formData.data(using: .utf8)
////        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
////        request.setValue("Bearer \(authcode)", forHTTPHeaderField: "Authorization")
////        let requestBody: [String: Any] = [
////            "userId": user.userId,
////            "amenityIds": user.amenityIds
////
////        ]
////        do {
////            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
////            request.httpBody = jsonData
////        } catch {
////            completion(.failure(error))
////            return
////        }
////        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
////            if let error = error {
////                completion(.failure(error))
////                return
////            }
////            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
////                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
////                return
////            }
////            if let data = data {
////                completion(.success(data))
////            } else {
////                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
////            }
////        }
////        task.resume()
////    }
//    
//    
//    //MARK: FetchProperty
//    func fetchPropertyData(authCode: String, userId: String, completion: @escaping ([Property]?, Error?) -> Void) {
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer \(authCode)"
//        ]
//        
//        let parameters: Parameters = [
//            "userId": userId
//        ]
//        
//        AF.request(UsersAuth.fetchProperty, method: .get, parameters: parameters, headers: headers)
//            .validate()
//            .responseDecodable(of: [Property].self) { response in
//                switch response.result {
//                case .success(let properties):
//                    self.propertyArray = properties
//                    completion(properties, nil)
//                case .failure(let error):
//                    completion(nil, error)
//                }
//            }
//        
//    }
//    
//    func getPropertyArray() -> [Property] {
//        return propertyArray
//    }
//    
//    //MARK: send Email
//    
//    func sendOtp(email:String, completion: @escaping (SendOtpModel?, Error?) -> Void) {
//        let parameters = ["email": email]
//        let url = URL(string: APIManager.UsersAuth.sendOtp)!
//        let session = URLSession.shared
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        } catch let error {
//            print(error.localizedDescription)
//            completion(nil, error)
//        }
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        let task = session.dataTask(with: request, completionHandler: { data, response, error in
//            
//            guard error == nil else {
//                completion(nil, error)
//                return
//            }
//            guard let data = data else {
//                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
//                return
//            }
//            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
//                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
//                    return
//                }
//                let model = try JSONDecoder().decode(SendOtpModel.self, from: data)
//                print(json)
//                completion(model, nil)
//            } catch let error {
//                print(error.localizedDescription)
//                print(error)
//                completion(nil, error)
//            }
//        })
//        
//        task.resume()
//    }
//    
//    //    func sendOtpForPassword(email: String, completion: @escaping (Result<SendOtpResponse, Error>) -> Void) {
//    //        let parameters = ["email": email]
//    //        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
//    //
//    //        var request = URLRequest(url: URL(string: APIManager.UsersAuth.sendOtp)!,timeoutInterval: Double.infinity)
//    //        request.httpMethod = "POST"
//    //        request.httpBody = jsonData
//    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    //
//    //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    //            guard let data = data else {
//    //                if let error = error {
//    //                    completion(.failure(error))
//    //                }
//    //                return
//    //            }
//    //
//    //            do {
//    //                let httpResponse = response as! HTTPURLResponse
//    //                let decoder = JSONDecoder()
//    //                var result = try decoder.decode(SendOtpResponse.self, from: data)
//    //                result.statusCode = httpResponse.statusCode
//    //                completion(.success(result))
//    //            } catch {
//    //                completion(.failure(error))
//    //            }
//    //        }
//    //
//    //        task.resume()
//    //    }
//    
//    //MARK: verifyOtp
//    
//    func checkOtp(otp: String, completion: @escaping (Result<Data, Error>) -> Void) {
//        let parameters = ["Otp": otp]
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: parameters)
//            
//            var request = URLRequest(url: URL(string: APIManager.UsersAuth.verifyOtp)!,timeoutInterval: Double.infinity)
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpMethod = "POST"
//            request.httpBody = jsonData
//            
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                guard let data = data else {
//                    completion(.failure(error ?? NSError(domain: "No data received", code: 1, userInfo: nil)))
//                    return
//                }
//                
//                if let httpResponse = response as? HTTPURLResponse {
//                    print("Status Code: \(httpResponse.statusCode)")
//                    let message = String(data: data, encoding: .utf8) ?? "No response message"
//                    
//                    if httpResponse.statusCode == 200 {
//                        print("success Password Update Successfully")
//                    } else {
//                        // Status code other than 200, handle error
//                        completion(.failure(NSError(domain: "Verification failed", code: httpResponse.statusCode, userInfo: ["message": message])))
//                    }
//                }
//            }
//            
//            task.resume()
//        } catch {
//            completion(.failure(error))
//        }
//    }
//    
//    static func resetPassword(email: String, password: String,  confirmPassword: String, completion: @escaping (Result<ResetPasswordResponse, Error>) -> Void) {
//        let parameters: [String: String] = [
//            "email": email,
//            "password": password,
//            "confirmPassword": confirmPassword
//        ]
//        
//        AF.request(APIManager.UsersAuth.resetPassword, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"])
//            .validate()
//            .responseDecodable(of: ResetPasswordResponse.self) { response in
//                switch response.result {
//                case .success(let result):
//                    completion(.success(result))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
    
    //MARK: Configuration Get API
    //MARK: getRoom
    func getRoomData(userId: String, propertyId: String, targetTimeZone: String, authcode: String) {
        var request = URLRequest(url: URL(string: "\(NetworkManager.UsersAuth.getRoom)?targetTimeZone=\(targetTimeZone)&propertyId=\(propertyId)&userId=\(userId)")!,timeoutInterval: Double.infinity)
        request.addValue(authcode, forHTTPHeaderField: "authcode")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    
    func fetchDataForUserID(_ userId: String, authCode: String) {
        let urlString = "https://your-api-endpoint.com/user/\(userId)"
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }
        
        task.resume()
    }
    
    
    
    
    //MARK: getInclusion
    func getInclusionData(userId: String, propertyId: String, authcode: String) {
        var request = URLRequest(url: URL(string: "\(NetworkManager.UsersAuth.getInclusion)?userId=\(userId)&propertyId=\(propertyId)")!,timeoutInterval: Double.infinity)
        request.addValue(authcode, forHTTPHeaderField: "authcode")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    func getInclusionData(forUserID userId: String, withAuthCode authCode: String) {
        let urlString = "https://your-api-endpoint.com/user/\(userId)/inclusion"
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
    
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")

            }
        }
        
        task.resume()
    }
    
    
    
    //MARK: getRatePlanList
    func getRatePlanListData(userId: String, roomTypeId: String, authcode: String) {
        
        var request = URLRequest(url: URL(string: "\(NetworkManager.UsersAuth.getRatePlansList)?roomTypeId=\(roomTypeId)&userId=\(userId)")!,timeoutInterval: Double.infinity)
        request.addValue(authcode, forHTTPHeaderField: "authcode")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    
    func getRatePlanListData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for rate plan data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/rateplan"
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }
        
        task.resume()
    }
    
    
    
    //MARK: getRoomList
    func getRoomListData() {
        
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getRoomList?propertyId=150860&userId=pkq7DOrv")!,timeoutInterval: Double.infinity)
        request.addValue("f3ae171576e8fb73712570a85353d44272a8d83daf125ab07aa5a4128fcb0f09c28893b6047361a64134305e17b7c286341d8a2d8573b5c0fc06fb7e2601f3c0", forHTTPHeaderField: "authcode")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    
    func getRoomListData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for room list data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/rooms" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }
        
        task.resume()
    }
    
    
    
    //MARK: getRoomTypeWithTotalRoom
    
    func getRoomTypeWithTotalRoomData() {
        
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getRoomType?propertyId=641156&userId=vxYNlgcj")!,timeoutInterval: Double.infinity)
        request.addValue("034c13295dc6740af5128a49e8a43918ed869d50ebf6d3438e03952830b67d850205ee215ce229b01699a5ddcc31653a5cc941ac972d0a53035c66c2014e8ecd", forHTTPHeaderField: "authcode")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    
    func getRoomTypeWithTotalRoomData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for room type with total room data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/roomTypeWithTotalRoom" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }
        
        task.resume()
    }
    
    
    //MARK: getRoomByRoomTypeId
    
    func getRoomByRoomTypeIdData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/fetchRoom?userId=pkq7DOrv&roomTypeId=kUvmDw82")!,timeoutInterval: Double.infinity)
        request.addValue("f2278b47396ed1d5d94869c768b1bd1fa8302ad14376be5fd0f2b06154e59c5dbe29fc9dc6e917df8a0f706760859ca7c30e49cdae084fb647f31aff973e93bc", forHTTPHeaderField: "authcode")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    
    func getRoomByRoomTypeIdData(forUserID userId: String, withAuthCode authCode: String, roomTypeId: String) {
        // Replace the URL string with your API endpoint for fetching room by room type ID
        let urlString = "https://your-api-endpoint.com/user/\(userId)/roomsByRoomType/\(roomTypeId)" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }
        
        task.resume()
    }
    
    //MARK: getUserProperty
    func getUserPropertyData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/fetchProperty?userId=vxYNlgcj&targetTimeZone=Asia%2FKolkata")!,timeoutInterval: Double.infinity)
        request.addValue("034c13295dc6740af5128a49e8a43918ed869d50ebf6d3438e03952830b67d850205ee215ce229b01699a5ddcc31653a5cc941ac972d0a53035c66c2014e8ecd", forHTTPHeaderField: "authcode")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    func getUserPropertyData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for user property data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/property" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }
        
        task.resume()
    }
    
    
    //MARK: getPropertyByPropertyId
    func getPropertyByPropertyIdData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getPropertyById?userId=pkq7DOrv&propertyId=677842")!,timeoutInterval: Double.infinity)
        request.addValue("37b0d660901777199bf70b8938bcd5021772e7f317a4e585fa16c7c8cf299330fa070dd0ad426b86f7f173beb27aa30f989db148c4b6772a35246a4fb0863f44", forHTTPHeaderField: "authcode")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    
    func getPropertyByPropertyIdData(forUserID userId: String, withAuthCode authCode: String, propertyId: String) {
        // Replace the URL string with your API endpoint for fetching property by property ID
        let urlString = "https://your-api-endpoint.com/user/\(userId)/property/\(propertyId)" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }
        
        task.resume()
    }
    
    
    
    //MARK: getIdentity
    func getIdentityData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/fetchIdentity?userId=w70ZcdoY&propertyId=316959")!,timeoutInterval: Double.infinity)
        request.addValue("bbe50034eae85e2058419d46e2f3e70259641a7886cd70cf83739b3e2d52d9d3177e943fab62c214ad90114f107f89613ecaf13ea9d09fb82d0e9a4df0552ddb", forHTTPHeaderField: "authcode")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getIdentityData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for identity data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/identity" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: getBarRatePlan
    func getBarRatePlanData() {
        let parameters = "{\r\n    \"propertyId\":\"ndcnncx\",\r\n    \"floorInHotel\":[{\r\n        \"floorName\":[{\r\n         \"floorName\":\"one\"\r\n        }],\r\n        \"roomsInFloor\":[{\r\n            \"roomsInFloor\":\"10\"\r\n        }]  \r\n    },\r\n    {\r\n       \"floorName\":[{\r\n         \"floorName\":\"one\"\r\n        }]\r\n    }]\r\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getBarRatePlans?propertyId=641156&userId=vxYNlgcj")!,timeoutInterval: Double.infinity)
        request.addValue("034c13295dc6740af5128a49e8a43918ed869d50ebf6d3438e03952830b67d850205ee215ce229b01699a5ddcc31653a5cc941ac972d0a53035c66c2014e8ecd", forHTTPHeaderField: "authcode")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

        
    }
    func getBarRatePlanData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for bar rate plan data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/barRatePlan" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: getCompanyPlan
    func getCompanyPlanData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getCompanyPlans?userId=vxYNlgcj&propertyId=641156")!,timeoutInterval: Double.infinity)
        request.addValue("034c13295dc6740af5128a49e8a43918ed869d50ebf6d3438e03952830b67d850205ee215ce229b01699a5ddcc31653a5cc941ac972d0a53035c66c2014e8ecd", forHTTPHeaderField: "authcode")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
        
    }
    
    func getCompanyPlanData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for company plan data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/companyPlan" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: getAllRatePlanByPropertyID
    func getAllRatePlanByPropertyIDData() {
        
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getAllRatePlans?propertyId=150860&userId=vxYNlgcj")!,timeoutInterval: Double.infinity)
        request.addValue("034c13295dc6740af5128a49e8a43918ed869d50ebf6d3438e03952830b67d850205ee215ce229b01699a5ddcc31653a5cc941ac972d0a53035c66c2014e8ecd", forHTTPHeaderField: "authcode")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getAllRatePlanByPropertyIDData(forUserID userId: String, withAuthCode authCode: String, propertyID: String) {
        // Replace the URL string with your API endpoint for fetching rate plans by property ID
        let urlString = "https://your-api-endpoint.com/user/\(userId)/property/\(propertyID)/ratePlans" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    //MARK: getDiscountAllPlan
    func getDiscountAllPlanData() {
        
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getAllDiscountPlans?userId=pkq7DOrv&propertyId=150860")!,timeoutInterval: Double.infinity)
        request.addValue("912b42f24602361e747148f208d320e84944e78bd07a3950e594dd07504c0f43c2c555bf7ce56976f86ef06d6985445e52c67c3592ce1362c32aabe1e5f27b74", forHTTPHeaderField: "authcode")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getDiscountAllPlanData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for discount all plan data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/discountAllPlan" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: getDiscountRatePlanById       404code error
    func getDiscountRatePlanByIdData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getDiscountPlanById?userId=w70ZcdoY&discountPlanId=")!,timeoutInterval: Double.infinity)
        request.addValue("1f60980832ddceb5415a274434e13b40ea03edb5ff289330de9b26072f066d1f5e9af1ca6564991263dbe4f78dfc525b8d8b6cb644946e5597220b11d15fda11", forHTTPHeaderField: "authcode")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

        
    }
    
    func getDiscountRatePlanByIdData(forUserID userId: String, withAuthCode authCode: String, ratePlanId: String) {
        // Replace the URL string with your API endpoint for fetching discount rate plan by ID
        let urlString = "https://your-api-endpoint.com/user/\(userId)/discountRatePlan/\(ratePlanId)" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    
    //MARK: getBarRatePlanByRatePlanId
    func getBarRatePlanByRatePlanIdData() {
        
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getBarPlanById?barRatePlanId=0GfA8bSl&userId=vxYNlgcj")!,timeoutInterval: Double.infinity)
        request.addValue("034c13295dc6740af5128a49e8a43918ed869d50ebf6d3438e03952830b67d850205ee215ce229b01699a5ddcc31653a5cc941ac972d0a53035c66c2014e8ecd", forHTTPHeaderField: "authcode")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getBarRatePlanByRatePlanIdData(forUserID userId: String, withAuthCode authCode: String, ratePlanId: String) {
        // Replace the URL string with your API endpoint for fetching bar rate plan by rate plan ID
        let urlString = "https://your-api-endpoint.com/user/\(userId)/barRatePlan/\(ratePlanId)" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
   
    //MARK: getCompanyByCompanyRatePlanId
    func getCompanyByCompanyRatePlanIdData() {
        
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getCompanyRatePlans?userId=pkq7DOrv&companyRatePlanId=F0fDpqWqZR")!,timeoutInterval: Double.infinity)
        request.addValue("912b42f24602361e747148f208d320e84944e78bd07a3950e594dd07504c0f43c2c555bf7ce56976f86ef06d6985445e52c67c3592ce1362c32aabe1e5f27b74", forHTTPHeaderField: "authcode")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    func getCompanyByCompanyRatePlanIdData(forUserID userId: String, withAuthCode authCode: String, companyRatePlanId: String) {
        // Replace the URL string with your API endpoint for fetching company by company rate plan ID
        let urlString = "https://your-api-endpoint.com/user/\(userId)/companyByCompanyRatePlan/\(companyRatePlanId)" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    //MARK: getAccountType
    func getAccountTypeData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getAccountType")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    func getAccountTypeData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for account type data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/accountType" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    
    //MARK: getBedType
    func getBedTypeData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getBedType")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getBedTypeData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for bed type data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/bedType" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: getPropertyType
    func getPropertyTypeData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getPropertyType")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getPropertyTypeData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for property type data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/propertyType" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

   
    
    //MARK: getPropertyRating
    func getPropertyRatingData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getRating")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getPropertyRatingData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for property rating data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/propertyRating" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: getDesignation
    func getDesignationData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getDesignation")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getDesignationData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for designation data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/designation" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    //MARK: getAmenityType
    func getAmenityTypeData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getAmenityType")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    func getAmenityTypeData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for amenity type data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/amenityType" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    
    //MARK: getAmenityIcon
    func getAmenityIconData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getAmenityIcon")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    func getAmenityIconData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for amenity icon data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/amenityIcon" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
   
    
    //MARK: getAmenity
    func getAmenityData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getAmenity?propertyId=")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getAmenityData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for amenity data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/amenity" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: getRateTypeName
    func getRateTypeNameData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getRateTypeName")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getRateTypeNameData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for rate type name data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/rateTypeName" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: GetOTA         404 error
    func GetOTAData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getOta")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    func getOTAData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for OTA data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/OTA" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
  
    //MARK: getInclusionType
    func getInclusionTypeData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getInclusionType")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    func getInclusionTypeData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for inclusion type data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/inclusionType" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
   
    //MARK: getUpComingOta
    func getUpComingOtaData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getUpComingOta")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    func getUpComingOtaData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for upcoming OTA data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/upcomingOTA" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    
    //MARK: getActiveOta
    func getActiveOtaData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getActiveOta")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func getActiveOtaData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for active OTA data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/activeOTA" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    
    //MARK: rateName
    func rateNameData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/rateName")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    func rateNameData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for rate name data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/rateName" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
    
    //MARK: fetchRoomAmenity
    func fetchRoomAmenityData() {
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getRoomAmenity?propertyId=150860")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    func fetchRoomAmenityData(forUserID userId: String, withAuthCode authCode: String) {
        // Replace the URL string with your API endpoint for room amenity data
        let urlString = "https://your-api-endpoint.com/user/\(userId)/roomAmenity" // Example URL
        guard let apiUrl = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: apiUrl)
        request.addValue(authCode, forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            // Handle the data received - parse or use it as needed
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseDataString)")
                // Parse the data into your model if it's JSON, similar to previous examples
            }
        }

        task.resume()
    }

    
}
