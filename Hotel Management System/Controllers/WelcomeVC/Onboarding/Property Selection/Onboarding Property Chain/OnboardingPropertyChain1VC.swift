//
//  OnboardingPropertyChain1VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 20/11/23.
//

import UIKit
import iOSDropDown
class OnboardingPropertyChain1VC: UIViewController {

    
    // MARK: - Outlet
    @IBOutlet weak var btnProfileChange: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtFieldPropertyName: UITextField!
    @IBOutlet weak var txtFieldPropertyType: DropDown!
    @IBOutlet weak var txtFieldNumberOfProperty: DropDown!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    @IBOutlet weak var txtFieldINR: DropDown!
    var multipleProperty: String?
    let propertyName = ["Delux", "Single", "XYZ", "ABC", "Delux", "Single", "XYZ", "ABC", "Delux", "Single", "XYZ", "ABC"]
    let noOfPropertyList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let inrList = ["INR","USD", "EUR", "GBP", "JPY", "AUD", "CAD"]
    
    var imagePicker = UIImagePickerController()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholderTextChange()
        txtFieldPropertyType.optionArray = propertyName
        txtFieldNumberOfProperty.optionArray = noOfPropertyList
        
        txtFieldINR.optionArray = inrList
        hideKeyboardWhenTappedAround()
        if let multipleProperty = multipleProperty {
            txtFieldPropertyName.text = multipleProperty
        }
        
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
