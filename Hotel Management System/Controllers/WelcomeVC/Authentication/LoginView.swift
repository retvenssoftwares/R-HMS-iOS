//
//  LoginView.swift
//  Hotel Management System
//
//  Created by mayur bobade on 19/11/23.
//

import UIKit

class LoginView: UIView {
    
    
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var rcodeView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var hotelRcodeTxtField: UITextField!
    @IBOutlet weak var usernameTxtField: UITextField!
    // MARK: - Initialization
    
    @IBOutlet weak var loginBtn: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    private func commonInit() {
        print("commonInit called")
        if let nib = Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)?.first as? UIView {
            addSubview(nib)
            nib.frame = bounds
            nib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }

    
    @IBAction func eyeBtn(_ sender: Any) {
    }
    @IBAction func forgetBtn(_ sender: Any) {
    }
    @IBAction func signStackBtn(_ sender: Any) {
    }
    @IBAction func loginStackBtn(_ sender: Any) {
    }
    @IBAction func loginBtn(_ sender: Any) {
    }
    
    func configureView(usernameTxtfield: String, hotelRcodePasswl: String, password: String) {
        
    }
    
}
