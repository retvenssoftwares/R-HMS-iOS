//
//  OnboardingSingleProperty1VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 17/11/23.
//

import UIKit
import iOSDropDown

class OnboardingSingleProperty1VC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
   
    @IBOutlet weak var txtFieldResistrationNumber: UITextField!
    @IBOutlet weak var txtFieldState: UITextField!
    @IBOutlet weak var txtFieldCountry: UITextField!
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var txtFieldWebsiteURL: UITextField!
    @IBOutlet weak var txtFieldAddress: UITextField!
    @IBOutlet weak var txtFieldPropertyType: DropDown!
    @IBOutlet weak var txtFieldPropertyName: UITextField!
    
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = UIColor.init(named: "TextColor")
        txtFieldPropertyName.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldPropertyType.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldAddress.attributedPlaceholder = NSAttributedString(string: txtFieldAddress.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldWebsiteURL.attributedPlaceholder = NSAttributedString(string: txtFieldWebsiteURL.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldCountry.attributedPlaceholder = NSAttributedString(string: txtFieldCountry.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldState.attributedPlaceholder = NSAttributedString(string: txtFieldState.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldResistrationNumber.attributedPlaceholder = NSAttributedString(string: txtFieldResistrationNumber.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
       
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        guard let image = info[.editedImage] as? UIImage else {return}
        imgProfilePic.image = image
        dismiss(animated: true)
    }

    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
        let picker = UIImagePickerController()
          picker.allowsEditing = true
          picker.delegate = self
          present(picker, animated: true)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
    
}
