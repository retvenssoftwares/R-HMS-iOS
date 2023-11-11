//
//  PropertySelectionVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 05/11/23.
//

import UIKit

class PropertySelectionVC: UIViewController {
    
    // MARK: - Outlet
    var selectedOption: Selection?
    @IBOutlet weak var viewPropertyChain: UIView!
    @IBOutlet weak var viewSingleProperty: UIView!
    @IBOutlet weak var singlePropertyBtn: UIButton!
    @IBOutlet weak var propertyChainBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.propertyAttribute()
    }
    
    func propertyAttribute() {
        viewPropertyChain.layer.cornerRadius = 10
        viewPropertyChain.layer.borderWidth = 1
        viewPropertyChain.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewSingleProperty.layer.cornerRadius = 10
        viewSingleProperty.layer.borderWidth = 1
        viewSingleProperty.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
    }
    
    // MARK: - Action
    @IBAction func propertyChainBtnPressed(_ sender: UIButton) {
        selectedOption = .second
        if (sender.tag == 0) {
            viewPropertyChain.borderColor = UIColor.green
            viewSingleProperty.borderColor = UIColor.clear
        } else {
            viewPropertyChain.borderColor = UIColor.clear
        }
    }
    
    @IBAction func singlePropertyBtnPressed(_ sender: UIButton) {
        selectedOption = .first
        if singlePropertyBtn.isEnabled == true {
            viewSingleProperty.borderColor = UIColor.green
            viewPropertyChain.borderColor = UIColor.clear
        } else {
            viewSingleProperty.borderColor = UIColor.clear
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        guard let selectedOption = selectedOption else {
            return
        }
        switch selectedOption {
        case .first:
            let firstViewController = storyboard?.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
            navigationController?.pushViewController(firstViewController, animated: true)
            
        case .second:
            let secondViewController = storyboard?.instantiateViewController(withIdentifier: "AddPropertyVC") as! AddPropertyVC
            navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
}
