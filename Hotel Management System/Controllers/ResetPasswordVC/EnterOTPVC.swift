//
//  EnterOTPVC.swift
//  Retvent
//
//  Created by mayur bobade on 02/11/23.
//

import UIKit
import SVPinView


class EnterOTPVC: UIViewController {
    
    
    // MARK: - Oulet
    @IBOutlet weak var pinView: SVPinView!
    var isValid: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        pinView.secureCharacter = "\u{25CF}"
        pinView.textColor = UIColor.black
        pinView.backgroundColor = .clear
        pinView.style = .box
        pinView.pinLength = 6
        pinView.secureCharacter = "\u{25CF}"
        pinView.textColor = UIColor.black
        pinView.style = .box
        let color = UIColor.init(named: "PinBorderColor")
        pinView.borderLineColor = color!
        pinView.activeBorderLineColor = UIColor.lightGray
        
    }
    // MARK: - Action
    
    func pinViewText() {
        
    }
    
    func showIncorrectOTPAlert() {
        let alertController = UIAlertController(title: "Incorrect OTP", message: "Please enter a valid OTP.", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        
        present(alertController, animated: true, completion: nil)
    }
    func isValidOTP(_ otp: String) -> Bool {
        return true
    }
    
    func pinView(_ pinView: SVPinView, didEnterPin pinValue: String) {
        
    }
    
    func pinView(_ pinView: SVPinView, didSubmitPin pinValue: String) {
        
    }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        let enteredOTP = pinView.getPin()
        let correctPIN = "123456"
        
        if enteredOTP == correctPIN && enteredOTP.count == 6 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreatePasswordVC") as! CreatePasswordVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            showIncorrectOTPAlert()
        }
        
        
        
    }
}
