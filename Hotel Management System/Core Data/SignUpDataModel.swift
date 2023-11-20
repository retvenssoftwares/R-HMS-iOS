//
//  SignUpCoreData.swift
//  Hotel Management System
//
//  Created by mayur bobade on 15/11/23.
//

import Foundation
import UIKit
import CoreData

struct SignUpCoreData {
    var firstName: String
    var lastName: String
    var designation: String
    var phoneNumber: String
    var password: String
    var email: String
    
    enum SignupKey: String, CodingKey {
        case firstName, lastName, designation, phoneNumber, password, email
    }
    
}
