//
//  AddPropertyVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 03/11/23.
//

import UIKit

class AddPropertyVC: UIViewController {

    
    // MARK: - Outlet
    @IBOutlet weak var viewUnderAddressAndCOntact: UIView!
    @IBOutlet weak var viewUnderPropertyProfile: UIView!
    @IBOutlet weak var btnAddressAndContacts: UIButton!
    @IBOutlet weak var btnPropertyProfile: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubView(storyBoard: "Main", controllerName: "PropertProfileVC")
        viewUnderPropertyProfile.isHidden = false
        viewUnderAddressAndCOntact.isHidden = true
    }
    
    // MARK: - Action
    @IBAction func propertyProfileBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "PropertProfileVC")
        viewUnderPropertyProfile.isHidden = false
        viewUnderAddressAndCOntact.isHidden = true
    }
    @IBAction func btnAdreessAndContact(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "AddressAndContactVC")
        viewUnderPropertyProfile.isHidden = true
        viewUnderAddressAndCOntact.isHidden = false
    }


}
// MARK: - Extension Segment Control

extension AddPropertyVC{
    func addSubView(storyBoard:String,controllerName:String){
        containerView.subviews.forEach({ $0.removeFromSuperview() })
        let storyBoard = UIStoryboard(name: storyBoard, bundle: nil)
        let showVC = storyBoard.instantiateViewController(withIdentifier: "\(controllerName)")
        showVC.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        containerView.addSubview(showVC.view)
        
        self.addChild(showVC)
    }
}
