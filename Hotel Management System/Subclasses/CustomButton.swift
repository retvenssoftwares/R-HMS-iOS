//
//  CustomButton.swift
//  Hotel Management System
//
//  Created by mayur bobade on 09/11/23.
//


import UIKit

class CustomButton: UIButton {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
 
    @IBInspectable var fontscaling: Bool =  false {
        didSet{
            if fontscaling {
                guard let font  = self.titleLabel?.font else {return}
                self.titleLabel?.font = UIFont(name: font.fontName, size: font.pointSize.dp )
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
       
        self.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.clipsToBounds = true
    }
}

