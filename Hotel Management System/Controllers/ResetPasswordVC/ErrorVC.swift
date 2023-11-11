//
//  ErrorVC.swift
//  Retvent
//
//  Created by mayur bobade on 02/11/23.
//

import UIKit

class ErrorVC: UIViewController {
    
    // MARK: - Oulet
    
    
    @IBOutlet weak var btnResetPAssword: UIButton!
    @IBOutlet weak var txtFieldConformPAssword: UITextField!
    @IBOutlet weak var txtFieldCreatePAssword: UITextField!
    @IBOutlet weak var viewConformPassword: UIView!
    @IBOutlet weak var viewCreatePassword: UIView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        btnResetPAssword.layer.cornerRadius = 10
        viewCreatePassword.layer.borderWidth = 1
        viewCreatePassword.layer.borderColor = UIColor.red.cgColor
        viewCreatePassword.layer.cornerRadius = 10
        
        viewConformPassword.layer.borderWidth = 1
        viewConformPassword.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewConformPassword.layer.cornerRadius = 10
        
      
        
    }
    

    // MARK: - Action
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
