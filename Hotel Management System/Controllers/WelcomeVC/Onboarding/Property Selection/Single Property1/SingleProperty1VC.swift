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
    let propertyType = ["Luxury Hotel", "Boutique Hotel", "Resort", "Bed and Breakfast", "Motel"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let propertyName = property {
            txtFieldPropertyName.text = propertyName
        }
        hideKeyboardWhenTappedAround()
        txtFieldPropertyType.optionArray = propertyType
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
            let vc = self.storyboard?.instantiateViewController(identifier: "VerificationPandingVC") as! VerificationPandingVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    // MARK: - Action
    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
        imagePick()
    }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SingleProperty2VC") as! SingleProperty2VC
        self.navigationController?.pushViewController(vc, animated: true)
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
