//
//  InventoryPops.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 01/12/23.
//

import UIKit
import IQKeyboardManagerSwift

class InventoryPops: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var viewNumber: UIView!
    @IBOutlet weak var txtFieldNumber: UITextField!
    @IBOutlet weak var btnPlusTen: UIButton!
    @IBOutlet weak var btnPlusOne: UIButton!
    @IBOutlet weak var btnMinusOne: UIButton!
    @IBOutlet weak var btnMinus10: UIButton!
    @IBOutlet weak var lblinventory: UILabel!
    @IBOutlet weak var lblInventoryDes: UILabel!
    @IBOutlet var viewBg: UIView!
    
    var textFieldNumbers: String?
    var saveBtnClicked:((String)->Void)?
    var someValue:Int = 0{
        didSet{
            txtFieldNumber.text = "\(someValue)"
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
     someValue = 40
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 300
        txtFieldNumber.text = textFieldNumbers
    }


  
    // MARK: - Action

    @IBAction func btnSavePressed(_ sender: UIButton) {
        if let text = txtFieldNumber.text {
            saveBtnClicked?(text)
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func btnCancelPressed(_ sender: UIButton) {
        
    }
    @IBAction func btnMinusTenPressed(_ sender: UIButton) {
        someValue -= 10
    }
    @IBAction func btnMinusOnePressed(_ sender: UIButton) {
        someValue -= 1
    }
    @IBAction func btnPlusTen(_ sender: UIButton) {
        someValue += 10
    }
    @IBAction func plusOne(_ sender: UIButton) {
        someValue += 1

    }
}
