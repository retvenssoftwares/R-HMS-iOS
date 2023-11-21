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
    var activeTextField : UITextField? = nil
    var iconClick = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
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
        self.navigationItem.backBarButtonItem?.isHidden = true
        let color = UIColor.init(named: "TextColor")
        txtFieldPassword.attributedPlaceholder = NSAttributedString(string: txtFieldPassword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldHotelRCode.attributedPlaceholder = NSAttributedString(string: txtFieldHotelRCode.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldUserName.attributedPlaceholder = NSAttributedString(string: txtFieldUserName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
    }
    
    func loginValidation() {
        if txtFieldUserName.text?.isEmpty == true {
            txtFieldUserName.attributedPlaceholder = NSAttributedString(
                string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            
            viewUserName.borderColor = UIColor.red
        }else {
            viewUserName.borderColor = UIColor.textFiledViewLine
        }
        if txtFieldHotelRCode.text?.isEmpty == true {
            viewHotelRCode.borderColor = UIColor.red
            txtFieldHotelRCode.attributedPlaceholder = NSAttributedString(
                string: "Hotel RCode", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            print("incorrect - try again")
            
         //   self.present(alert, animated: true, completion: nil)
            
        } else {
            viewHotelRCode.borderColor = UIColor.textFiledViewLine
        }
        if txtFieldPassword.text?.isEmpty == true {
            viewPassword.borderColor = UIColor.red
            txtFieldPassword.attributedPlaceholder = NSAttributedString(
                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            print("incorrect - try again")
            
        } else {
            viewPassword.borderColor = UIColor.textFiledViewLine
        }
        
        if (((txtFieldUserName.text?.isEmpty) != nil) && ((txtFieldPassword.text?.isEmpty) != nil) && ((txtFieldHotelRCode.text?.isEmpty) != nil)) == true {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
//            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
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
//        if txtFieldUserName.text == ""{
//            let alert = UIAlertController(title: "", message: "Please enter name!", preferredStyle: .alert)
//            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                print("Close")
//            })
//            alert.addAction(closeAction)
//            self.present(alert, animated: true, completion: nil)
//        }
//      
//        else if txtFieldHotelRCode.text == ""{
//            let alert = UIAlertController(title: "", message: "Please enter password!", preferredStyle: .alert)
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
//        
//        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
//        self.navigationController?.pushViewController(vc, animated: true)
        
        loginValidation()
    }
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    @IBAction func loginBtnPressed(_ sender: UIButton) {
      
    }
}

extension LoginVC : UITextFieldDelegate {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            
            // if keyboard size is not available for some reason, dont do anything
           return
        }
        
        var shouldMoveViewUp = false
        
        // if active text field is not nil
        if let activeTextField = activeTextField {
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.txtFieldFirstName = textField
//        self.txtFieldEmail = textField
//        self.txtFieldPhone = textField
//        self.txtFieldPassword = textField
//        self.txtFieldDesignation = textField
//        self.txtFIeldLastName = textField
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.txtFieldFirstName = nil
//        self.txtFieldFirstName = nil
//        self.txtFieldEmail = nil
//        self.txtFieldPhone = nil
//        self.txtFieldPassword = nil
//        self.txtFieldDesignation = nil
//        self.txtFIeldLastName = nil
        self.activeTextField = nil
    }
}
