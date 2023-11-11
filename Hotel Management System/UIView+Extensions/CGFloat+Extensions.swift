//
//  CGFloat+Extensions.swift
//  Hotel Management System
//
//  Created by mayur bobade on 09/11/23.
//



import Foundation
import UIKit

extension CGFloat{
    var cleanValue: String{
        //return String(format: 1 == floor(self) ? "%.0f" : "%.2f", self)
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.0f", self)//
    }
  
    var dp: CGFloat {
        
        return (self / 375) * UIScreen.main.bounds.width
        
//        (self * UIScreen.main.bounds.width) / 375
    }
}


