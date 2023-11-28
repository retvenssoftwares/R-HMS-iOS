//
//  CreatePasswordVC.swift
//  Retvent
//
//  Created by mayur bobade on 02/11/23.
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
        hideKeyboardWhenTappedAround()
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
        if txtFieldCreatePAssword.text == "" && isValidPassword(password: txtFieldCreatePAssword.text!){
            let alert = UIAlertController(title: "", message: "Please enter password!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else  if txtFieldConformPassword.text == "" && isValidPassword(password: txtFieldConformPassword.text!){
            let alert = UIAlertController(title: "", message: "Please enter confirm password!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if txtFieldCreatePAssword.text != txtFieldConformPassword.text {
            let alert = UIAlertController(title: "", message: "Password and confirm password does not match!", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
