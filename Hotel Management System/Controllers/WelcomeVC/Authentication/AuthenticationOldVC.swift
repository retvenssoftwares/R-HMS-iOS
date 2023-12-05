//
//  AuthenticationVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 21/11/23.
//

import UIKit
import iOSDropDown
class AuthenticationVC: UIViewController {
    
    
    @IBOutlet weak var txtFieldCountryCode: DropDown!
    @IBOutlet weak var termOfServicesLbl: CustomLabel!
    @IBOutlet weak var btnLogin: CustomButton!
    @IBOutlet weak var btnSignUp: CustomButton!
    @IBOutlet weak var viewSignupPassword: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewDesignation: UIView!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewLastName: UIView!
    @IBOutlet weak var txtFieldLoginPassword: UITextField!
    @IBOutlet weak var txtFieldHotelRCOde: UITextField!
    @IBOutlet weak var viewUsername: UIView!
    @IBOutlet weak var viewRcode: UIView!
    @IBOutlet weak var txtFIeldUserName: UITextField!
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var viewSignUp: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldDesignation: DropDown!
    
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPasssword: UITextField!
    
    @IBOutlet weak var viewLoginPassword: UIView!
    var designations: [String] = []
    var pickerView: UIPickerView!
    var pickerViewOne: UIPickerView!
    var countryCodes = [[String]]()
    var isLoginViewVisible = false
    var iconClick = true
    let designationList = ["iOS Developer","General Manager", "Front Desk Manager", "Housekeeping Supervisor", "Chef", "Concierge"]
    let countryDialingCodes = ["+1", "+44", "+81", "+86", "+91", "+33", "+49", "+7", "+55", "+61", "+34"]
    var countrys = [[String]]()
    let countryList = GlobalConstants.Constants.codePrefixes
    let userDefaults = UserDefaults()
    var activeTextField : UITextField? = nil
    var userId: String = ""
    //var designations: [Designation] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.countryCodes = getAllCountryCodes()
        print(countrys, countryCodes)
        txtFieldDesignation.delegate = self
        picker()
        parseJSONResponse()
        hideKeyboardWhenTappedAround()
        viewSignUp.isHidden = false
        signUpAnimation()
        fetchDesignationData()
        getDesignation()
        //txtFieldDesignation.optionArray = designations
        txtFieldCountryCode.textAlignment = .left
        txtFieldCountryCode.inputView = UIView()
        textfieldDelegate()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        TermsAndCondition()
        //setupTextFields()
        
    }
    func handleSelectionOfDesignation(_ selectedDesignation: Designation) {
        txtFieldDesignation.optionArray = [selectedDesignation.designation]
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtFieldCountryCode, txtFieldCountryCode.handleKeyboard == true {
            txtFieldCountryCode.handleKeyboard = false
            return false
        }
        return true
    }
    
    func textfieldDelegate() {
        txtFieldFirstName.delegate = self
        txtFieldLastName.delegate = self
        txtFieldPhone.delegate = self
        txtFieldEmail.delegate = self
        txtFieldDesignation.delegate = self
        txtFieldDesignation.delegate = self
        
        txtFieldFirstName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtFieldLastName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtFieldPhone.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtFieldDesignation.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtFieldEmail.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtFieldPasssword.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        switch textField {
        case txtFieldFirstName:
            validateFirstName()
        case txtFieldLastName:
            validateLastName()
        case txtFieldPhone:
            validatePhoneNumber()
        case txtFieldEmail:
            validateEmail()
        case txtFieldDesignation:
            validateDesignation()
        case txtFieldPasssword:
            validatePassword()
        default:
            break
        }
    }
    
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
        //viewSignUp.isHidden = true
        
    }
    func fetchDesignations(completion: @escaping (Result<[Designation], APIError>) -> Void) {
        guard let url = URL(string: "https://api.hotelratna.com/designations") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.decodingError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let designations = try decoder.decode([Designation].self, from: data)
                completion(.success(designations))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        
        task.resume()
    }
    
    
    func fetchDesignationData() {
        fetchDesignations { result in
            switch result {
            case .success(let fetchedDesignations):
                self.designations = self.designations
                DispatchQueue.main.async {
                    print(self.designations)
                }
            case .failure(let error):
                print("Error fetching designations: \(error)")
            }
        }
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
        if txtFieldPasssword.text?.isEmpty == true {
            viewSignupPassword.borderColor = UIColor.red
            txtFieldPasssword.attributedPlaceholder = NSAttributedString(
                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
        } else {
            viewSignupPassword.borderColor = UIColor.textFiledViewLine
        }
        
        if (((txtFieldFirstName.text?.isEmpty) == true) && ((txtFieldLastName.text?.isEmpty) == true) && ((txtFieldDesignation.text?.isEmpty) == true)) && ((txtFieldEmail.text?.isEmpty == true)) && ((txtFieldPhone.text?.isEmpty == true)) && ((txtFieldPasssword.text?.isEmpty == true)) == true {
            
        } else {
            if (((txtFieldFirstName.text?.isEmpty) == false) && ((txtFieldLastName.text?.isEmpty) == false) && ((txtFieldDesignation.text?.isEmpty) == false)) && ((txtFieldEmail.text?.isEmpty == false)) && ((txtFieldPhone.text?.isEmpty == false)) && ((txtFieldPasssword.text?.isEmpty == false)) == true {
                signupCheck()
                
                //                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                //                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                //                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                //                self.navigationController?.pushViewController(vc, animated: false)
            }
            
        }
    }
    
    //MARK: login view
    func loginValidation() {
        if txtFIeldUserName.text?.isEmpty == true {
            txtFIeldUserName.attributedPlaceholder = NSAttributedString(
                string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            
            viewUsername.borderColor = UIColor.red
        }else {
            viewUsername.borderColor = UIColor.textFiledViewLine
        }
        if txtFieldHotelRCOde.text?.isEmpty == true {
            viewRcode.borderColor = UIColor.red
            txtFieldHotelRCOde.attributedPlaceholder = NSAttributedString(
                string: "Hotel RCode", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            print("incorrect - try again")
            
            //   self.present(alert, animated: true, completion: nil)
            
        } else {
            viewRcode.borderColor = UIColor.textFiledViewLine
        }
        if txtFieldLoginPassword.text?.isEmpty == true {
            viewLoginPassword.borderColor = UIColor.red
            txtFieldLoginPassword.attributedPlaceholder = NSAttributedString(
                string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            print("incorrect - try again")
            
        } else {
            viewLoginPassword.borderColor = UIColor.textFiledViewLine
        }
        
        if (((txtFIeldUserName.text?.isEmpty) != nil) && ((txtFieldLoginPassword.text?.isEmpty) != nil) && ((txtFieldHotelRCOde.text?.isEmpty) != nil)) == false {
            //let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashboradVC") as! DashboradVC
            //  self.navigationController?.pushViewController(vc, animated: true)
        } else {
            APIManager.shared.postRequestLogin(username: txtFIeldUserName.text ?? "", hotelCode: txtFieldHotelRCOde.text ?? "", password: txtFieldLoginPassword.text ?? "") { model, error in
                DispatchQueue.main.async {
                    if let statusCode = model {
                        if statusCode.statuscode == 200 {
                            print("success")
                            self.userDefaults.setValue(statusCode.loginModel?.token, forKey: "authcode")
                            print(statusCode.loginModel?.token, statusCode.message)
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashboradVC") as! DashboradVC
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                }
                
                
            }
            
        }
    }
    
    //MARK: designation data
    func parseJSONResponse() {
        if let responseData = """
        {
            "data": [
                {"_id": "653f55e40cca324377cd7706", "designationId": "p32MAvIT", "designation": "manager"},
                {"_id": "653f560e0cca324377cd7708", "designationId": "ozDXV8C4", "designation": "hotel Clerk"},
                {"_id": "653f56270cca324377cd770a", "designationId": "kHi1trKq", "designation": "Guest services associate"},
                {"_id": "653fa118ecb305767af08e33", "designationId": "bYtqgFQg", "designation": "Housekeeper"},
                {"_id": "653fa12cecb305767af08e35", "designationId": "uPqfj4sE", "designation": "Hotel Manager"},
                {"_id": "653fa13eecb305767af08e37", "designationId": "CDXNeBZr", "designation": "Front Desk Associate"},
                {"_id": "653fa14decb305767af08e39", "designationId": "BXyVr0Wu", "designation": "Front Desk Supervisor"}
            ],
            "statusCode": 200
        }
        """.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                if let jsonData = json as? [String: Any],
                   let dataArray = jsonData["data"] as? [[String: Any]] {
                    for data in dataArray {
                        if let designation = data["designation"] as? String {
                            designations.append(designation)
                            print(designations)
                        }
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    func signUpPostRequest(firstName:String, lastName:String, designation:String, phoneNumber:String, email:String,password:String, completion: @escaping (SignUpModels?, Error?) -> Void) {
        
        let parameters = ["firstName":firstName, "lastName":lastName, "designation":designation, "phoneNumber":phoneNumber,"email":email, "password":password ]
        let url = URL(string: APIManager.UsersAuth.signUpUser)!
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
                DispatchQueue.main.async {
                    if let statuscode =  model.statuscode, let userId = model.userId, statuscode == 200 {
                        
                        print(model.statuscode, model.userId)
                        self.userDefaults.setValue(self.userId, forKey: "userId")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                        vc.userId = userId
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
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
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
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
    
    func openURLButtonTapped() {
        if let url = URL(string: "https://www.retvensservices.com/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func TermsAndCondition() {
        let attributedText = NSMutableAttributedString(string: termOfServicesLbl.text ?? "")
        let range = (termOfServicesLbl.text! as NSString).range(of: "Terms of Services")
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: termOfServicesLbl.font.pointSize), range: range)
        let boldFont = UIFont.boldSystemFont(ofSize: termOfServicesLbl.font.pointSize)
        attributedText.addAttributes([.font: boldFont, .foregroundColor: UIColor.black], range: range)
        termOfServicesLbl.attributedText = attributedText
    }
    
    func getAllCountryCodes() -> [[String]] {
        for item in countryList {
            countrys.append(item.value)
        }
        let sorted = countrys.sorted(by: {$0[0] < $1[0]})
        return sorted
    }
    
    // MARK: - Create UIPickerView
    
    func picker(){
        pickerView = UIPickerView()
        pickerViewOne = UIPickerView()
        pickerViewOne.delegate = self
        pickerViewOne.dataSource = self
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.white
        txtFieldCountryCode.inputView = pickerViewOne
        txtFieldDesignation.inputView = pickerView
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        txtFieldDesignation.inputAccessoryView = toolbar
        txtFieldCountryCode.inputAccessoryView = toolbar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
    }
    
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        btnLogin.backgroundColor = .black
        let color = UIColor(red: 231, green: 236, blue: 244, alpha: 1.0)
        btnLogin.setTitleColor(color, for: .normal)
        
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
    
    func signupCheck () {
        signUpPostRequest(firstName: txtFieldFirstName.text ?? "", lastName: txtFieldLastName.text ?? "", designation: txtFieldDesignation.text ?? "", phoneNumber: txtFieldPhone.text ?? "", email: txtFieldEmail.text ?? "", password: txtFieldPasssword.text ?? "") { (newdata, error) in
            DispatchQueue.main.async {
                if newdata?.statuscode == 200{
                    if let encoded = try? JSONEncoder().encode(newdata) {
                        //                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                        //                        vc.userId = self.userId
                        //                        print(vc.userId, self.userId)
                        //                        self.navigationController?.pushViewController(vc, animated: true)
                        
                        //self.present(alert, animated: true, completion: nil)
                        
                    }
                }
            }
            print(newdata)
            print(error)
        }
    }
    
    //MARK: Get Designation
    func getDesignation()  {
        var request = URLRequest(url: URL(string: APIManager.UsersAuth.getDesignation)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            print(response)
        }
        
        task.resume()
    }
    
    @IBAction func signUpBigBtnPressed(_ sender: UIButton) {
        //signUpValidation()
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
        
        //self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func forgotBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBigBtnPressed(_ sender: UIButton) {
        self.loginValidation()
    }
    
    @IBAction func loginPasswordShowBtnPressed(_ sender: UIButton) {
        if iconClick {
            txtFieldLoginPassword.isSecureTextEntry = false
        } else {
            txtFieldLoginPassword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
//    func setupTextFields() {
//        txtFieldPhone.addTarget(self,
//                                action: #selector(self.textFieldDidChange(_:)),
//                                for: UIControl.Event.editingChanged)
//        //        name2.addTarget(self,
//        //                        action: #selector(self.textFieldDidChange(_:)),
//        //                        for: UIControl.Event.editingChanged)
//        //        name3.addTarget(self,
//        //                        action: #selector(self.textFieldDidChange(_:)),
//        //                        for: UIControl.Event.editingChanged)
//        //        name4.addTarget(self,
//        //                        action: #selector(self.textFieldDidChange(_:)),
//        //                        for: UIControl.Event.editingChanged)
//    }
    
    @IBAction func signUpPasswordShowBtnPressed(_ sender: UIButton) {
        if iconClick {
            txtFieldPasssword.isSecureTextEntry = false
        } else {
            txtFieldPasssword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func continueWithROwner(_ sender: UIButton) {
        self.openURLButtonTapped()
    }
}

extension AuthenticationVC: UITextFieldDelegate {
    
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
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



extension AuthenticationVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - UIPickerView Delegate Methods
    
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return countryCodes.count
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        let code = countryCodes[row]
    //        return "\(code[0]) +\(code[1])"
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        let code = countryCodes[row]
    //        txtFieldCountryCode.text = "+\(code[1])"
    //    }
    //}
    
    
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
        //txtFieldDesignation.resignFirstResponder()
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
    
    @objc func doneButtonTapped() {
        // Handle done button tap if needed
        txtFieldDesignation.resignFirstResponder()
    }
    func presentPickerView() {
        if txtFieldDesignation.isFirstResponder == true {
            pickerViewOne.isHidden = true
            pickerView.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: 120)
            view.addSubview(pickerView)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.pickerView.frame.origin.y = 150
            
        }
    }
}


extension AuthenticationVC {
    func validateFirstName() {
        let isValid = !txtFieldFirstName.text!.isEmpty
        updateFieldValidity(isValid, for: viewName)
    }
    
    func validateLastName() {
        let isValid = !txtFieldLastName.text!.isEmpty
        updateFieldValidity(isValid, for: viewLastName)
    }
    
    //        func validatePhoneNumber() {
    //            let isValid = isValidPhoneNumber(txtFieldPhone.text)
    //            updateFieldValidity(isValid, for: txtFieldPhone)
    //        }
    
    func validateEmail() {
        let isValid = isValidEmail(txtFieldEmail.text)
        updateFieldValidity(isValid, for: viewEmail)
    }
    
    func validateDesignation() {
        let isValid = !txtFieldDesignation.text!.isEmpty
        
        updateFieldValidity(isValid, for: viewDesignation)
    }
    
    func validatePassword() {
        let isValid = isValidPassword(txtFieldPasssword.text)
        updateFieldValidity(isValid, for: viewSignupPassword)
    }
    
    func updateFieldValidity(_ isValid: Bool, for view: UIView) {
        view.layer.borderColor = isValid ? UIColor.textFiledViewLine.cgColor : UIColor.red.cgColor
        view.layer.borderWidth = 1.0
    }
    
    func isValidPhoneNumber(_ phoneNumber: String?) -> Bool {
        let phoneNumberRegex = #"^\d{10}$"#
        return NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex).evaluate(with: phoneNumber)
    }
    
    func isValidEmail(_ email: String?) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func isValidPassword(_ password: String?) -> Bool {
        return (password?.count ?? 0) >= 8
    }
    // Validation function for phone number
    func validatePhoneNumber() {
        // Your phone number validation logic using a regular expression
        let isValid = isValidPhoneNumber(txtFieldPhone.text)
        
        if isValid {
            // Check if the length exceeds a certain limit
            let maxPhoneNumberLength = 10
            if let phoneNumber = txtFieldPhone.text, phoneNumber.count > maxPhoneNumberLength {
                showAlert(message: "Phone number cannot be more than \(maxPhoneNumberLength) digits.")
                txtFieldPhone.text = String(phoneNumber.prefix(maxPhoneNumberLength))
                updateFieldValidity(isValid, for: txtFieldPhone)
            }
        } else {
            // Show an alert for invalid phone number
            // showAlert(message: "Invalid phone number.")
        }
    }
    
}
