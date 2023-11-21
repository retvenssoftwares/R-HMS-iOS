//
//  OnboardingPropertyChain1VC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 20/11/23.
//

import UIKit

class OnboardingPropertyChain1VC: UIViewController {

    
    // MARK: - Outlet
    @IBOutlet weak var btnProfileChange: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtFieldPropertyName: UITextField!
    @IBOutlet weak var txtFieldPropertyType: UITextField!
    @IBOutlet weak var txtFieldNumberOfProperty: UITextField!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    @IBOutlet weak var txtFieldINR: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholderTextChange()
    }
    
    // MARK: - Function
    func placeholderTextChange(){
        let color = UIColor.init(named: "PlaceHolderBlackColor")
        txtFieldPropertyName.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldPropertyType.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldNumberOfProperty.attributedPlaceholder = NSAttributedString(string: txtFieldNumberOfProperty.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldWebsite.attributedPlaceholder = NSAttributedString(string: txtFieldWebsite.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldINR.attributedPlaceholder = NSAttributedString(string: txtFieldINR.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }

    // MARK: - Action
    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
    }
    @IBAction func submitBtnPressed(_ sender: UIButton) {
    }
    
}
