//
//  AddressAndContactVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/11/23.
//

import UIKit
import Alamofire

class AddressAndContactVC: UIViewController {
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var viewGoogleMaps: UIView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
    }
    
    // MARK: - Function
    func createProperty() {
        let apiUrl = "https://your-api-endpoint.com/create-hotel"
        
        // Replace with your authentication code
        let authCode = "your-authentication-code"
        
        
        let hotelData = CreateNewPropertyDataModel(
            hotelLogo: "",
            propertyName: "",
            propertyType: "",
            propertyRating: "",
            websiteUrl: "",
            propertyDescription: "",
            amenitylds: "",
            propertyAddress1: "",
            propertyAddress2: "",
            city: "",
            state: "",
            country: "",
            phone: "",
            reservationPhone: "",
            propertyEmail: "",
            latitude: "",
            longitude: "",
            userId: "your-user-id"
        )
        
        // Convert the hotelData to Data
        guard let hotelDataJSON = try? JSONEncoder().encode(hotelData) else {
            return
        }
        
        // Create multipart form data
        AF.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(hotelDataJSON, withName: "hotelData", fileName: "hotelData.json", mimeType: "application/json")
        }, to: apiUrl, method: .post, headers: ["Authorization": "Bearer \(authCode)"])
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                print("Hotel creation successful: \(value)")
                // Handle success, e.g., show an alert, update UI, etc.
            case .failure(let error):
                print("Error creating hotel: \(error)")
                // Handle error, e.g., show an alert with an error message
            }
            
        }
    }
    
    
    
    // MARK: - Action
    
    
    
    
}
