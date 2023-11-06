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
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

       
        pinView.secureCharacter = "\u{25CF}"
      
        pinView.textColor = UIColor.black
        
        pinView.style = .box
        let color = UIColor.init(named: "PinBorderColor")
        pinView.borderLineColor = color!
        pinView.activeBorderLineColor = UIColor.lightGray


    }
    

    // MARK: - Action

    @IBAction func submitBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreatePasswordVC") as! CreatePasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
