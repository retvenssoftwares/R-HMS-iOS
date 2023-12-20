//
//  LoginVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 03/11/23.
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
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Function
    func placeholderTextChange(){
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
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func loginbigBtnPressed(_ sender: UIButton) {
        if txtFieldUserName.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter name!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        else if txtFieldHotelRCode.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter HotelRCOde!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldPassword.text!.count < 8{
            let alert = UIAlertController(title: "", message: "Please enter password!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewPropertyProfileVC") as! NewPropertyProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        
    }
}




