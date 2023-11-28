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
    
    @IBOutlet weak var termOfServiceLbl: CustomLabel!
    @IBOutlet weak var signUpHotelRcode: UITextField!
    
    //login view
    @IBOutlet weak var txtFieldLoginPassword: UITextField!
    @IBOutlet weak var txtFieldHotelRCode: UITextField!
    @IBOutlet weak var loginBigBtn: UIButton!
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var viewLoginPassword: UIView!
    @IBOutlet weak var viewHotelRCode: UIView!
    @IBOutlet weak var viewUserName: UIView!
    var activeTextField : UITextField? = nil
    
    var iconClick = true
    var isLoginViewVisible = true
    var isSignupViewVisible = true
    var isLoginBlack = false
    
    //MARK: designation
    let designations = ["Manager", "Developer", "Designer", "Tester"]
    var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.isHidden = true
        signUpView.isHidden = false
        navigationController?.navigationBar.isHidden = true
        btnCountinueWith.layer.borderWidth = 1
        btnCountinueWith.layer.cornerRadius = 10
        hideKeyboardWhenTappedAround()
        btnSignUp.layer.cornerRadius = 10
        btnSignUpBig.layer.cornerRadius = 10
        txtFieldPhone.borderColor = UIColor.lightGray
        
        changeTextFieldBorderLine()
        changeTextFieldPlaceholderTextColor()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        TermsAndCondition()
        
        designationPickerView()
    }
    
    func designationPickerView() {
        // Set up the pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Set the input view of the text field to the pickerView
        txtFieldDesignation.inputView = pickerView
        
        // Add a toolbar with a "Done" button to dismiss the pickerView
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        // Set the input accessory view of the text field to the toolbar
        txtFieldDesignation.inputAccessoryView = toolbar
    }
    
    func signUpPostRequest(firstName:String, lastName:String, designation:String, phoneNumber:String, email:String,password:String, completion: @escaping (SignUpModels?, Error?) -> Void) {
        
        let parameters = ["firstName":firstName, "lastName":lastName, "designation":designation, "phoneNumber":phoneNumber,"email":email, "password":password ]
        let url = URL(string: "https://api.hotelratna.com/api/addUser")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                
                return
            }
            
            do {
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                let model = try JSONDecoder().decode(SignUpModels.self, from: data)
                print(json)
                completion(model, nil)
            } catch let error {
                print(error.localizedDescription)
                print(error)
                completion(nil, error)
            }
        })
        
        task.resume()
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
        signUpView.isHidden = isLoginViewVisible
        loginView.isHidden = !isLoginViewVisible
        
        isLoginViewVisible.toggle()
    }
    
    
    @IBAction func signUpBigBtn(_ sender: Any) {
        print("tapp")
        signUpValidation()
    }
    
    @IBAction func rownBtn(_ sender: Any) {
        openURLButtonTapped()
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let color = UIColor(red: 231, green: 236, blue: 244, alpha: 1.0)
        btnSignUp.backgroundColor = .black
        btnSignUp.setTitleColor(UIColor(red: 231, green: 236, blue: 244, alpha: 1.0), for: .normal)
        
        btnLogin.backgroundColor = UIColor.textFiledViewLine
        btnLogin.setTitleColor(.black, for: .normal)
        toggleViews()
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
    
    func validatePhoneNumber() {
        guard let phoneNumber = txtFieldPhone.text else {
            return
        }
        let isValidPhoneNumber = isValidPhoneNumber(phoneNumber: phoneNumber)
        
        viewPhone.backgroundColor = isValidPhoneNumber ? .black : .red
        txtFieldPhone.backgroundColor = isValidPhoneNumber ? .black : .red
    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        //validatePhoneNumber()
    }
    
    
    func changeTextFieldPlaceholderTextColor(){
        let color = UIColor.init(named: "TextColor")
        txtFieldFirstName.attributedPlaceholder = NSAttributedString(string: txtFieldFirstName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldLastName.attributedPlaceholder = NSAttributedString(string: txtFIeldLastName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldDesignation.attributedPlaceholder = NSAttributedString(string: txtFieldDesignation.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldPhone.attributedPlaceholder = NSAttributedString(string: txtFieldPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldEmail.attributedPlaceholder = NSAttributedString(string: txtFieldEmail.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldPassword.attributedPlaceholder = NSAttributedString(string: txtFieldPassword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        signUpHotelRcode.attributedPlaceholder = NSAttributedString(string: signUpHotelRcode.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldLoginPassword.attributedPlaceholder = NSAttributedString(string: txtFieldLoginPassword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    func TermsAndCondition() {
        let attributedText = NSMutableAttributedString(string: termOfServiceLbl.text ?? "")
        let range = (termOfServiceLbl.text! as NSString).range(of: "Terms of Services")
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: termOfServiceLbl.font.pointSize), range: range)
        let boldFont = UIFont.boldSystemFont(ofSize: termOfServiceLbl.font.pointSize)
        attributedText.addAttributes([.font: boldFont, .foregroundColor: UIColor.black], range: range)
        termOfServiceLbl.attributedText = attributedText
    }
    
    func signUpValidation() {
        if isValidName(name: txtFieldFirstName.text!) {
            //txtFieldFirstName.attributedPlaceholder = NSAttributedString(
            //string: "First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            //)
            viewName.borderColor = UIColor.textFiledViewLine
        } else {
            viewName.borderColor = UIColor.red
            
        }
        
        //MARK: Last name
        if isValidLastName(lastName: txtFIeldLastName.text!) {
            
            txtFIeldLastName.attributedPlaceholder = NSAttributedString(
                string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
            viewLastName.borderColor = UIColor.textFiledViewLine
        } else {
            viewLastName.borderColor = UIColor.red
            
        }
        
        //MARK: Designation
        if isValidDesignation(designation: signUpHotelRcode.text!) {
            txtFieldDesignation.attributedPlaceholder = NSAttributedString(
                string: "Hotel Owner", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            viewDesignation.borderColor = UIColor.textFiledViewLine
        } else {
            viewDesignation.borderColor = UIColor.red
            
        }
        
        //MARK: Phone number
        if  isValidPhoneNumber(phoneNumber: txtFieldPhone.text!) {
            txtFieldPhone.attributedPlaceholder = NSAttributedString(
                string: "Phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            viewPhone.borderColor = UIColor.textFiledViewLine
        } else {
            viewPhone.borderColor = UIColor.red
            
        }
        
        //MARK: Email
        if  isValidEmail(email: txtFieldEmail.text!) {
            viewEmail.borderColor = UIColor.textFiledViewLine
            txtFieldEmail.attributedPlaceholder = NSAttributedString(
                string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            viewEmail.borderColor = UIColor.red
        }
        
        //MARK: Password
        if isValidPassword(password: txtFieldPassword.text!) {
            viewPassword.borderColor = UIColor.textFiledViewLine
            txtFieldPassword.attributedPlaceholder = NSAttributedString(
                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
        } else {
            viewPassword.borderColor = UIColor.red
        }
        
        if (((txtFieldFirstName.text?.isEmpty) == true) && ((txtFIeldLastName.text?.isEmpty) == true) && ((txtFieldDesignation.text?.isEmpty) == true)) && ((txtFieldEmail.text?.isEmpty == true)) && ((txtFieldPhone.text?.isEmpty == true)) && ((txtFieldPassword.text?.isEmpty == true)) == true {
            
        } else {
            if (((txtFieldFirstName.text?.isEmpty) == false) && ((txtFIeldLastName.text?.isEmpty) == false) && ((txtFieldDesignation.text?.isEmpty) == false)) && ((txtFieldEmail.text?.isEmpty == false)) && ((txtFieldPhone.text?.isEmpty == false)) && ((txtFieldPassword.text?.isEmpty == false)) == true {
                
                //                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                //                self.navigationController?.pushViewController(vc, animated: true)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                self.signUpPostRequest(firstName: txtFieldFirstName.text!, lastName: txtFIeldLastName.text!, designation: txtFieldDesignation.text!, phoneNumber: txtFieldPhone.text!, email: txtFieldEmail.text!, password: txtFieldPassword.text!) { data, error in
                    if let statuscode = data?.statuscode {
                        print(statuscode)
                    } else {
                        print(error)
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                //                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                //                self.signUpPostRequest(firstName: txtFieldFirstName.text!, lastName: txtFIeldLastName.text!, designation: txtFieldDesignation.text!, phoneNumber: txtFieldPhone.text!, email: txtFieldEmail.text!, password: txtFieldPassword.text!) { data, error in
                //                    if let statuscode = data?.statuscode {
                //                        print(statuscode)
                //                    } else {
                //                        print(error)
                //                    }
                //                }
                //                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func openURLButtonTapped() {
        if let url = URL(string: "https://www.retvensservices.com/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
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
        btnLogin.backgroundColor = .black
        let color = UIColor(red: 231, green: 236, blue: 244, alpha: 1.0)
        btnLogin.setTitleColor(color, for: .normal)
        
        btnSignUp.backgroundColor = UIColor.textFiledViewLine
        btnSignUp.setTitleColor(.black, for: .normal)
        toggleViews()
    }
    
    func loginValidation() {
        if isValidUsername(username: txtFieldUserName.text!) {
            txtFieldUserName.attributedPlaceholder = NSAttributedString(
                string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            viewUserName.borderColor = UIColor.textFiledViewLine
        }else {
            viewUserName.borderColor = UIColor.red
            
        }
        if isValidHotelCode(code: txtFieldHotelRCode.text!) {
            
            txtFieldHotelRCode.attributedPlaceholder = NSAttributedString(
                string: "Hotel RCode", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            print("incorrect - try again")
            viewHotelRCode.borderColor = UIColor.textFiledViewLine
        } else {
            viewHotelRCode.borderColor = UIColor.red
        }
        
        if isValidPassword(password: txtFieldLoginPassword.text!) {
            txtFieldLoginPassword.attributedPlaceholder = NSAttributedString(
                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            print("incorrect - try again")
            viewLoginPassword.borderColor = UIColor.textFiledViewLine
        } else {
            viewLoginPassword.borderColor = UIColor.red
            
        }
        
        if (((txtFieldUserName.text?.isEmpty) != nil) && ((txtFieldPassword.text?.isEmpty) != nil) && ((txtFieldHotelRCode.text?.isEmpty) != nil)) == true {
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
        loginValidation()
    }
    
    // MARK: - Phone Number Validation
    
    func isValidDesignation(designation: String) -> Bool {
        // Simple designation validation: non-empty and contains only letters and spaces
        let designationRegex = "^[a-zA-Z\\s]+$"
        let designationPredicate = NSPredicate(format: "SELF MATCHES %@", designationRegex)
        return designationPredicate.evaluate(with: designation)
    }
    
    
}

extension SignUpViewController : UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return designations.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return designations[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            txtFieldDesignation.text = designations[row]
        }

        // MARK: - UITextFieldDelegate method

        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.activeTextField = textField
            if txtFieldDesignation.text == "" {
                txtFieldDesignation.text = designations[0]
            }
        }

        // MARK: - Custom method to handle "Done" button tap

        @objc func didTapDone() {
            txtFieldDesignation.resignFirstResponder()
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

