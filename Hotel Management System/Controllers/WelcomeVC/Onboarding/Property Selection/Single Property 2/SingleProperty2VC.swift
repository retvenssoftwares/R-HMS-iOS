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
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        txtFieldNumberOfProperty.optionArray = noOfPropertyList
        txtFieldTaxRate.optionArray = taxRates
    }

    // MARK: - Action
    @IBAction func submitBtnPressed(_ sender: CustomButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "VerificationPandingVC") as! VerificationPandingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
