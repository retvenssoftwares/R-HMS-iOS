//
//  AuthenticationVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 21/11/23.
//

import UIKit
import FloatingPanel

import iOSDropDown

class AuthenticationVC: UIViewController, FloatingPanelControllerDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var designationTableView: UITableView!
    @IBOutlet weak var viewPhone: UIView!
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
    let userDefaults = UserDefaults.standard
    var isLoginViewVisible = false
    var iconClick = true
    var employeeData: [EmployeeData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getDesignationApiCalling()
        txtFieldPhone.delegate = self
        designationTableView.isHidden = true
        designationTableView.register(UINib(nibName: "DesignationTableCell", bundle: nil), forCellReuseIdentifier: "DesignationTableCell")
    }
    
    
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
    
    func changeTextFieldPlaceholderTextColor(){
        let color = UIColor.init(named: "TextColor")
        txtFieldFirstName.attributedPlaceholder = NSAttributedString(string: txtFieldFirstName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldLastName.attributedPlaceholder = NSAttributedString(string: txtFieldLastName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldDesignation.attributedPlaceholder = NSAttributedString(string: txtFieldDesignation.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        // txtFieldPhone.attributedPlaceholder = NSAttributedString(string: txtFieldPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
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
    
    
    
    
   
 
    @IBAction func signUpBtnPRessed(_ sender: UIButton) {
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
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        if !isLoginViewVisible {
            // Slide in the login view from the right
            UIView.animate(withDuration: 0.5, animations: {
                self.viewLogin.frame.origin.x = 0
                self.viewSignUp.frame.origin.x = -self.containerView.frame.width
            }) { _ in
                // Update visibility and button states after the animation
                self.viewLogin.isHidden = false
                self.viewSignUp.isHidden = true
                self.isLoginViewVisible = true
            }
        }
        
        
    }
    
    @IBAction func signUpBigBtnPressed(_ sender: UIButton) {
        if txtFieldPhone.text?.isEmpty == true && txtFieldPhone.text?.count == 10{
            viewPhone.borderColor = UIColor.red
            txtFieldPhone.attributedPlaceholder = NSAttributedString(
                string: "Phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            viewPhone.borderColor = UIColor.textFiledViewLine
        }
        LoadingOverlay.shared.showOverlay(view:nwindow.window!)
        APIManager.shared.postRequestSignUp(firstName: txtFieldFirstName.text ?? "", lastName: txtFieldLastName.text ?? "", designation: txtFieldDesignation.text ?? "", phoneNumber: txtFieldPhone.text ?? "", email: txtFieldEmail.text ?? "", password: txtFieldPasssword.text ?? "") { model, error in
            DispatchQueue.main.async {
                if model?.statuscode == 200 {
                    if let encoded = try? JSONEncoder().encode(model) {
                        self.userDefaults.set(encoded, forKey: "userData")
                        LoadingOverlay.shared.hideOverlayView()
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PropertySelectionVC") as! PropertySelectionVC
                        self.navigationController?.pushViewController(vc, animated: true)
                        self.userDefaults.set(encoded, forKey: "userData")
                        let alert = UIAlertController(title: "", message: model?.message, preferredStyle: .alert)
                        let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                            print("Close")
                        })
                        alert.addAction(closeAction)
                        self.present(alert, animated: true, completion: nil)
                        
                        
                    }
                }else {
                    let alert = UIAlertController(title: "", message: model?.message, preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                        print("Close")
                    })
                    alert.addAction(closeAction)
                    self.present(alert, animated: true, completion: nil)
                    LoadingOverlay.shared.hideOverlayView()
                }
            }
            print(model)
            print(error)
        }
        
    }
    @IBAction func forgotBtnPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func loginBigBtnPressed(_ sender: UIButton) {
        LoadingOverlay.shared.showOverlay(view:nwindow.window!)
        APIManager.shared.postRequestLogin(username: txtFIeldUserName.text ?? "", hotelCode: txtFieldHotelRCOde.text ?? "", password: txtFieldLoginPassword.text ?? "") { data, error in
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
                if let error = error{
                    let alert = UIAlertController(title: "", message: error.localizedDescription, preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                        print("Close")
                    })
                    alert.addAction(closeAction)
                    self.present(alert, animated: true, completion: nil)
                }
                if let cheak = data{
                    if cheak.statuscode == 200 {
                        if let encoded = try? JSONEncoder().encode(cheak.data) {
                            self.userDefaults.set(encoded, forKey: "userData")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewPropertyProfileVC")as! NewPropertyProfileVC
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        print("sucesss")
                    } else{
                        let alert = UIAlertController(title: "", message: cheak.message, preferredStyle: .alert)
                        let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                            print("Close")
                        })
                        alert.addAction(closeAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Check if the new length will exceed the limit (10 digits)
           let currentText = txtFieldPhone.text ?? ""
           guard let stringRange = Range(range, in: currentText) else { return false }
           let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

           return updatedText.count <= 11
       }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
          designationTableView.isHidden = false
      }
    @IBAction func loginPasswordShowBtnPressed(_ sender: UIButton) {
        if iconClick {
            txtFieldLoginPassword.isSecureTextEntry = false
        } else {
            txtFieldLoginPassword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    @IBAction func signUpPasswordShowBtnPressed(_ sender: UIButton) {
        if iconClick {
            txtFieldPasssword.isSecureTextEntry = false
        } else {
            txtFieldPasssword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    @IBAction func continueWithROwner(_ sender: UIButton) {
        
        
        
        
    }
}


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
        designation.capitalized
        designationTableView.isHidden = true
    }
}


