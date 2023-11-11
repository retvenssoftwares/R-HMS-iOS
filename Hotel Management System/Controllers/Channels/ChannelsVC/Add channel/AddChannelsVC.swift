//
//  AddChannelsVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 08/11/23.
//

import UIKit
import iOSDropDown

class AddChannelsVC: UIViewController {

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
    
    
    
    var minimumValue:Int = 0{
        didSet{
            lblMinimumLOS.text = "\(minimumValue)"
        }
    }
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldborderLine()
        placeholderTextChange()
        
    }
    
    
    func textFieldborderLine(){
        viewId.layer.borderWidth = 1
        viewId.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewId.layer.cornerRadius = 10
        
        viewHotelID.layer.borderWidth = 1
        viewHotelID.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewHotelID.layer.cornerRadius = 10
        
        viewEmailAddress.layer.borderWidth = 1
        viewEmailAddress.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEmailAddress.layer.cornerRadius = 10
        
        viewEmailAddressDropDown.layer.borderWidth = 1
        viewEmailAddressDropDown.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEmailAddressDropDown.layer.cornerRadius = 10
        
        viewMinimumLOS.layer.borderWidth = 1
        viewMinimumLOS.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewMinimumLOS.layer.cornerRadius = 10
        
        viewHotelID2.layer.borderWidth = 1
        viewHotelID2.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewHotelID2.layer.cornerRadius = 10
        
        viewEmailAddressCheakBox.layer.borderWidth = 1
        viewEmailAddressCheakBox.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEmailAddressCheakBox.layer.cornerRadius = 10
        
        viewEmailAddressSwitchBtn.layer.borderWidth = 1
        viewEmailAddressSwitchBtn.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEmailAddressSwitchBtn.layer.cornerRadius = 10
        
        viewEmailAddressLast.layer.borderWidth = 1
        viewEmailAddressLast.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEmailAddressLast.layer.cornerRadius = 10
    }

    
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
