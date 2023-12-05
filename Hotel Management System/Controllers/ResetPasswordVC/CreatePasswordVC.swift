//
//  CreatePasswordVC.swift
//  Retvent
//
//  Created by Mayur Bobade on 02/11/23.
//

import UIKit

class CreatePasswordVC: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var txtFieldConformPassword: UITextField!
    @IBOutlet weak var txtFieldCreatePAssword: UITextField!
    @IBOutlet weak var btnResetPassword: UIButton!
    @IBOutlet weak var viewCreatePassword: UIView!
    @IBOutlet weak var viewConformPassword: UIView!
    
    
    
    var iconClick = true
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        btnResetPassword.layer.cornerRadius = 10
        viewCreatePassword.layer.borderWidth = 1
        viewCreatePassword.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewCreatePassword.layer.cornerRadius = 10
        
        viewConformPassword.layer.borderWidth = 1
        viewConformPassword.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewConformPassword.layer.cornerRadius = 10
        
        
        let color = UIColor.init(named: "TextColor")
        txtFieldCreatePAssword.attributedPlaceholder = NSAttributedString(string: txtFieldCreatePAssword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldConformPassword.attributedPlaceholder = NSAttributedString(string: txtFieldConformPassword.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    

    func apicalling(){
        if let email = UserDefaults.standard.string(forKey: "email") {
            print(email)
            APIManager.shared.postRequestResetPassword(email: email, password: txtFieldCreatePAssword.text ??  "", confirmPassword: txtFieldConformPassword.text ?? "") { sendOTP, error in
                if let model = sendOTP{
                    DispatchQueue.main.async {
                        if model.statusCode == 200{
                        LoadingOverlay.shared.hideOverlayView()
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
                            self.navigationController?.pushViewController(vc, animated: true)
                            self.showAlert(message: model.message)
                        }else{
                            self.showAlert(message: model.message)
                        }
                    }
                
                }
            }
        }
       
    }
    
 
    // MARK: - Action


    @IBAction func showPassword(_ sender: Any) {
        
        if iconClick {
            txtFieldCreatePAssword.isSecureTextEntry = false
            } else {
                txtFieldCreatePAssword.isSecureTextEntry = true
            }
            iconClick = !iconClick
    }
    @IBAction func showConformPasswordText(_ sender: Any) {
        if iconClick {
            txtFieldConformPassword.isSecureTextEntry = false
            } else {
                txtFieldConformPassword.isSecureTextEntry = true
            }
            iconClick = !iconClick
    }
    @IBAction func resetPasswordBtnPressed(_ sender: UIButton) {
    apicalling()
    }
}
