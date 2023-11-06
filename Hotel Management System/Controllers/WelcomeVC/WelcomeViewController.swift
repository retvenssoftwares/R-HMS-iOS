//
//  WelcomeViewController.swift
//  Retvent
//
//  Created by mayur bobade on 01/11/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Oulet
    @IBOutlet weak var btnNext: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.layer.cornerRadius = 10
        
    }
    

  
    // MARK: - Action

    @IBAction func nextBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUPVC") as! SignUPVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
