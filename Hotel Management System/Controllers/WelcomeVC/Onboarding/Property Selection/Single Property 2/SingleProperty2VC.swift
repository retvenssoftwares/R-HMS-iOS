//
//  SingleProperty2VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 21/11/23.
//

import UIKit
import iOSDropDown
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
    var genericpropertyType: String = ""
    var genericaddress: String = ""
    var genericimage: String = ""
    var genericcountry: String = ""
    var genericstate : String = ""
    var genericcity: String = ""
    var genericzipCode: String = ""
    var genericwebsite : String = ""
    var name = "Single"
    var verificationDone : String =  ""
    
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
    
    func updatePropertyTypeSOC(propertyTypeSOC: String) {
           // Additional parameters you want to send in the PATCH request
           let parameters: [String: Any] = [
            "userId": "userId",
               "propertyTypeSOC": propertyTypeSOC,
               "websiteUrl": txtFieldWebsite,
               "hotelLogo": genericimage,
            "numberOfProperties": txtFieldNumberOfProperty.text,
               "propertyType": genericpropertyType,
               "baseCurrency": "INR",
               "propertyAddress1": txtFieldAddress,
               "propertyName": genericPropertyName,
               "propertyTypeName": genericpropertyType,
               "postCode": genericzipCode,
               "state": genericstate,
               "city": genericcity,
            "starCategory": starRateView.rating,
               "ratePercent": taxRates,
            "roomsInProperty": txtFieldNumberOfProperty.text,
            "taxName": txtFieldTaxNo.text,
            "registrationNumber": txtFieldRegistrationNumber.text
           ]
        
           patchRequest(parameters: parameters) { responseData in
               print("Response data: \(responseData)")
           }
       }

       func patchRequest(parameters: [String: Any], completion: @escaping ([String: Any]) -> Void) {
           var url =  URL(string: "https://api.hotelratna.com/api/userEdit")!
           var request = URLRequest(url: url)
           request.httpMethod = "PATCH"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           do {
               let jsonData = try JSONSerialization.data(withJSONObject: parameters)
               request.httpBody = jsonData
           } catch {
               print("Error converting parameters to JSON: \(error)")
               return
           }

           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               if let error = error {
                   print("Error: \(error.localizedDescription)")
                   return
               }
               if let data = data {
                   if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                       completion(jsonResponse)
                   }
               }
           }

           task.resume()
       }
    func verificationPendingAndCompleted() {
        
    }
    // MARK: - Action
    @IBAction func submitBtnPressed(_ sender: CustomButton) {
        updatePropertyTypeSOC(propertyTypeSOC: genericPropertyName)
        let vc = self.storyboard?.instantiateViewController(identifier: "OnboardingVarificationPandingVC") as! OnboardingVarificationPandingVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
