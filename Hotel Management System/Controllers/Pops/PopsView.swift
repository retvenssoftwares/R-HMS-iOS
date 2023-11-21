//
//  PopsView.swift
//  Hotel Management System
//
//  Created by mayur bobade on 18/11/23.
//

import Foundation
import UIKit

class PopsView: UIView{
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var stackViewBtn: UIStackView!
    @IBOutlet weak var txtFieldEnterPropertyName: UITextField!
    @IBOutlet weak var viewEnterPropertyName: UIView!
    @IBOutlet weak var propertyDetaillbl: UILabel!
    @IBOutlet weak var propertyNamelbl: UILabel!
    
       override init(frame: CGRect) {
        super .init(frame: frame)
         commonInit()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
      
    }

    
    private func commonInit() {
        Bundle.main.loadNibNamed("PopsView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

