//
//  AddChannelsVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 08/11/23.
//

import UIKit
import iOSDropDown

class AddChannelsVC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblMinimumLOS: UILabel!
    @IBOutlet weak var btnMinimimRemove: UIButton!
    @IBOutlet weak var btnAddMinimumLOS: UIButton!
    @IBOutlet weak var viewId: UIView!
    @IBOutlet weak var viewHotelID: UIView!
    @IBOutlet weak var txtFieldHotelID: UITextField!
    @IBOutlet weak var viewEmailAddress: UIView!
    @IBOutlet weak var txtFieldEmailAddresss: UITextField!
    @IBOutlet weak var viewEmailAddressDropDown: UIView!
    @IBOutlet weak var txtFieldEmailAddressDropDown: DropDown!
    @IBOutlet weak var viewMinimumLOS: UIView!
    @IBOutlet weak var viewHotelID2: UIView!
    @IBOutlet weak var txtfieldHotelID2: UITextField!
    @IBOutlet weak var viewEmailAddressCheakBox: UIView!
    @IBOutlet weak var viewEmailAddressSwitchBtn: UIView!
    @IBOutlet weak var viewEmailAddressLast: UIView!
    @IBOutlet weak var txtFieldEmailAddressLast: UITextField!
    
    
    // MARK: - Varriable
    var minimumValue:Int = 0{
        didSet{
            lblMinimumLOS.text = "\(minimumValue)"
        }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholderTextChange()
    }
    
    // MARK: - Function
    func placeholderTextChange(){
        let color = UIColor.init(named: "TextColor")
        txtFieldHotelID.attributedPlaceholder = NSAttributedString(string: txtFieldHotelID.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldEmailAddresss.attributedPlaceholder = NSAttributedString(string: txtFieldEmailAddresss.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldEmailAddressDropDown.attributedPlaceholder = NSAttributedString(string: txtFieldEmailAddressDropDown.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtfieldHotelID2.attributedPlaceholder = NSAttributedString(string: txtfieldHotelID2.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldEmailAddressLast.attributedPlaceholder = NSAttributedString(string: txtFieldEmailAddressLast.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    // MARK: - Action

    @IBAction func idCopyBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func minimumAddBtnPressed(_ sender: UIButton) {
        minimumValue += 1
    }
    @IBAction func minimumRemoveBtnPressed(_ sender: UIButton) {
        minimumValue -= 1
    }
    
}
