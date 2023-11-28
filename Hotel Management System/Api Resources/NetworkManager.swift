//
//  ApiRequest.swift
//  Hotel Management System
//
//  Created by mayur bobade on 13/11/23.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    static let baseURL = "https://api.hotelratna.com/api"
    
    struct UsersAuth {
        
        //MARK: - GET
        static let getDesignation = baseURL + "/getDesignation"
        
        //MARK: - POST
        static let signUpUser = baseURL + "/addUser"
        static let loginUser = baseURL + "/userLogin"
        static let createProperty = baseURL + "/createProperty"
        
        //MARK: - PATCH
        static let userEdit = baseURL  + "/userEdit"
        static let loginStatus = baseURL  + "/loginStatus"
    }
    
    private init() {}
    
    func SignUpUser(user: SignUpModel, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: UsersAuth.signUpUser) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue(userId, forHTTPHeaderField: "X-UserId")
        //request.addValue(authToken, forHTTPHeaderField: "Authorization")
        let requestBody: [String: Any] = [
            "firstName":user.firstName,
            "lastName":user.lastName,
            "designation":user.designation,
            "phoneNumber":user.phoneNumber,
            "email":user.email,
            "password":user.password
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
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
                completion(.success(data))
                let defaults = UserDefaults.standard
                defaults.set(data, forKey: "SignUp")
                if let user = UserDefaults.standard.string(forKey: "SignUp") {
                    print(".......data Stored SuccessFully ....\(user)")
                }
            } else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
    
    func loginUser(userId: String, authToken: String, user: LoginModel, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: UsersAuth.loginUser) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(ConstantIDs.authcode, forHTTPHeaderField: "authcode")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let requestBody: [String: Any] = [
            "username": user.username,
            "hotelCode": user.hotelCode,
            "password": user.password,
            "deviceType": user.deviceType
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
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
                ////completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
    
    //MARK: Patch API UserEdit
        func userUdatePropertySelection(userId: String, ratePercent: String, roomsInProperty: String, taxName: String, registrationNumber: String, propertyTypeSOC: String, websiteUrl: String, hotelLogo: String, numberOfProperties: String, baseCurrency: String, propertyAddress1: String, propertyName: String, propertyTypeName: String, postCode: String, state: String, city: String, taxPercent: String , starCategory: String, completion: @escaping (Result<Data, Error>) -> Void) {
            let apiUrl = URL(string: APIManager.UsersAuth.userEdit)!
            var request = URLRequest(url: apiUrl)
            request.httpMethod = "PATCH"
            var formData = "userId=\(userId)"
            formData += "&ratePercent=\(ratePercent)"
            formData += "&roomsInProperty=\(roomsInProperty)"
            formData += "&taxName=\(taxName)"
            formData += "&registrationNumber=\(registrationNumber)"
            formData = "propertyTypeSOC=\(userId)"
            formData += "&websiteUrl=\(websiteUrl)"
            formData += "&hotelLogo=\(hotelLogo)"
            formData += "&numberOfProperties=\(numberOfProperties)"
            formData += "&baseCurrency=\(baseCurrency)"
            formData = "propertyAddress1=\(propertyAddress1)"
            formData += "&propertyName=\(propertyName)"
            formData += "&propertyTypeName=\(propertyTypeName)"
            formData += "&postCode=\(postCode)"
            formData += "&state=\(state)"
            formData += "&city=\(city)"
            formData += "&starCategory=\(starCategory)"
            formData += "&taxName=\(taxName)"
            formData += "&registrationNumber=\(registrationNumber)"
            formData += "&taxPercent=\(taxPercent)"
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
    
    
    func createProperty(userId: String, authcode: String, amenityIds: String, user: createPropertyModel, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: UsersAuth.createProperty) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var formData = "userId=\(userId)"
        formData = "amenityIds=\(amenityIds)"
        request.httpBody = formData.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(authcode)", forHTTPHeaderField: "Authorization")
        let requestBody: [String: Any] = [
            "userId": user.userId,
            "amenityIds": user.amenityIds
            
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
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
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
}
