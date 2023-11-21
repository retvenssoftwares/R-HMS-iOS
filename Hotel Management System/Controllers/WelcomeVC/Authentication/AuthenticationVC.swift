//
//  AuthenticationVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 21/11/23.
//

import UIKit

class AuthenticationVC: UIViewController {

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
    
    var isLoginViewVisible = false
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSignUp.isHidden = false
        signUpAnimation()
          
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
    
    @IBAction func signUpBtnPRessed(_ sender: UIButton) {
        if isLoginViewVisible {
            // Slide in the signup view from the right
            UIView.animate(withDuration: 0.5, animations: {
                self.viewLogin.frame.origin.x = self.containerView.frame.width
                self.viewSignUp.frame.origin.x = 0
            }) { _ in
                // Update visibility and button states after the animation
               
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
    }
    @IBAction func forgotBtnPressed(_ sender: UIButton) {
    }
    @IBAction func loginBigBtnPressed(_ sender: UIButton) {
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
