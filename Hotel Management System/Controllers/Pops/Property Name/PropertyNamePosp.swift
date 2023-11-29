//
//  PropertyNamePosp.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 22/11/23.
//

import UIKit

class PropertyNamePosp: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var lblPropertyName: UILabel!
    @IBOutlet weak var lblpropertyDescription: UILabel!
    @IBOutlet weak var viewPropertyName: UIView!
    @IBOutlet weak var txtFieldPropertyName: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Outlet
    @IBAction func btnCancelPressed(_ sender: UIButton) {
    }
    @IBAction func saveBtnPressed(_ sender: UIButton) {
    }
}
