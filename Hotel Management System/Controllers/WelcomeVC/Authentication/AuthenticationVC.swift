//
//  AuthenticationVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 21/11/23.
//

import UIKit
import iOSDropDown

class AuthenticationVC: UIViewController{
    
    // MARK: - Outlet
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var viewPasswordLogin: UIView!
    @IBOutlet weak var viewHotelRCodeLogin: UIView!
    @IBOutlet weak var viewUserNameLogin: UIView!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewDesignation: UIView!
    @IBOutlet weak var viewFirstName: UIView!
    @IBOutlet weak var viewLastName: UIView!
    @IBOutlet weak var heightConstDesignationTableView: NSLayoutConstraint!
    @IBOutlet weak var termsAndServicesLbl: CustomLabel!
    @IBOutlet weak var designationTableView: UITableView!
    @IBOutlet weak var txtFieldLoginPassword: UITextField!
    @IBOutlet weak var txtFieldHotelRCOde: UITextField!
    @IBOutlet weak var txtFIeldUserName: UITextField!
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var viewSignUp: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldDesignation: UITextField!
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPasssword: UITextField!
    // MARK: - Varriable
    let userDefaults = UserDefaults.standard
    var isLoginViewVisible = false
    var iconClick = true
    var employeeData: [EmployeeData] = []
    var activeTextField : UITextField? = nil
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getDesignationApiCalling()
        txtFieldPhone.delegate = self
        txtFieldDesignation.delegate = self
        designationTableView.isHidden = true
        //heightConstDesignationTableView.constant = 0
        hideKeyboardWhenTappedAround()
        btnLogin.cornerRadius = 10
        TermsAndCondition()
        designationTableView.register(UINib(nibName: "DesignationTableCell", bundle: nil),forCellReuseIdentifier: "DesignationTableCell")
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // MARK: - Function
    func changeTextFieldPlaceholderTextColor(){
        let color = UIColor.init(named: "TextColor")
        txtFieldFirstName.attributedPlaceholder = NSAttributedString(string: txtFieldFirstName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldLastName.attributedPlaceholder = NSAttributedString(string: txtFieldLastName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldDesignation.attributedPlaceholder = NSAttributedString(string: txtFieldDesignation.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
         txtFieldPhone.attributedPlaceholder = NSAttributedString(string: txtFieldPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldEmail.attributedPlaceholder = NSAttributedString(string: txtFieldEmail.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldPasssword.attributedPlaceholder = NSAttributedString(string: txtFieldPasssword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFIeldUserName.attributedPlaceholder = NSAttributedString(string: txtFIeldUserName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldHotelRCOde.attributedPlaceholder = NSAttributedString(string: txtFieldHotelRCOde.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldLoginPassword.attributedPlaceholder = NSAttributedString(string: txtFieldLoginPassword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    func signUpAnimation() {
        viewSignUp.frame.origin.x = containerView.frame.width
        viewLogin.frame.origin.x = 0
    }
    
    func TermsAndCondition() {
        let attributedText = NSMutableAttributedString(string: termsAndServicesLbl.text ?? "")
        let range = (termsAndServicesLbl.text! as NSString).range(of: "Terms of Services")
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: termsAndServicesLbl.font.pointSize), range: range)
        let boldFont = UIFont.boldSystemFont(ofSize: termsAndServicesLbl.font.pointSize)
        attributedText.addAttributes([.font: boldFont, .foregroundColor: UIColor.black], range: range)
        termsAndServicesLbl.attributedText = attributedText
    }
    
    func signUpValidation() {
        if txtFieldFirstName.text?.isEmpty == true {
            txtFieldFirstName.attributedPlaceholder = NSAttributedString(
                string: "First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            viewFirstName.borderColor = UIColor.red
        } else {
            viewFirstName.borderColor = UIColor.textFiledViewLine
        }
        //MARK: Last name
        if txtFieldLastName.text?.isEmpty == true {
            viewLastName.borderColor = UIColor.red
            txtFieldLastName.attributedPlaceholder = NSAttributedString(
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
       
        guard let phoneNumber = txtFieldPhone.text else {
                   
                    return
                }
        let cleanedPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        if txtFieldPhone.text?.isEmpty == true && cleanedPhoneNumber.count != 10  {
            viewPhone.borderColor = UIColor.red
            txtFieldPhone.attributedPlaceholder = NSAttributedString(
                string: "Phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else if cleanedPhoneNumber.count == 10 {
            viewPhone.borderColor = UIColor.textFiledViewLine
        } else {
            viewPhone.borderColor = UIColor.red
            txtFieldPhone.attributedPlaceholder = NSAttributedString(
                string: "Phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        //MARK: Email
        if txtFieldEmail.text?.isEmpty == true {
            txtFieldEmail.attributedPlaceholder = NSAttributedString(
                string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            viewEmail.borderColor = UIColor.red
        } else {
            viewEmail.borderColor = UIColor.textFiledViewLine
        }
       if !isValidEmail(email: txtFieldEmail.text!) {
           txtFieldEmail.attributedPlaceholder = NSAttributedString(
               string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
           viewEmail.borderColor = UIColor.red
       } else {
           viewEmail.borderColor = UIColor.textFiledViewLine
       }
        //MARK: Password
        if txtFieldPasssword.text?.isEmpty == true {
            viewPassword.borderColor = UIColor.red
            txtFieldPasssword.attributedPlaceholder = NSAttributedString(
                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            viewPassword.borderColor = UIColor.textFiledViewLine
            signUpAPiCalling()
        }
    }
    
    func loginValidation() {
        if txtFIeldUserName.text?.isEmpty == true {
            txtFIeldUserName.attributedPlaceholder = NSAttributedString(
                string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            viewUserNameLogin.borderColor = UIColor.red
        } else {
            viewUserNameLogin.borderColor = UIColor.textFiledViewLine
        }
        //MARK: Last name
        if txtFieldHotelRCOde.text?.isEmpty == true {
            viewHotelRCodeLogin.borderColor = UIColor.red
            txtFieldHotelRCOde.attributedPlaceholder = NSAttributedString(
                string: "HotelRCode", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            viewHotelRCodeLogin.borderColor = UIColor.textFiledViewLine
        }
        //MARK: Designation
        if txtFieldLoginPassword.text?.isEmpty == true {
            viewPasswordLogin.borderColor = UIColor.red
            txtFieldLoginPassword.attributedPlaceholder = NSAttributedString(
                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            viewPasswordLogin.borderColor = UIColor.textFiledViewLine
            loginApiCalling()
        }
        
       
    }
    
    // MARK: - Function Get Designation Api calling
    func getDesignationApiCalling(){
        APIManager.shared.getDesignation { result in
            switch result {
            case .success(let employee):
                DispatchQueue.main.async {
                    self.employeeData = employee.data
                    self.designationTableView.reloadData()
                }
            case .failure(let error):
                print("API Call Failed. Error: \(error)")
            }
        }
    }
    
    func signUpAPiCalling(){
        LoadingOverlay.shared.showOverlay(view:nwindow.window!)
        APIManager.shared.postRequestSignUp(firstName: txtFieldFirstName.text ?? "", lastName: txtFieldLastName.text ?? "", designation: txtFieldDesignation.text ?? "", phoneNumber: txtFieldPhone.text ?? "", email: txtFieldEmail.text ?? "", password: txtFieldPasssword.text ?? "") { model, error in
            DispatchQueue.main.async {
                if model?.statuscode == 200 {
                    if let encoded = try? JSONEncoder().encode(model) {
                        self.userDefaults.set(encoded, forKey: "userData")
                        self.userDefaults.setValue(model?.userId, forKey: "userId")
                        LoadingOverlay.shared.hideOverlayView()
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                        vc.userId = model?.userId
                        self.navigationController?.pushViewController(vc, animated: true)
                        self.userDefaults.set(encoded, forKey: "userData")
                        self.showAlert(message: (model?.message)!)
                    }else {
                        self.showAlert(message: (model?.message!)!)
                        LoadingOverlay.shared.hideOverlayView()
                    }
                }
                print(model)
                print(error)
            }
        }
    }
    
    func loginApiCalling(){
        LoadingOverlay.shared.showOverlay(view:nwindow.window!)
        APIManager.shared.postRequestLogin(username: txtFIeldUserName.text ?? "", hotelCode: txtFieldHotelRCOde.text ?? "", password: txtFieldLoginPassword.text ?? "") { data, error in
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
                if let cheak = data{
                    if cheak.statuscode == 200 {
                        let authCode = cheak.data?.token
                        let userId = cheak.data?.userId
                        print(authCode, userId)
                        UserDefaults.standard.setValue(authCode, forKey: "authcode")
                        UserDefaults.standard.setValue(userId, forKey: "userId")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewPropertyProfileVC")as! NewPropertyProfileVC
                            self.navigationController?.pushViewController(vc, animated: true)
                            self.showAlert(message: cheak.message!)
                    
                        print("sucesss")
                    } else{
                        self.showAlert(message: cheak.message!)
                    }
                    print(data)
                    print(error)
                }
            }
        }
    }
    
    // MARK: - Action Signup Page Change
    @IBAction func signUpBtnPRessed(_ sender: UIButton) {
        let color = UIColor(red: 231, green: 236, blue: 244, alpha: 1.0)
        btnSignUp.backgroundColor = .black
        btnSignUp.setTitleColor(UIColor(red: 231, green: 236, blue: 244, alpha: 1.0), for: .normal)
        
        btnLogin.backgroundColor = UIColor.textFiledViewLine
        btnLogin.setTitleColor(.black, for: .normal)
        if isLoginViewVisible {
            UIView.animate(withDuration: 0.5, animations: {
                self.viewLogin.frame.origin.x = self.containerView.frame.width
                self.viewSignUp.frame.origin.x = 0
            }) { _ in
                self.viewLogin.isHidden = true
                self.viewSignUp.isHidden = false
                self.isLoginViewVisible = false
            }
        }
    }
    //MARK: - Action login Page Change
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        btnLogin.backgroundColor = .black
        let color = UIColor(red: 231, green: 236, blue: 244, alpha: 1.0)
        btnLogin.setTitleColor(color, for: .normal)
        self.designationTableView.isHidden = true
        btnSignUp.backgroundColor = UIColor.textFiledViewLine
        btnSignUp.setTitleColor(.black, for: .normal)
        if !isLoginViewVisible {
            UIView.animate(withDuration: 0.5, animations: {
                self.viewLogin.frame.origin.x = 0
                self.viewSignUp.frame.origin.x = -self.containerView.frame.width
            }) { _ in
                self.viewLogin.isHidden = false
                self.viewSignUp.isHidden = true
                self.isLoginViewVisible = true
            }
        }
    }
    //MARK: - Action SignUp
    @IBAction func signUpBigBtnPressed(_ sender: UIButton) {
        signUpValidation()
    }
    //MARK: - Action Forgot Password
    @IBAction func forgotBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func loginBigBtnPressed(_ sender: UIButton) {
        //designationTableView.isHidden = true
        loginValidation()
     
    }
    
    //MARK: - Action Login Password Show
    @IBAction func loginPasswordShowBtnPressed(_ sender: UIButton) {
        if iconClick {
            txtFieldLoginPassword.isSecureTextEntry = false
        } else {
            txtFieldLoginPassword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    //MARK: - Action SignUp password Show
    @IBAction func signUpPasswordShowBtnPressed(_ sender: UIButton) {
        if iconClick {
            txtFieldPasssword.isSecureTextEntry = false
        } else {
            txtFieldPasssword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    //MARK: - Action Contiue with R owner
    @IBAction func continueWithROwner(_ sender: UIButton) {
        if let url = URL(string: "https://www.retvensservices.com/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

//MARK: - Extension Tableview Designation
extension AuthenticationVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DesignationTableCell", for: indexPath) as! DesignationTableCell
        let designation = employeeData[indexPath.row].designation
        cell.lblDesignation.text = designation
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let designation = employeeData[indexPath.row].designation
        txtFieldDesignation.text = designation
        designationTableView.isHidden = true
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            // Set the background color for selected cells
            let selectedBackgroundView = UIView()
            selectedBackgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = selectedBackgroundView
        }
}

//MARK: - TextFieldDelegates
extension AuthenticationVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if txtFieldDesignation.isFirstResponder == true {
            designationTableView.isHidden = false
        } else {
            designationTableView.isHidden = true
        }
        self.activeTextField = textField
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        var shouldMoveViewUp = false
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Check if the combined text length will exceed 10 characters
        if textField == txtFieldPhone {
            let currentText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            return currentText.count <= 11
        }
        return true
    }

    
}

