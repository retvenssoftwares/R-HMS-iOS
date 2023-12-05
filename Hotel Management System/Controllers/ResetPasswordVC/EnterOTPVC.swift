//
//  EnterOTPVC.swift
//  Retvent
//
//  Created by Mayur Bobade on 02/11/23.
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
    
    func apiCalling(){
        LoadingOverlay.shared.showOverlay(view:nwindow.window!)
        let enetrOtp = pinView.getPin()
        APIManager.shared.postRequestVerifyOTP(Otp: enetrOtp) { otpModel, error in
            if let model = otpModel{
                DispatchQueue.main.async {
                    if model.statusCode == 200{
                    LoadingOverlay.shared.hideOverlayView()
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreatePasswordVC") as! CreatePasswordVC
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

    @IBAction func submitBtnPressed(_ sender: UIButton) {
        apiCalling()
    }
}
