//
//  SignUpViewController.swift
//  Hotel Management System
//
//  Created by mayur bobade on 19/11/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnSignUpBig: UIButton!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtFieldDesignation: UITextField!
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
    
    //login view
    @IBOutlet weak var txtFieldLoginPassword: UITextField!
    @IBOutlet weak var txtFieldHotelRCode: UITextField!
    @IBOutlet weak var loginBigBtn: UIButton!
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var viewLoginPassword: UIView!
    @IBOutlet weak var viewHotelRCode: UIView!
    @IBOutlet weak var viewUserName: UIView!
    //    @IBOutlet weak var viewLoginBothBtn: UIView!
    //    @IBOutlet weak var btnBIgLogin: UIButton!
    var activeTextField : UITextField? = nil
    
    var iconClick = true
    var isLoginViewVisible = true
    var isSignupBlack = true
    var isLoginBlack = false
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.isHidden = true
        navigationController?.navigationBar.isHidden = true
        btnCountinueWith.layer.borderWidth = 1
        btnCountinueWith.layer.cornerRadius = 10
        hideKeyboardWhenTappedAround()
        btnSignUp.layer.cornerRadius = 10
        btnSignUpBig.layer.cornerRadius = 10
        txtFieldPhone.borderColor = UIColor.lightGray
        
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
        loginBigBtn.layer.cornerRadius = 10
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard string != "\u{8}" else {
            return true
        }
        let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if isValidEmail(email: newText) {
            viewEmail.layer.borderColor = UIColor.green.cgColor
            viewEmail.layer.borderWidth = 1.0
        } else {
            viewEmail.layer.borderColor = UIColor.red.cgColor
            viewEmail.layer.borderWidth = 1.0
        }
        
        if isValidName(name: newText) {
            viewName.layer.borderColor = UIColor.green.cgColor
            viewName.layer.borderWidth = 1.0
        } else {
            viewName.layer.borderColor = UIColor.red.cgColor
            viewName.layer.borderWidth = 1.0
        }
        
        if isValidName(name: newText) {
            viewLastName.layer.borderColor = UIColor.green.cgColor
            viewLastName.layer.borderWidth = 1.0
        } else {
            viewLastName.layer.borderColor = UIColor.red.cgColor
            viewLastName.layer.borderWidth = 1.0
        }
        
        if isValidDesignation(designation: newText) {
            viewDesignation.layer.borderColor = UIColor.green.cgColor
            viewDesignation.layer.borderWidth = 1.0
        } else {
            viewDesignation.layer.borderColor = UIColor.red.cgColor
            viewDesignation.layer.borderWidth = 1.0
        }
        
        if isValidPhoneNumber(phoneNumber: newText) {
            viewPhone.layer.borderColor = UIColor.green.cgColor
            viewPhone.layer.borderWidth = 1.0
        } else {
            viewPhone.layer.borderColor = UIColor.red.cgColor
            viewPhone.layer.borderWidth = 1.0
        }
        
        if isValidPassword(password: newText) {
            viewPassword.layer.borderColor = UIColor.green.cgColor
            viewPassword.layer.borderWidth = 1.0
        } else {
            viewPassword.layer.borderColor = UIColor.red.cgColor
            viewPassword.layer.borderWidth = 1.0
        }
        
        if isValidHotelCode(code: newText) {
            viewHotelRCode.layer.borderColor = UIColor.green.cgColor
            viewHotelRCode.layer.borderWidth = 1.0
        } else {
            viewHotelRCode.layer.borderColor = UIColor.red.cgColor
            viewHotelRCode.layer.borderWidth = 1.0
        }
        return true
    }
    
    // MARK: - Email Validation
    func isValidEmail(email: String) -> Bool {
        // Simple email validation using regular expression
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    func isValidName(name: String) -> Bool {
        // Simple name validation: non-empty and contains only letters
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return !name.isEmpty && namePredicate.evaluate(with: name)
    }
    
    func isValidLastName(lastName: String) -> Bool {
        // Simple name validation: non-empty and contains only letters
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return !lastName.isEmpty && namePredicate.evaluate(with: lastName)
    }
    
    
    func isValidUsername(username: String) -> Bool {
        // Simple username validation: non-empty and contains only alphanumeric characters
        let usernameRegex = "^[a-zA-Z0-9]+$"
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return !username.isEmpty && usernamePredicate.evaluate(with: username)
    }
    
    func isValidHotelCode(code: String) -> Bool {
        // Simple hotel code validation: non-empty
        return !code.isEmpty
    }
    func isValidPhoneNumber(phoneNumber: String) -> Bool {
        // Simple phone number validation using regular expression
        let phoneRegex = "^\\d{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phoneNumber)
    }
    
    func toggleViews() {
        UIView.animate(withDuration: 1) {
            let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            let rotationAngle: CGFloat = self.isLoginViewVisible ? .pi : 0.0
            UIView.transition(with: self.loginView, duration: 1.0, options: transitionOptions, animations: {
                self.loginView.transform = CGAffineTransform(rotationAngle: 0)
            })
            UIView.transition(with: self.signUpView, duration: 1.0, options: transitionOptions, animations: {
                self.signUpView.transform = CGAffineTransform(rotationAngle: 0)
            })
        }
        loginView.isHidden = isLoginViewVisible
        signUpView.isHidden = !isLoginViewVisible
        
        isLoginViewVisible.toggle()
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        //        if isSignupBlack == true {
        //            isSignupBlack = false
        //            btnSignUp.backgroundColor = UIColor.black
        //            btnSignUp.titleLabel?.textColor = UIColor.white
        //            btnLogin.backgroundColor = UIColor.white
        //            btnLogin.titleLabel?.textColor = UIColor.black
        //
        //            toggleViews()
        //        } else {
        //            isSignupBlack = false
        //            btnSignUp.backgroundColor = UIColor.white
        //            btnSignUp.titleLabel?.textColor = UIColor.black
        //            btnLogin.backgroundColor = UIColor.black
        //            btnLogin.titleLabel?.textColor = UIColor.white
        //        }
        btnSignUp.backgroundColor = UIColor.black
        btnLogin.backgroundColor = UIColor.white
        btnSignUp.titleLabel?.textColor = UIColor.white
        btnLogin.titleLabel?.textColor = UIColor.black
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        //        if isSignupBlack == false {
        //            isSignupBlack = true
        //            btnSignUp.backgroundColor = UIColor.black
        //            btnSignUp.titleLabel?.textColor = UIColor.white
        //            btnLogin.backgroundColor = UIColor.white
        //            btnLogin.titleLabel?.textColor = UIColor.black
        //
        //            toggleViews()
        //        } else {
        //            isSignupBlack = false
        //            btnSignUp.backgroundColor = UIColor.white
        //            btnSignUp.titleLabel?.textColor = UIColor.black
        //            btnLogin.backgroundColor = UIColor.black
        //            btnLogin.titleLabel?.textColor = UIColor.white
        //        }
        
        btnLogin.backgroundColor = UIColor.black
        btnSignUp.backgroundColor = UIColor.white
        btnLogin.titleLabel?.textColor = UIColor.white
        btnSignUp.titleLabel?.textColor = UIColor.black
        
        
    }
    
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
        viewLoginPassword.layer.cornerRadius = 10
        viewLoginPassword.layer.borderWidth = 1
        viewLoginPassword.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
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
        //let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        //        UIView.transition(with: authContainerView, duration: 1.0, options: transitionOptions, animations: {
        //        self.authContainerView.isHidden = !self.authContainerView.isHidden
        //    })
        
        
        
        //        UIView.transition(with: loginView, duration: 1.0, options: transitionOptions, animations: {
        //            self.loginView.isHidden = !self.loginView.isHidden
        //        }, completion: nil)
    }
    //    func signUpValidation() {
    //        if txtFieldFirstName.text?.isEmpty == true {
    //            txtFieldFirstName.attributedPlaceholder = NSAttributedString(
    //                string: "First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
    //            )
    //            viewName.borderColor = UIColor.red
    //        } else {
    //            viewName.borderColor = UIColor.textFiledViewLine
    //        }
    //
    //        //MARK: Last name
    //        if txtFIeldLastName.text?.isEmpty == true {
    //            viewLastName.borderColor = UIColor.red
    //            txtFIeldLastName.attributedPlaceholder = NSAttributedString(
    //                string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //
    //        } else {
    //            viewLastName.borderColor = UIColor.textFiledViewLine
    //        }
    //
    //        //MARK: Designation
    //        if txtFieldDesignation.text?.isEmpty == true {
    //            viewDesignation.borderColor = UIColor.red
    //            txtFieldDesignation.attributedPlaceholder = NSAttributedString(
    //                string: "Designation", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //        } else {
    //            viewDesignation.borderColor = UIColor.textFiledViewLine
    //        }
    //
    //        //MARK: Phone number
    //        if txtFieldPhone.text?.isEmpty == true {
    //            viewPhone.borderColor = UIColor.red
    //            txtFieldPhone.attributedPlaceholder = NSAttributedString(
    //                string: "Phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //        } else {
    //            viewPhone.borderColor = UIColor.textFiledViewLine
    //        }
    //
    //        //MARK: Email
    //        if txtFieldEmail.text?.isEmpty == true {
    //            viewEmail.borderColor = UIColor.red
    //            txtFieldEmail.attributedPlaceholder = NSAttributedString(
    //                string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //        } else {
    //            viewEmail.borderColor = UIColor.textFiledViewLine
    //        }
    //
    //        //MARK: Password
    //        if txtFieldPassword.text?.isEmpty == true {
    //            viewPassword.borderColor = UIColor.red
    //            txtFieldPassword.attributedPlaceholder = NSAttributedString(
    //                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //
    //        } else {
    //            viewPassword.borderColor = UIColor.textFiledViewLine
    //        }
    //
    //        if (((txtFieldFirstName.text?.isEmpty) == true) && ((txtFIeldLastName.text?.isEmpty) == true) && ((txtFieldDesignation.text?.isEmpty) == true)) && ((txtFieldEmail.text?.isEmpty == true)) && ((txtFieldPhone.text?.isEmpty == true)) && ((txtFieldPassword.text?.isEmpty == true)) == true {
    //
    //        } else {
    //            if (((txtFieldFirstName.text?.isEmpty) == false) && ((txtFIeldLastName.text?.isEmpty) == false) && ((txtFieldDesignation.text?.isEmpty) == false)) && ((txtFieldEmail.text?.isEmpty == false)) && ((txtFieldPhone.text?.isEmpty == false)) && ((txtFieldPassword.text?.isEmpty == false)) == true {
    //
    //                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
    //                self.navigationController?.pushViewController(vc, animated: true)
    //                // self.signUPRequest()
    //            } else {
    //
    //            }
    //
    //        }
    //    }
    // MARK: - Action
    
    @IBAction func signUpBigBtnPressed(_ sender: UIButton) {
        //signUpValidation()
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
        //animateView()
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        //        self.navigationController?.pushViewController(vc, animated: false)
        //
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
    @IBAction func showLoginPasswordBtnPressed(_ sender: UIButton) {
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
        
        //loginValidation()
    }
    
    // MARK: - Phone Number Validation
    
    func isValidDesignation(designation: String) -> Bool {
        // Simple designation validation: non-empty and contains only letters and spaces
        let designationRegex = "^[a-zA-Z\\s]+$"
        let designationPredicate = NSPredicate(format: "SELF MATCHES %@", designationRegex)
        return designationPredicate.evaluate(with: designation)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^A-Za-z\\d]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}

extension SignUpViewController : UITextFieldDelegate {
    
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
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
}
