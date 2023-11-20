//
//  SignUPVC.swift
//  Retvent
//
//  Created by Smart Kamina on 03/11/23.
//

import UIKit

class SignUPVC: UIViewController {

    
    // MARK: - Outlet
    @IBOutlet weak var btnSignUpBig: UIButton!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var txtFieldDesignation: UITextField!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewDesignation: UIView!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewBothBtn: UIView!
    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFIeldLastName: UITextField!
    @IBOutlet weak var viewLastName: UIView!
    @IBOutlet weak var btnCountinueWith: UIButton!
    
    
    var iconClick = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        changeTextFieldPlaceholderTextColor()
    }
    // MARK: - Fuction
   
    func changeTextFieldPlaceholderTextColor(){
        let color = UIColor.init(named: "TextColor")
        txtFieldFirstName.attributedPlaceholder = NSAttributedString(string: txtFieldFirstName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldLastName.attributedPlaceholder = NSAttributedString(string: txtFIeldLastName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldDesignation.attributedPlaceholder = NSAttributedString(string: txtFieldDesignation.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldPhone.attributedPlaceholder = NSAttributedString(string: txtFieldPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldEmail.attributedPlaceholder = NSAttributedString(string: txtFieldEmail.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldPassword.attributedPlaceholder = NSAttributedString(string: txtFieldPassword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }

  
    // MARK: - Action

    @IBAction func signUpBigBtnPressed(_ sender: UIButton) {
        if txtFieldFirstName.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter first name!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFIeldLastName.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter last name!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldDesignation.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter designation!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldPhone.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter phone!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldEmail.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter email address!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldPassword.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter password!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        } 
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
      
        
    }
    @IBAction func showPasswordBtnPressed(_ sender: UIButton) {
        if iconClick {
            txtFieldPassword.isSecureTextEntry = false
            } else {
                txtFieldPassword.isSecureTextEntry = true
            }
            iconClick = !iconClick
    }
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
}
