//
//  SignUPVC.swift
//  Retvent
//
//  Created by mayur bobade on 03/11/23.
//

import UIKit

class SignUPVC: UIViewController {
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var btnSignUpBig: UIButton!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var authContainerView: UIView!
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
    var activeTextField : UITextField? = nil
    
    var iconClick = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        btnCountinueWith.layer.borderWidth = 1
        btnCountinueWith.layer.cornerRadius = 10
        hideKeyboardWhenTappedAround()
        btnSignUp.layer.cornerRadius = 10
        viewBothBtn.layer.cornerRadius = 10
        btnSignUpBig.layer.cornerRadius = 10
        
        changeTextFieldBorderLine()
        changeTextFieldPlaceholderTextColor()
        NotificationCenter.default.addObserver(self, selector: #selector(SignUPVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignUPVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        txtFieldFirstName.delegate =  self
        txtFieldEmail.delegate = self
        txtFIeldLastName.delegate =  self
        txtFieldPassword.delegate = self
        txtFieldDesignation.delegate =  self
        txtFieldPassword.delegate = self
        //self.authContainerView.addSubview(loginView)
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
    
    func animateView() {
        //let customView = LoginView(frame: CGRect(x: 0, y: 0, width: 393, height: 100))
               // authContainerView.addSubview(customView)
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
    
        UIView.transition(with: authContainerView, duration: 1.0, options: transitionOptions, animations: {
        self.authContainerView.isHidden = !self.authContainerView.isHidden
    })
    
    
        
        UIView.transition(with: loginView, duration: 1.0, options: transitionOptions, animations: {
            self.loginView.isHidden = !self.loginView.isHidden
        }, completion: nil)
    }
    func signUpValidation() {
        if txtFieldFirstName.text?.isEmpty == true {
            txtFieldFirstName.attributedPlaceholder = NSAttributedString(
                string: "First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            viewName.borderColor = UIColor.red
        } else {
            viewName.borderColor = UIColor.textFiledViewLine
        }
        
        //MARK: Last name
        if txtFIeldLastName.text?.isEmpty == true {
            viewLastName.borderColor = UIColor.red
            txtFIeldLastName.attributedPlaceholder = NSAttributedString(
                string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
        } else {
            viewLastName.borderColor = UIColor.textFiledViewLine
        }
        
        //MARK: Designation
        if txtFieldDesignation.text?.isEmpty == true {
            viewDesignation.borderColor = UIColor.red
            txtFieldDesignation.attributedPlaceholder = NSAttributedString(
                string: "Designation", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            viewDesignation.borderColor = UIColor.textFiledViewLine
        }
        
        //MARK: Phone number
        if txtFieldPhone.text?.isEmpty == true {
            viewPhone.borderColor = UIColor.red
            txtFieldPhone.attributedPlaceholder = NSAttributedString(
                string: "Phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            viewPhone.borderColor = UIColor.textFiledViewLine
        }
        
        //MARK: Email
        if txtFieldEmail.text?.isEmpty == true {
            viewEmail.borderColor = UIColor.red
            txtFieldEmail.attributedPlaceholder = NSAttributedString(
                string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            viewEmail.borderColor = UIColor.textFiledViewLine
        }
        
        //MARK: Password
        if txtFieldPassword.text?.isEmpty == true {
            viewPassword.borderColor = UIColor.red
            txtFieldPassword.attributedPlaceholder = NSAttributedString(
                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
        } else {
            viewPassword.borderColor = UIColor.textFiledViewLine
        }
        
        if (((txtFieldFirstName.text?.isEmpty) == true) && ((txtFIeldLastName.text?.isEmpty) == true) && ((txtFieldDesignation.text?.isEmpty) == true)) && ((txtFieldEmail.text?.isEmpty == true)) && ((txtFieldPhone.text?.isEmpty == true)) && ((txtFieldPassword.text?.isEmpty == true)) == true {
            
        } else {
            if (((txtFieldFirstName.text?.isEmpty) == false) && ((txtFIeldLastName.text?.isEmpty) == false) && ((txtFieldDesignation.text?.isEmpty) == false)) && ((txtFieldEmail.text?.isEmpty == false)) && ((txtFieldPhone.text?.isEmpty == false)) && ((txtFieldPassword.text?.isEmpty == false)) == true {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                self.navigationController?.pushViewController(vc, animated: true)
                // self.signUPRequest()
            } else {
                //                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                //                self.navigationController?.pushViewController(vc, animated: false)
            }
            
        }
    }
    // MARK: - Action
    
    @IBAction func signUpBigBtnPressed(_ sender: UIButton) {
        signUpValidation()
        //        if txtFieldFirstName.text == ""{
        //            let alert = UIAlertController(title: "", message: "Please enter first name!", preferredStyle: .alert)
        //            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
        //                print("Close")
        //            })
        //            alert.addAction(closeAction)
        //            self.present(alert, animated: true, completion: nil)
        //        }
        //        else if txtFIeldLastName.text == ""{
        //            let alert = UIAlertController(title: "", message: "Please enter last name!", preferredStyle: .alert)
        //            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
        //                print("Close")
        //            })
        //            alert.addAction(closeAction)
        //            self.present(alert, animated: true, completion: nil)
        //        }
        //        else if txtFieldDesignation.text == ""{
        //            let alert = UIAlertController(title: "", message: "Please enter designation!", preferredStyle: .alert)
        //            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
        //                print("Close")
        //            })
        //            alert.addAction(closeAction)
        //            self.present(alert, animated: true, completion: nil)
        //        }
        //        else if txtFieldPhone.text == ""{
        //            let alert = UIAlertController(title: "", message: "Please enter phone!", preferredStyle: .alert)
        //            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
        //                print("Close")
        //            })
        //            alert.addAction(closeAction)
        //            self.present(alert, animated: true, completion: nil)
        //        }
        //        else if txtFieldEmail.text == ""{
        //            let alert = UIAlertController(title: "", message: "Please enter email address!", preferredStyle: .alert)
        //            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
        //                print("Close")
        //            })
        //            alert.addAction(closeAction)
        //            self.present(alert, animated: true, completion: nil)
        //        }
        //        else if txtFieldPassword.text == ""{
        //            let alert = UIAlertController(title: "", message: "Please enter password!", preferredStyle: .alert)
        //            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
        //                print("Close")
        //            })
        //            alert.addAction(closeAction)
        //            self.present(alert, animated: true, completion: nil)
        //        }
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        //        self.navigationController?.pushViewController(vc, animated: false)
        
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
        animateView()
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//        self.navigationController?.pushViewController(vc, animated: false)
//        
    }
    
}

extension SignUPVC : UITextFieldDelegate {
    
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
