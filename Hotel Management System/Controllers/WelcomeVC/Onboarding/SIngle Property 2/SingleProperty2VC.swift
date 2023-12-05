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
    var userDefaults = UserDefaults.standard
    var userId: String?
    var baseCurrency: String?
    // MARK: - Outlet
    var d:Pr?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        txtFieldNumberOfProperty.optionArray = noOfPropertyList
        txtFieldTaxRate.optionArray = taxRates
        setupValue()
        if let id = userDefaults.object(forKey: "userId") {
            userId = id as! String
            print(userId)
        }
        
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
    


    func showSuccessAlert() {
        let alertController = UIAlertController(title: "Success", message: "User updated successfully!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Action
    @IBAction func submitBtnPressed(_ sender: CustomButton) {
        if let userId = userId{
            print(userId)
            let propertyTypeSOC = "Single"
            let propertyName = "Single"
            let propertyType = genericpropertyType
            let rating = starRateView.rating
            APIManager.shared.singleUserEditById(userId: userId, ratePercent: txtFieldTaxRate.text!,taxName: txtFieldTaxNo.text!, registrationNumber: txtFieldRegistrationNumber.text!, propertyTypeSOC: propertyTypeSOC, websiteUrl: genericwebsite, numberOfProperties: txtFieldNumberOfProperty.text!, propertyAddress1: genericaddress, propertyName: propertyName, propertyType: propertyType, postCode: genericzipCode, state: genericstate, city: genericcity, taxPercent: txtFieldTaxRate.text!, starCategory: rating)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerificationPandingVC") as! VerificationPandingVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
