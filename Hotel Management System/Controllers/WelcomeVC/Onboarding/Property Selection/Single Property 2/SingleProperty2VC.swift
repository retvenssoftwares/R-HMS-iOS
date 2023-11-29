//
//  SingleProperty2VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 21/11/23.
//

import UIKit
import iOSDropDown
import Alamofire
class SingleProperty2VC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var starRateView: CosmosView!
    @IBOutlet weak var txtFieldTaxNo: UITextField!
    @IBOutlet weak var txtFieldNumberOfProperty: DropDown!
    @IBOutlet weak var txtFieldRegistrationNumber: UITextField!
    @IBOutlet weak var txtFieldTaxRate: DropDown!
    let noOfPropertyList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let taxRates = ["8.05", "9.10", "10.15", "11.20", "12.25"]
    var  imgProfile:String?
    var txtFieldPropertyName: String?
    var txtFieldPropertyType: String?
    var txtFieldAddress: String?
    var txtFieldCountry: String?
    var txtFieldState: String?
    var txtFieldCity: String?
    var txtFieldZIPCode: String?
    var txtFieldWebsite: String?
    var genericPropertyName: String = ""
    var genericpropertyType: String = "Single"
    var genericaddress: String = ""
    var genericimage: String = ""
    var genericcountry: String = ""
    var genericstate : String = ""
    var genericcity: String = ""
    var genericzipCode: String = ""
    var genericwebsite : String = ""
    var name = "Single"
    var verificationDone : String =  ""
    
    
    let authcode = "ca78b37fdf4736a191f2826e7e40062d52206fa7377ad7ad5c5d2df3fe667c1994e9399b6f222d720f1f357907213b95451e476eceed8987652c11bedd5c52ad"
        // MARK: - Outlet
        var d:Pr?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        txtFieldNumberOfProperty.optionArray = noOfPropertyList
        txtFieldTaxRate.optionArray = taxRates
        setupValue()
    }
    
    func setupValue() {
        if let propertyName = txtFieldPropertyName {
            genericPropertyName = propertyName
        }
        if let propertyType = txtFieldPropertyType {
            genericpropertyType = propertyType
        }
        if let country = txtFieldCountry {
            genericcountry = country
        }
        if let city = txtFieldCity {
            genericcity = city
        }
        if let zipCode = txtFieldZIPCode {
            genericzipCode = zipCode
        }
        if let website = txtFieldWebsite {
            genericwebsite = website
        }
    }
    
//    func updatePropertyTypeSOC(propertyTypeSOC: String) {
//           // Additional parameters you want to send in the PATCH request
//           let parameters: [String: Any] = [
//            "userId": "userId",
//               "propertyTypeSOC": propertyTypeSOC,
//               "websiteUrl": txtFieldWebsite,
//               "hotelLogo": genericimage,
//            "numberOfProperties": txtFieldNumberOfProperty.text,
//               "propertyType": genericpropertyType,
//               "baseCurrency": "INR",
//               "propertyAddress1": txtFieldAddress,
//               "propertyName": genericPropertyName,
//               "propertyTypeName": genericpropertyType,
//               "postCode": genericzipCode,
//               "state": genericstate,
//               "city": genericcity,
//            "starCategory": starRateView.rating,
//               "ratePercent": taxRates,
//            "roomsInProperty": txtFieldNumberOfProperty.text,
//            "taxName": txtFieldTaxNo.text,
//            "registrationNumber": txtFieldRegistrationNumber.text
//           ]
//        
//           patchRequest(parameters: parameters) { responseData in
//               print("para:\(parameters)")
//               print("Response data: \(responseData)")
//           }
//       }

//       func patchRequest(parameters: [String: Any], completion: @escaping ([String: Any]) -> Void) {
//           var url =  URL(string: "https://api.hotelratna.com/api/userEdit")!
//           var request = URLRequest(url: url)
//           request.httpMethod = "PATCH"
//           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//           do {
//               let jsonData = try JSONSerialization.data(withJSONObject: parameters)
//               request.httpBody = jsonData
//           } catch {
//               print("Error converting parameters to JSON: \(error)")
//               return
//           }
//
//           let task = URLSession.shared.dataTask(with: request) { data, response, error in
//               if let error = error {
//                   print("Error: \(error.localizedDescription)")
//                   return
//               }
//               if let data = data {
//                   if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                       completion(jsonResponse)
//                   }
//               }
//           }
//
//           task.resume()
//       }
    
    func createUserEdit(with dataModel: propertyUpdate) -> URLRequest? {
        // Replace the URL with your API endpoint
        guard let url = URL(string: APIManager.UsersAuth.userEdit) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Encode the data model to JSON and set it as the request body
        do {
            request.httpBody = try JSONEncoder().encode(dataModel)
            return request
        } catch {
            print("Error encoding data model: \(error)")
            return nil
        }
    }
    
    func sendPatchRequest(with dataModel: propertyUpdate) {
        guard let request = createUserEdit(with: dataModel) else {
            print("Failed to create PATCH request.")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")

                if let data = data {
                    // Process the response data
                    do {
                        let decodedData = try JSONDecoder().decode(propertyUpdate.self, from: data)
                        print("Decoded Data: \(decodedData)")
                    } catch {
                        print("Error decoding response data: \(error)")
                    }
                }
            }
        }

        task.resume()
    }
    
    // MARK: - patch service
    
    func updateProperty(propertyTypeSOC: String, authcode: String) {
        // Your API endpoint URL
        let apiUrl = "https://api.hotelratna.com/api/userEdit"

        // Your authentication code
        let authCode = authcode

        // Your request parameters
        let parameters: Parameters = [
            "propertyTypeSOC": propertyTypeSOC
        ]

        // Your request headers
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(authCode)",
            "Content-Type": "application/json"
        ]

        // Perform the PATCH request
        AF.request(apiUrl, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Update successful: \(value)")
                case .failure(let error):
                    print("Error updating resource: \(error)")
                }
            }
    }
