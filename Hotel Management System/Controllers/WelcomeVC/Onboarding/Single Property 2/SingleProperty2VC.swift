//
//  SingleProperty2VC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 21/11/23.
//

import UIKit

class SingleProperty2VC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var txtFieldTaxNo: UITextField!
    @IBOutlet weak var txtFieldNumberOfProperty: UITextField!
    @IBOutlet weak var txtFieldRegistrationNumber: UITextField!
    @IBOutlet weak var txtFieldTaxRate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   
    // MARK: - Action
    @IBAction func submitBtnPressed(_ sender: CustomButton) {
    }
    
}
