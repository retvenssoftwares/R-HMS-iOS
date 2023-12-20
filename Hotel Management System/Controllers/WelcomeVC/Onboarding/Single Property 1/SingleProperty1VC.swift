//
//  SingleProperty1VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 21/11/23.
//

import UIKit
import iOSDropDown
class SingleProperty1VC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var btnChangeProfile: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtFieldPropertyName: UITextField!
    @IBOutlet weak var txtFieldPropertyType: DropDown!
    @IBOutlet weak var txtFieldAddress: UITextField!
    @IBOutlet weak var txtFieldCountry: UITextField!
    @IBOutlet weak var txtFieldState: UITextField!
    @IBOutlet weak var txtFieldCity: UITextField!
    @IBOutlet weak var txtFieldZIPCode: UITextField!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    var property: String?
    var userId: String?
    let propertyType = ["Luxury Hotel", "Boutique Hotel", "Resort", "Bed and Breakfast", "Motel"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let propertyName = property {
            txtFieldPropertyName.text = propertyName
        }
        hideKeyboardWhenTappedAround()
        txtFieldPropertyType.optionArray = propertyType
        if let userId = userId {
            print(userId)
        }
    }
    
    
    
    func Validation() {
        if txtFieldPropertyType.text == "" {
            showAlert(message: "Invalid Property Type")
        } else if txtFieldPropertyName.text == "" {
            showAlert(message: "Invalid Property Name")
        } else if txtFieldCity.text == "" {
            showAlert(message: "Invalid City")
        } else if txtFieldWebsite.text == "" {
            showAlert(message: "Invalid Website")
        } else if txtFieldAddress.text == "" {
            showAlert(message: "Invalid Address")
        } else if txtFieldCountry.text == "" {
            showAlert(message: "Invalid Country")
        }else if txtFieldState.text == "" {
            showAlert(message: "Invalid State")
        } else {
            let vc = self.storyboard?.instantiateViewController(identifier: "SingleProperty2VC") as! SingleProperty2VC
            vc.userId = userId
            print(vc.userId,userId)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func patchRequest(name: String, completion: @escaping (Error?) -> Void) {
        let apiUrl = URL(string: "https://api.hotelratna.com/api/userEdit")!
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String: Any] = ["propertyName": name]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        } catch {
            completion(error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }
        task.resume()
    }
    
    // MARK: - Action
    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
        imagePick()
    }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        Validation()
//        patchRequest(name: txtFieldPropertyName.text!) { error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//            } else {
//                
//                print("PATCH request successful")
//            }
//        }
        
    }
    
}

extension SingleProperty1VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        guard let image = info[.editedImage] as? UIImage else {return}
        imgProfile.image = image
        dismiss(animated: true)
    }
    func imagePick(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}
