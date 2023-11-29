//
//  WelcomeViewController.swift
//  Retvent
//
//  Created by mayur bobade on 01/11/23.
//

import UIKit
import PhotosUI

class WelcomeViewController: UIViewController {
    
    // MARK: - Oulet
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var btnNext: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.layer.cornerRadius = 10
        hideKeyboardWhenTappedAround()
    }
    
    
    
    
    
    // MARK: - Action
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
}
