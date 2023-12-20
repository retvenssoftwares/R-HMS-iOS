//
//  OnboardingPropertyChain1VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 20/11/23.
//

import UIKit
import iOSDropDown
class OnboardingPropertyChain1VC: UIViewController {

    
//    @IBOutlet weak var navigationTitleLbl: UILabel!
//    @IBOutlet weak var backBtn: UIButton!
//    @IBOutlet weak var navigationView: UIView!
    // MARK: - Outlet
    @IBOutlet weak var btnProfileChange: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtFieldPropertyName: UITextField!
    @IBOutlet weak var txtFieldPropertyType: DropDown!
    @IBOutlet weak var txtFieldNumberOfProperty: DropDown!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    @IBOutlet weak var txtFieldINR: DropDown!
    var multipleProperty: String?
    let propertyName = ["Delux", "Multiple", "XYZ", "ABC", "Delux", "XYZ", "ABC", "Delux", "XYZ", "ABC"]
    let noOfPropertyList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let inrList = ["INR","USD", "EUR", "GBP", "JPY", "AUD", "CAD"]
    var userId: String?
    var imagePicker = UIImagePickerController()
    var fullTitle = "let’s create your property chain’s profile"
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholderTextChange()
        txtFieldPropertyType.optionArray = propertyName
        txtFieldNumberOfProperty.optionArray = noOfPropertyList
        
        txtFieldINR.optionArray = inrList
        hideKeyboardWhenTappedAround()
        title()
        if let multipleProperty = multipleProperty {
            txtFieldPropertyName.text = multipleProperty
        }
        
        if let userId = userId {
            print(userId)
        }
    }
    
    
    func title() {
        self.navigationItem.title = "let’s create your property chain’s profile"
        let font = UIFont(name: "Roboto-medium", size: 14)!
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: font]
            
    }
    func Validation() {
        if txtFieldPropertyType.text == "" {
            showAlert(message: "Invalid Property Type")
        } else if txtFieldPropertyName.text == "" {
            showAlert(message: "Invalid Property Name")
        } else if txtFieldNumberOfProperty.text == "" {
            showAlert(message: "Invalid Number of Property")
        } else if txtFieldWebsite.text == "" {
            showAlert(message: "Invalid Website")
        } else if txtFieldINR.text == "" {
            showAlert(message: "Invalid INR")
        } else {
            let vc = self.storyboard?.instantiateViewController(identifier: "VerificationPandingVC") as! VerificationPandingVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    // MARK: - Function
    func placeholderTextChange(){
        let color = UIColor.init(named: "TextColor")
        txtFieldPropertyName.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
        txtFieldPropertyType.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
        txtFieldNumberOfProperty.attributedPlaceholder = NSAttributedString(string: txtFieldNumberOfProperty.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
        txtFieldWebsite.attributedPlaceholder = NSAttributedString(string: txtFieldWebsite.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
        txtFieldINR.attributedPlaceholder = NSAttributedString(string: txtFieldINR.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
        imagePick()

    }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        if let userId = userId{
            print(userId)
            let propertyTypeSOC = "Single"
            let propertyName = "Single"
            APIManager.shared.multiUserEditById(userId: userId, propertyTypeSOC: propertyTypeSOC, websiteUrl: txtFieldWebsite.text!, numberOfProperties: txtFieldNumberOfProperty.text!, propertyName: txtFieldPropertyName.text!, propertyType: txtFieldPropertyType.text!)
            
        }
        Validation()
        
    }
    
    
    
}

extension OnboardingPropertyChain1VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