//    func patchPropertyTypeSOC(urlString: String, propertyTypeSOC: String, completion: @escaping (Result<Void, Error>) -> Void) {
//       
//        let urlString = "https://api.hotelratna.com/api/userEdit"
//        let newPropertyTypeSOC = "Single"
//
//        guard let url = URL(string: urlString) else {
//            completion(.failure(URLError(.badURL)))
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "PATCH"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("Bearer \(authcode)", forHTTPHeaderField: "Authorization")
//
//        let propertyData = CreatePropertyModel(message: "200",propertyTypeSOC: "Single")
//        let patchOperations = [propertyData]
//        print(patchOperations)
//
//        do {
//            let encoder = JSONEncoder()
//            let encodedData = try encoder.encode(patchOperations)
//            request.httpBody = encodedData
//        } catch {
//            completion(.failure(error))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard
//     
//    let data = data else {
//                completion(.failure(URLError(.badServerResponse)))
//                return
//            }
//
//            // Check for successful response code
//        print("success")
//            completion(.success(()))
//        }
//
//        task.resume()
//    }
    
//    func updateuserPropertyData(createPropertyName: CreatePropertyModel) {
//    
//        //Updating the user Interest
//        print("Starting to update user profile without image")
//        print("using these info to update: ")
//        print(createPropertyName.propertyTypeSOC)
//        print(createPropertyName.statuscode)
//        print(createPropertyName.userId)
//        var url =  URL(string: "https://api.hotelratna.com/api/userEdit")!
//        var request = URLRequest(url: url)
//
//        // Create & Add data to the model
//        let body: [String: AnyHashable] = [
//            "propertyTypeSOC": createPropertyName.propertyTypeSOC,
//            "userId": createPropertyName.userId
//        ]
//        // Create the request
//        //var request = URLRequest(url: url)
//        request.httpMethod = "PATCH"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        // Convert request to JSON data
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                guard error == nil else {
//                    print("Error: error calling PATCH")
//                    print(error!)
//                    return
//                }
//                guard let data = data else {
//                    print("Error: Did not receive data")
//                    return
//                }
//                guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
//                    print("Error: HTTP request failed")
//                    return
//                }
//                do {
//                    let decoder = JSONDecoder()
//                    let decodedData = try decoder.decode(CreatePropertyModel.self, from: data)
//
//                    print("user data updated on server")
//                    //self.updateMesiboDataOnUserProfile(loginData: loginData)
//                } catch {
//                    print("Error: Trying to convert JSON data to string")
//                    return
//                }
//            }
//        }
//        task.resume()
//    
//    }
    
//    func call() {
//        let urlString = "https://api.hotelratna.com/api/userEdit"
//        let propertyTypeSOC = "Single"
//    
//       // patchPropertyTypeSOC(urlString: urlString, propertyTypeSOC: propertyTypeSOC) { result in
//            switch result {
//            case .success(_):
//                print("PropertyTypeSOC updated successfully")
//            case .failure(let error):
//                print("Error updating propertyTypeSOC:", error)
//            }
//        }
//       
    
    
    
    func sendPatchRequest(model: Pr, authToken: String, completion: @escaping (Error?) -> Void) {
            var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/userEdit")!)
            request.httpMethod = "PATCH"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")

            do {
                // Convert Pr to JSON data
                let jsonData = try JSONEncoder().encode(model)
                request.httpBody = jsonData
            } catch {
                completion(error)
                return
            }

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    // Print more information about the error
                    print("Error sending PATCH request: \(error.localizedDescription)")
                    if let underlyingError = (error as NSError).userInfo[NSUnderlyingErrorKey] as? NSError {
                        print("Underlying error: \(underlyingError.localizedDescription)")
                    }
                    completion(error)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    // Print response details for non-2xx status codes
                    if let data = data, let responseString = String(data: data, encoding: .utf8) {
                        print("Response Data: \(responseString)")
                    }

                    completion(NSError(domain: "PatchError", code: 0, userInfo: nil))
                    return
                }

                // Print response details for 2xx status codes
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    print("Response Data: \(responseString)")
                }

                // Handle the response data if needed
                // For example, you might parse a JSON response

                completion(error)
            }

            task.resume()
        }
    // MARK: - Action
    @IBAction func submitBtnPressed(_ sender: CustomButton) {
//        sendPatchRequest(model: d ?? propertyUpdate , authToken: authToken) { error in
//
//                    if let error = error {
//                        print("Error sending PATCH request: \(error.localizedDescription)")
//                    } else {
//                        print("PATCH request sent successfully.")
//                        print(self.d?.statuscode, self.d?.message)
//                    }
//                }
        //call()
        updateProperty(propertyTypeSOC: "Single", authcode: authcode)
        //let yourData = propertyUpdate(propertyTypeSOC: "Single")
        //sendPatchRequest(with: yourData)
       // updateuserPropertyData(createPropertyName: CreatePropertyModel())
        let vc = self.storyboard?.instantiateViewController(identifier: "OnboardingVarificationPandingVC") as! OnboardingVarificationPandingVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
