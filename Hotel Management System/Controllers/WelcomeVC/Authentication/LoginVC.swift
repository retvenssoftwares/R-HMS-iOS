//
//  LoginVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 03/11/23.
//

import UIKit

class LoginVC: UIViewController {

    
    // MARK: - Outlet
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldHotelRCode: UITextField!
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewHotelRCode: UIView!
    @IBOutlet weak var viewUserName: UIView!
    @IBOutlet weak var viewBothBtn: UIView!
   
    @IBOutlet weak var btnBIgLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    var iconClick = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        btnBIgLogin.layer.cornerRadius = 10
        btnLogin.layer.cornerRadius = 10
        viewBothBtn.layer.cornerRadius = 10
        viewPassword.layer.cornerRadius = 10
        viewPassword.layer.borderWidth = 1
        viewPassword.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewHotelRCode.layer.cornerRadius = 10
        viewHotelRCode.layer.borderWidth = 1
        viewHotelRCode.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewUserName.layer.cornerRadius = 10
        viewUserName.layer.borderWidth = 1
        viewUserName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        let color = UIColor.init(named: "TextColor")
        txtFieldPassword.attributedPlaceholder = NSAttributedString(string: txtFieldPassword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldHotelRCode.attributedPlaceholder = NSAttributedString(string: txtFieldHotelRCode.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldUserName.attributedPlaceholder = NSAttributedString(string: txtFieldUserName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
    }
    
    // MARK: - Action
    @IBAction func showPasswordBtnPressed(_ sender: UIButton) {
        if iconClick {
            txtFieldPassword.isSecureTextEntry = false
            } else {
                txtFieldPassword.isSecureTextEntry = true
            }
            iconClick = !iconClick
    }
    
    @IBAction func forgotPasswordBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func loginbigBtnPressed(_ sender: UIButton) {
//        if txtFieldUserName.text == ""{
//            let alert = UIAlertController(title: "", message: "Please enter Username!", preferredStyle: .alert)
//            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                print("Close")
//            })
//            alert.addAction(closeAction)
//            self.present(alert, animated: true, completion: nil)
//        }
//      
//        else if txtFieldHotelRCode.text == ""{
//            let alert = UIAlertController(title: "", message: "Please enter R-code!", preferredStyle: .alert)
//            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                print("Close")
//            })
//            alert.addAction(closeAction)
//            self.present(alert, animated: true, completion: nil)
//        }
//        else if txtFieldPassword.text!.count < 8{
//            let alert = UIAlertController(title: "", message: "Please enter password!", preferredStyle: .alert)
//            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                print("Close")
//            })
//            alert.addAction(closeAction)
//            self.present(alert, animated: true, completion: nil)
//        }
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    @IBAction func loginBtnPressed(_ sender: UIButton) {
      
    }
}




