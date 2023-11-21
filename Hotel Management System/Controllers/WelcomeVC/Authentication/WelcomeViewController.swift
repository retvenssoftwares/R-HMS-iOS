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
    var gaugeView: AnimatedGaugeView!
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var btnNext: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.layer.cornerRadius = 10
        hideKeyboardWhenTappedAround()
        animatedView()
    }
    
    func animatedView() {
        
        gaugeView = AnimatedGaugeView(frame: CGRect(x: 50, y: 50, width: viewBg.frame.width, height: viewBg.frame.height))
                viewBg.addSubview(gaugeView)
                
                gaugeView.animateGauge(to: 0.75)
    }

  
    // MARK: - Action

    @IBAction func nextBtnPressed(_ sender: UIButton) {
       
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUPVC") as! SignUPVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
