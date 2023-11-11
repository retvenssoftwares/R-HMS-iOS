//
//  SignUPVC.swift
//  Retvent
//
//  Created by mayur bobade on 03/11/23.
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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        btnCountinueWith.layer.borderWidth = 1
        btnCountinueWith.layer.cornerRadius = 10
        
        btnSignUp.layer.cornerRadius = 10
        viewBothBtn.layer.cornerRadius = 10
        btnSignUpBig.layer.cornerRadius = 10
        
        changeTextFieldBorderLine()
        changeTextFieldPlaceholderTextColor()
        
       
        

        
       

    }
    // MARK: - Fuction
    
    func changeTextFieldBorderLine(){
        viewName.layer.cornerRadius = 10
        viewName.layer.borderWidth = 1
        viewName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewLastName.layer.cornerRadius = 10
        viewLastName.layer.borderWidth = 1
        viewLastName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        viewDesignation.layer.cornerRadius = 10
        viewDesignation.layer.borderWidth = 1
        viewDesignation.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        viewPhone.layer.cornerRadius = 10
        viewPhone.layer.borderWidth = 1
        viewPhone.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        viewEmail.layer.cornerRadius = 10
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewPassword.layer.cornerRadius = 10
        viewPassword.layer.borderWidth = 1
        viewPassword.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
    }
    
    
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
            let alert = UIAlertController(title: "", message: "Please enter First name!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFIeldLastName.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter Last name!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldDesignation.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter Designation!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldPhone.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter Phone number!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldEmail.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter Email address!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldPassword.text == ""{
            let alert = UIAlertController(title: "", message: "Please enter Password!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            
        }
        
    }
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
}
