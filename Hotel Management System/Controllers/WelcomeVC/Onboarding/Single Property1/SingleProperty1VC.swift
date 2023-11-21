//
//  SingleProperty1VC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 21/11/23.
//

import UIKit

class SingleProperty1VC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var btnChangeProfile: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtFieldPropertyName: UITextField!
    @IBOutlet weak var txtFieldPropertyType: UITextField!
    @IBOutlet weak var txtFieldAddress: UITextField!
    @IBOutlet weak var txtFieldCountry: UITextField!
    @IBOutlet weak var txtFieldState: UITextField!
    @IBOutlet weak var txtFieldCity: UITextField!
    @IBOutlet weak var txtFieldZIPCode: UITextField!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    


    // MARK: - Action

    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
    }
    @IBAction func submitBtnPressed(_ sender: UIButton) {
    }
    
}
