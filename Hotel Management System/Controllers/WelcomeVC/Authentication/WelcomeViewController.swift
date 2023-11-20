//
//  WelcomeViewController.swift
//  Retvent
//
//  Created by Smart Kamina on 01/11/23.
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
    
        
    }
    

  
    // MARK: - Action

    @IBAction func nextBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUPVC") as! SignUPVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

