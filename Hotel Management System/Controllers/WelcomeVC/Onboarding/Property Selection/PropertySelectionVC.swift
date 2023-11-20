//
//  PropertySelectionVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 05/11/23.
//

import UIKit

class PropertySelectionVC: UIViewController {

    // MARK: - Outlet
   
   
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        navigationController?.navigationBar.isHidden = false
       
        
        
       
    }
    

    // MARK: - Action
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

   
    @IBAction func propertyChainBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func singlePropertyBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as! TabbarController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
   
}



