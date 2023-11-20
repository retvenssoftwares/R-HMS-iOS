//
//  CustomTextField.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 09/11/23.
//



import Foundation
import UIKit
class CustomTextField: UITextField {
    
    @IBInspectable
        public var fontscaling: Bool = false {
            didSet {
                if fontscaling {
                    guard let font  = self.font else {return}
                    self.font = UIFont(name: font.fontName, size: font.pointSize.dp )
                }
            }
        }
}
