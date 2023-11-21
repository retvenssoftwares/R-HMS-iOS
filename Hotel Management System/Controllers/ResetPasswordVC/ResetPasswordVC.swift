//
//  ResetPasswordVC.swift
//  Retvent
//
//  Created by mayur bobade on 02/11/23.
//

import UIKit

class ResetPasswordVC: UIViewController {
    // MARK: - Outlet
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var btnResetPassword: UIButton!
    @IBOutlet weak var viewEmail: UIView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        btnResetPassword.layer.cornerRadius = 10
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEmail.layer.cornerRadius = 10
        hideKeyboardWhenTappedAround()
        let color = UIColor.init(named: "TextColor")
        txtFieldEmail.attributedPlaceholder = NSAttributedString(string: txtFieldEmail.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    

   
    // MARK: - Action

    @IBAction func resetPasswordBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EnterOTPVC") as! EnterOTPVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
