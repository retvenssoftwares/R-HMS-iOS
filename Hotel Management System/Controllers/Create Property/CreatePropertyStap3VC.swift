//
//  CreatePropertyStap3VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 17/11/23.
//

import UIKit
import PhotosUI
import Alamofire

class CreatePropertyStap3VC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var createPropertyCollectionCell: UICollectionView!
    
    var arrImage = [UIImage]()
    var arrImageBadRoom = [UIImage]()
    var bedRoomSelect: Bool = false
    var sectionsData: [SectionData] = []
    var userIds: String = ""
    var countrys: String = ""
    var states: String = ""
    var citys: String = ""
    var propertyAddresss: String = ""
    var propertyAddressTwos: String = ""
    var authcodes: String = ""
    var ratings: String = ""
    var amenityIds: String = ""
    var latitudes: String = ""
    var longitudes: String = ""
    var propertyDescriptions: String = ""
    var urls: String = ""
    var emails: String = ""
    var phones: String = ""
    var rPhones: String = ""
    var propertyNames: String = ""
    var noOfBedss: String = ""
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        createPropertyCollectionCell.register(UINib(nibName: "PropertyProfileCollectionCell", bundle: .main), forCellWithReuseIdentifier: "PropertyProfileCollectionCell")
        self.createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CreatePropertyHeaderCell")
        createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderTwoCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CreatePropertyHeaderTwoCollectionViewCell")
        
        //        createPropertyCollectionCell.collectionViewLayout = createCompositionalLayout()
        
    }
    
    
    func postProperty(_ property: Property) {
        guard let url = URL(string: "https://api.hotelratna.com/api/createProperty") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(authcodes, forHTTPHeaderField: "authcode")
        print(authcodes)
        
        do {
            let jsonData = try JSONEncoder().encode(property)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    print("Status Code: \(statusCode)")
                    
                    if let data = data {
                        do {
                            let responseModel = try JSONDecoder().decode(PostResponse.self, from: data)
                            print("Response Model: \(responseModel)")
                            // Handle the response as needed
                        } catch {
                            print("Error decoding response: \(error.localizedDescription)")
                        }
                    }
                }
            }
            
            task.resume()
        } catch {
            print("Error encoding property to JSON: \(error.localizedDescription)")
        }
    }
    
    func setupCollectionView() {
        createPropertyCollectionCell.dataSource = self
        createPropertyCollectionCell.delegate = self
        createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderCell", bundle: nil), forCellWithReuseIdentifier: "CreatePropertyHeaderCell")
        createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderTwoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CreatePropertyHeaderTwoCollectionViewCell")
        
        // Set up sectionsData based on the number of sections in your collection view
        sectionsData = Array(repeating: SectionData(), count: 2)
    }
    // MARK: - Function
    
    //MARK: CreateUserProperty
    //    func createProperty(authcode: String, propertyName: String, propertyType: String) 3
    
    
    //    func postRequestLogin(propertyName:String, PropertyType:String, propertyRating:String, completion: @escaping (ModelLogin?, Error?) -> Void) {
    //
    //        let parameters = ["propertyName":propertyName, "PropertyType":PropertyType, "propertyRating":propertyRating ]
    //        let url = URL(string: "https://api.hotelratna.com/api/createProperty")!
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
    //                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
    //                    return
    //                }
    //                let model = try JSONDecoder().decode(ModelLogin.self, from: data)
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
    
    func createMultipartFormDataRequest(url: String, parameters: [String: Any], files: [String: String], authCode: String, completion: @escaping (Result<(propertyId: String, message: String, statusCode: Int), Error>) -> Void) {
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        
        // Add parameters to the body
        for (key, value) in parameters {
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(key)\""
            
            if let textValue = value as? String {
                body += "\r\n\r\n\(textValue)\r\n"
            }
        }
        
        // Add files to the body
        for (key, filePath) in files {
            if let fileData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
                body += "--\(boundary)\r\n"
                body += "Content-Disposition:form-data; name=\"\(key)\"; filename=\"\(URL(fileURLWithPath: filePath).lastPathComponent)\"\r\n"
                body += "Content-Type: \"content-type header\"\r\n\r\n"
                body += String(data: fileData, encoding: .utf8) ?? ""
                body += "\r\n"
            }
        }
        
        body += "--\(boundary)--\r\n"
        
        if let postData = body.data(using: .utf8) {
            var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
            request.addValue(authCode, forHTTPHeaderField: "authcode")
            request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "POST"
            request.httpBody = postData
            
            // Declare 'task' before the closure
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    completion(.failure(error ?? NSError(domain: "UnknownError", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(YourResponseType.self, from: data)
                    
                    // Extract relevant properties from the response model
                    let propertyId = responseModel.propertyId
                    let message = responseModel.message
                    let statusCode = responseModel.statusCode
                    
                    completion(.success((propertyId: propertyId, message: message, statusCode: statusCode)))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    }
    
    func imagePick() {
        var config1 = PHPickerConfiguration()
        config1.selectionLimit = 8
        let phpPickerVC = PHPickerViewController(configuration: config1)
        phpPickerVC.delegate = self
        self.present(phpPickerVC, animated: true)
    }
    
    // MARK: - Action
    @IBAction func bigAddImageBtnPressed(_ sender: UIButton) {
        //   call()
    }
    @IBAction func addImageBtnPressed(_ sender: UIButton) {
        
        if bedRoomSelect == true {
            imagePick()
        } else {
            var config = PHPickerConfiguration()
            config.selectionLimit = 8
            let phpPickerVC = PHPickerViewController(configuration: config)
            phpPickerVC.delegate = self
            self.present(phpPickerVC, animated: true)
        }
    }
    
    //    func createMultipartFormDataRequest(url: String, parameters: [String: Any], files: [String: String], authCode: String) {
    //        let boundary = "Boundary-\(UUID().uuidString)"
    //        var body = ""
    //
    //        // Add parameters to the body
    //        for (key, value) in parameters {
    //            body += "--\(boundary)\r\n"
    //            body += "Content-Disposition:form-data; name=\"\(key)\""
    //
    //            if let textValue = value as? String {
    //                body += "\r\n\r\n\(textValue)\r\n"
    //            }
    //        }
    //
    //        // Add files to the body
    //        for (key, filePath) in files {
    //            if let fileData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
    //                body += "--\(boundary)\r\n"
    //                body += "Content-Disposition:form-data; name=\"\(key)\"; filename=\"\(URL(fileURLWithPath: filePath).lastPathComponent)\"\r\n"
    //                body += "Content-Type: \"content-type header\"\r\n\r\n"
    //                body += String(data: fileData, encoding: .utf8) ?? ""
    //                body += "\r\n"
    //            }
    //        }
    //
    //        body += "--\(boundary)--\r\n"
    //
    //        if let postData = body.data(using: .utf8) {
    //            var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
    //            request.addValue(authCode, forHTTPHeaderField: "authcode")
    //            request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    //
    //            request.httpMethod = "POST"
    //            request.httpBody = postData
    //
    //            let task = URLSession.shared.dataTask(with: request) { data, response, error in
    //                guard let data = data else {
    //                    print(String(describing: error))
    //                    return
    //                }
    //                print(String(data: data, encoding: .utf8)!)
    //
    //            }
    //
    //            task.resume()
    //        }
    //    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func createMultipartFormDataRequests(
        url: String,
        parameters: [String: Any],
        files: [String: String],
        authCode: String,
        completion: @escaping (Result<YourResponseType, Error>) -> Void
    ) {
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        
        // Add parameters to the body
        for (key, value) in parameters {
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(key)\""
            
            if let textValue = value as? String {
                body += "\r\n\r\n\(textValue)\r\n"
            }
        }
        
        // Add files to the body
        for (key, filePath) in files {
            if let fileData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
                body += "--\(boundary)\r\n"
                body += "Content-Disposition:form-data; name=\"\(key)\"; filename=\"\(URL(fileURLWithPath: filePath).lastPathComponent)\"\r\n"
                body += "Content-Type: \"content-type header\"\r\n\r\n"
                body += String(data: fileData, encoding: .utf8) ?? ""
                body += "\r\n"
            }
        }
        
        body += "--\(boundary)--\r\n"
        
        if let postData = body.data(using: .utf8) {
            var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
            request.addValue(authCode, forHTTPHeaderField: "authcode")
            request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "POST"
            request.httpBody = postData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    completion(.failure(NSError(domain: "InvalidResponse", code: 0, userInfo: nil)))
                    return
                }
                
                print("Status Code: \(httpResponse.statusCode)")
                
                guard let data = data else {
                    print("No data received")
                    completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(YourResponseType.self, from: data)
                    completion(.success(responseModel))
                } catch {
                    print("Error decoding response: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    }
    
    func createProperty(authCode: String, userID: String, parameters: [[String: Any]], completion: @escaping (Result<CreatePropertyResponse, AFError>) -> Void) {
        var hotelLogo = loadImageFromUserDefaults(key: "hotelLogo")
        print(hotelLogo?.toData())
        if let userId = UserDefaults.standard.string(forKey: "userId") {
            userIds = userId
            print(userIds)
        }
        
        if let state = UserDefaults.standard.string(forKey: "state") {
            states = state
            print(states)
        }
        if let city = UserDefaults.standard.string(forKey: "city") {
            citys = city
            print(citys)
        }
        if let country = UserDefaults.standard.string(forKey: "country") {
            countrys = country
            print(countrys)
        }
        if let latitude = UserDefaults.standard.string(forKey: "latitude") {
            latitudes = latitude
            print(latitudes)
        }
        if let longitude = UserDefaults.standard.string(forKey: "longitude") {
            longitudes = longitude
            print(longitude)
        }
        if let authcode = UserDefaults.standard.string(forKey: "authcode") {
            authcodes = authcode
            print(authcodes)
        }
        if let propertyName = UserDefaults.standard.string(forKey: "enterProperty") {
            propertyNames = propertyName
            print(propertyNames)
        }
        if let rating = UserDefaults.standard.string(forKey: "rating") {
            ratings = rating
            print(ratings)
        }
        
        if let descriptionData = UserDefaults.standard.string(forKey: "descriptionData") {
            propertyDescriptions = descriptionData
            print(propertyDescriptions)
        }
        
        if let reservationPhone = UserDefaults.standard.string(forKey: "reservationPhone") {
            rPhones = reservationPhone
            print(rPhones)
        }
        if let phone = UserDefaults.standard.string(forKey: "phone") {
            phones = phone
            print(phone)
        }
        if let email = UserDefaults.standard.string(forKey: "email") {
            emails = email
            print(emails)
        }
        
        if let address = UserDefaults.standard.string(forKey: "address") {
            propertyAddresss = address
            print(propertyAddresss)
        }
        
        if let address = UserDefaults.standard.string(forKey: "address") {
            propertyAddressTwos = address
            print(propertyAddressTwos)
        }
        
        if let phone = UserDefaults.standard.string(forKey: "phone") {
            phones = phone
            print(phone)
        }
        if let email = UserDefaults.standard.string(forKey: "email") {
            emails = email
            print(emails)
        }
        
        if let address = UserDefaults.standard.string(forKey: "address") {
            propertyAddresss = address
            print(propertyAddresss)
        }
        if let website = UserDefaults.standard.string(forKey: "website") {
            urls = website
            print(urls)
        }
        
       

        let parameters: [String: Any] = [
            "userId": userIds,
            "state": states,
            "city": citys,
            "country": countrys,
            "propertyName": propertyNames,
            "propertyAddress": "Retvens Service",
            "propertyAddressTwo": "Indore",
            "amenityId": "jjj,ddxdx",
            "authcode": authcodes,
            "rating": ratings,
            "propertyEmail": "bmayur742@gmail.com",
            "phone": "9898989898",
            "reservationPhone": "9898989898",
            "noOfBeds": "5",
            "latitude": latitudes,
            "longitude": longitudes,
            "websiteUrl": urls,
            "propertyDescription": propertyDescriptions,
            "propertyType": "single"
        ]

        let url = "https://api.hotelratna.com/api/createProperty"
        let authcode = "af22deafe53afc6163cea49b67ab2461cc2b6e92112450510c02c4ecf5bba89684cfc67cffe0edbe1e7953a8f03f4fa57f3f4fed88a72d9b85afcd161ffd02a9"

        AF.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in parameters {
                    // Correct the typo in the next line from "desible" to "disabled"
                    if key == "disabled", let disabled = value as? Bool, disabled {
                        continue
                    }

                    if let data = "\(value)".data(using: .utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                }
            },
            to: url,
            method: .post,
            headers: ["authcode": authcode]
        )
        .validate()
        .responseString { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func createProperty(parameters: [String: Any], completion: @escaping (Result<String, AFError>) -> Void) {
        let url = "https://api.hotelratna.com/api/createProperty"
        let authcode = "af22deafe53afc6163cea49b67ab2461cc2b6e92112450510c02c4ecf5bba89684cfc67cffe0edbe1e7953a8f03f4fa57f3f4fed88a72d9b85afcd161ffd02a9"

        AF.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in parameters {
                    // Correct the typo in the next line from "desible" to "disabled"
                    if key == "disabled", let disabled = value as? Bool, disabled {
                        continue
                    }

                    if let data = "\(value)".data(using: .utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                }
            },
            to: url,
            method: .post,
            headers: ["authcode": authcode]
        )
        .validate()
        .responseString { response in
            completion(response.result)
        }
    }
    
    @IBAction func BtnSavePressed(_ sender: UIButton) {
        var hotelLogo = loadImageFromUserDefaults(key: "hotelLogo")
        print(hotelLogo?.toData())
        if let userId = UserDefaults.standard.string(forKey: "userId") {
            userIds = userId
            print(userIds)
        }
        
        if let state = UserDefaults.standard.string(forKey: "state") {
            states = state
            print(states)
        }
        if let city = UserDefaults.standard.string(forKey: "city") {
            citys = city
            print(citys)
        }
        if let country = UserDefaults.standard.string(forKey: "country") {
            countrys = country
            print(countrys)
        }
        if let latitude = UserDefaults.standard.string(forKey: "latitude") {
            latitudes = latitude
            print(latitudes)
        }
        if let longitude = UserDefaults.standard.string(forKey: "longitude") {
            longitudes = longitude
            print(longitude)
        }
        if let authcode = UserDefaults.standard.string(forKey: "authcode") {
            authcodes = authcode
            print(authcodes)
        }
        if let propertyName = UserDefaults.standard.string(forKey: "enterProperty") {
            propertyNames = propertyName
            print(propertyNames)
        }
        if let rating = UserDefaults.standard.string(forKey: "rating") {
            ratings = rating
            print(ratings)
        }
        
        if let descriptionData = UserDefaults.standard.string(forKey: "descriptionData") {
            propertyDescriptions = descriptionData
            print(propertyDescriptions)
        }
        
        if let reservationPhone = UserDefaults.standard.string(forKey: "reservationPhone") {
            rPhones = reservationPhone
            print(rPhones)
        }
        if let phone = UserDefaults.standard.string(forKey: "phone") {
            phones = phone
            print(phone)
        }
        if let email = UserDefaults.standard.string(forKey: "email") {
            emails = email
            print(emails)
        }
        
        if let address = UserDefaults.standard.string(forKey: "address") {
            propertyAddresss = address
            print(propertyAddresss)
        }
        
        if let address = UserDefaults.standard.string(forKey: "address") {
            propertyAddressTwos = address
            print(propertyAddressTwos)
        }
        
        if let phone = UserDefaults.standard.string(forKey: "phone") {
            phones = phone
            print(phone)
        }
        if let email = UserDefaults.standard.string(forKey: "email") {
            emails = email
            print(emails)
        }
        
        if let address = UserDefaults.standard.string(forKey: "address") {
            propertyAddresss = address
            print(propertyAddresss)
        }
        if let website = UserDefaults.standard.string(forKey: "website") {
            urls = website
            print(urls)
        }
        
        
        let parameters: [String: Any] = [
            "userId": userIds,
            "state": states,
            "city": citys,
            "country": countrys,
            "propertyName": propertyNames,
            "propertyAddress": "Retvens Service",
            "propertyAddressTwo": "Indore",
            "amenityId": "jjj,ddxdx",
            "authcode": authcodes,
            "rating": ratings,
            "propertyEmail": "bmayur742@gmail.com",
            "phone": "9898989898",
            "reservationPhone": "9898989898",
            "noOfBeds": "5",
            "latitude": latitudes,
            "longitude": longitudes,
            "websiteUrl": urls,
            "propertyDescription": propertyDescriptions,
            "propertyType": "single"
        ]
        createProperty(parameters: parameters) { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        //check()
        //let property = Property(image: UIImage(named: "Resort"))
        
        //postProperty(property)
        //        let parameters: [String: Any] = [
        //            "userId": userIds,
        //            "state": states,
        //            "city": citys,
        //            "country": countrys,
        //            "propertyName": propertyNames,
        //            "propertyAddress": "Retvens Service",
        //            "propertyAddressTwo": "Indore",
        //            "amenityId": "jjj,ddxdx",
        //            "authcode": authcodes,
        //            "rating": ratings,
        //            "propertyEmail": "bmayur742@gmail.com",
        //            "phone": "9898989898",
        //            "reservationPhone": "9898989898",
        //            "noOfBeds": "5",
        //            "latitude": latitudes,
        //            "longitude": longitudes,
        //            "websiteUrl": urls,
        //            "propertyDescription": propertyDescriptions,
        //            "propertyType": "single"
        //        ]
        //        print(parameters)
        //        let files: [String: String] = [
        //            "hotelLogo": "JrpP6zXNQ/Screenshot 2023-11-25 at 3.28.23 PM.png"
        //        ]
        //
        //        // Example authentication code
        //        let authCode = authcodes
        //        createMultipartFormDataRequests(url: "https://api.hotelratna.com/api/createProperty",parameters: parameters, files: files,authCode: authCode) { result in
        //            switch result {
        //            case .success(let response):
        //                print("Property created successfully!")
        //                print("Property ID: \(response.propertyId)")
        //                print("Message: \(response.message)")
        //                print("Status Code: \(response.statusCode)")
        //
        //                // Handle other properties in 'response' as needed
        //            case .failure(let error):
        //                print("Error creating property: \(error.localizedDescription)")
        //            }
        //
        //        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewRoomTypeVC") as! NewRoomTypeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension
extension CreatePropertyStap3VC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.generateChatModule()
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }
    func generateChatModule() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        
        
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/6))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2.5,leading: 2.5,bottom: 2.5,trailing: 2.5
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 6
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createSectionHeader()]
        return section
    }
    
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CreatePropertyHeaderCell", for: indexPath) as! CreatePropertyHeaderCell
            return reusableview
            
            
        default:
            fatalError("Unexpected element kind")
            //return UICollectionReusableView()
            
        }
    }
    
    func loadImageFromUserDefaults(key: String) -> UIImage? {
        if let imageData = UserDefaults.standard.data(forKey: key) {
            return imageData.toImage()
        }
        return nil
    }
    
    //MARK: add property
    //    func createProperty() {
    //        var hotelLogo = loadImageFromUserDefaults(key: "hotelLogo")
    //        APIManager.shared.createPropertyByUser(userId: userIds, enterProperty: "Single", country: countrys, state: states, city: citys, noOfBeds: noOfBedss, propertyAddress2: propertyAddressTwos, propertyAddress1: propertyAddresss, amenityIds: amenityIds, propertyDescription: propertyDescriptions, websiteUrl: urls, propertyRating: ratings, propertyName: propertyNames, hotelLogo: hotelLogo ?? UIImage(), authCode: authcodes, phone: phones, longitude: longitudes, latitude: latitudes, propertyEmail: emails, reservationPhone: rPhones) { result in
    //            switch result {
    //            case .success(let responseData):
    //                do {
    //                    // Attempt to decode the response data
    //                    let decoder = JSONDecoder()
    //                    let response = try decoder.decode(CreateUserPropertyModel.self, from: Data())
    //
    //                    // Use the decoded response
    //                    print("Property created successfully: \(response.success)")
    //                    print("Property Status Code: \(response.statusCode)")
    //
    //                    // Handle other properties in 'response' as needed
    //                } catch {
    //                    print("Error decoding response: \(error.localizedDescription)")
    //                }
    //
    //            case .failure(let error):
    //                print("Error creating property: \(error.errorDescription)")
    //            }
    //        }
    //    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionsData[section].images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionData = sectionsData[indexPath.section]
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatePropertyHeaderTwoCollectionViewCell", for: indexPath) as! CreatePropertyHeaderTwoCollectionViewCell
            cell.delegate = self
            cell.section = indexPath.section
            // Configure cell with data from sectionData.images
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatePropertyHeaderTwoCollectionViewCell", for: indexPath) as! CreatePropertyHeaderTwoCollectionViewCell
            cell.delegate = self
            cell.section = indexPath.section
            // Configure cell with data from sectionData.images
            return cell
        }
        
        // Handle other sections or return a default cell if needed
        return UICollectionViewCell()
    }
    
    
    
    
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 2
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        if section == 0{
    //            return arrImage.count
    //        } else if section == 1 {
    //            return arrImageBadRoom.count
    //        }
    //        return 0
    //    }
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        if indexPath.section == 0{
    //            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as? PropertyProfileCollectionCell else{
    //                return UICollectionViewCell()
    //            }
    //            cell.imagePhote.image = arrImage[indexPath.row]
    //            return cell
    //        } else {
    //            bedRoomSelect = true
    //            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as? PropertyProfileCollectionCell else{
    //                return UICollectionViewCell()
    //            }
    //            cell.imagePhote.image = arrImageBadRoom[indexPath.row]
    //            return cell
    //        }
    //    }
    
}


extension CreatePropertyStap3VC:PHPickerViewControllerDelegate, CellDelegate{
    func addButtonTapped(in section: Int) {
        // Present PHPickerViewController when the "Add" button is tapped
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    // MARK: - PHPickerViewControllerDelegate
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        let section = picker.view.tag
        
        // Ensure section is not nil
        guard section != nil else {
            return
        }
        
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    if let image = image as? UIImage, error == nil {
                        // Update the data source with the new image
                        self?.sectionsData[section].images.append(image)
                        
                        // Reload the respective section in the collection view
                        DispatchQueue.main.async {
                            self?.createPropertyCollectionCell.reloadSections(IndexSet(integer: section))
                        }
                    }
                }
            }
        }
    }
}
