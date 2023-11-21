//
//  PropertyTypePops.swift
//  Hotel Management System
//
//  Created by mayur bobade on 18/11/23.
//

import Foundation
import UIKit


class PropertyTypePops:UIView{
    
    
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
//     addSubview(containerView)
//     containerView.frame = self.bounds
//     containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
 }

}
