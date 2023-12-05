//
//  ResetPasswordVC.swift
//  Retvent
//
//  Created by Mayur Bobade on 02/11/23.
//

import UIKit

class ResetPasswordVC: UIViewController {
    // MARK: - Outlet
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var btnResetPassword: UIButton!
    @IBOutlet weak var viewEmail: UIView!
    
    
    let userDefaults = UserDefaults.standard
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        btnResetPassword.layer.cornerRadius = 10
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEmail.layer.cornerRadius = 10
        
        let color = UIColor.init(named: "TextColor")
        txtFieldEmail.attributedPlaceholder = NSAttributedString(string: txtFieldEmail.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    func apiCalling(){
        LoadingOverlay.shared.showOverlay(view:nwindow.window!)
        let saveEmail = userDefaults.set(txtFieldEmail.text, forKey: "email")
        APIManager.shared.postRequestSendOTP(email: txtFieldEmail.text ?? "") { otpModel, error in
            if let model = otpModel{
                DispatchQueue.main.async {
                    if model.statusCode == 200{
                    LoadingOverlay.shared.hideOverlayView()
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EnterOTPVC") as! EnterOTPVC
                        self.navigationController?.pushViewController(vc, animated: true)
                        self.showAlert(message: model.message)
                    }else{
                        self.showAlert(message: model.message)
                    }
                }
            
            }
        }
    }
   
    // MARK: - Action

    @IBAction func resetPasswordBtnPressed(_ sender: UIButton) {
        apiCalling()
    }
}
