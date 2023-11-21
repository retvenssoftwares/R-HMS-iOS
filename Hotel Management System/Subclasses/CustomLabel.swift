//
//  CustomLabel.swift
//  Hotel Management System
//
//  Created by mayur bobade on 09/11/23.
//



import UIKit

class CustomLabel: UILabel {

    
    @IBInspectable
        public var fontscaling: Bool = false {
            didSet {
                if fontscaling {
                    self.font = UIFont(name: self.font.fontName, size: self.font.pointSize.dp )
                }
            }
        }
}


