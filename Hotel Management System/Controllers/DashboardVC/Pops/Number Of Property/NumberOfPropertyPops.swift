//
//  NumberOfPropertyPops.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 22/11/23.
//

import Foundation
import UIKit


class NumberOfPropertyPops: UIView{
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblHowManyProperty: UILabel!
    @IBOutlet weak var lblNumberOfProperty: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnMinuesTen: UIButton!
    @IBOutlet weak var btnMinuesOne: UIButton!
    @IBOutlet weak var btnPlusTen: UIButton!
    @IBOutlet weak var btnPlusOne: UIButton!
    @IBOutlet weak var txtFieldNumberOfProperty: UITextField!
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
         commonInit()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
      
    }

    
    private func commonInit() {
        Bundle.main.loadNibNamed("NumberOfPropertyPops", owner: self, options: nil)
       
    }
    @IBAction func minuesTenBtnPressed(_ sender: UIButton) {
    }
    @IBAction func minuesOneBtnPressed(_ sender: UIButton) {
    }
    @IBAction func plusTenBtnPressed(_ sender: UIButton) {
    }
    @IBAction func PlusOneBtnPressed(_ sender: UIButton) {
    }
    @IBAction func btnSavePressed(_ sender: UIButton) {
    }
    @IBAction func btnCancelPressed(_ sender: UIButton) {
    }
}
