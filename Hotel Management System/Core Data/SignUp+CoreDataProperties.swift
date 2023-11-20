//
//  SignUp+CoreDataProperties.swift
//  
//
//  Created by mayur bobade on 16/11/23.
//
//

import Foundation
import CoreData


extension SignUp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SignUp> {
        return NSFetchRequest<SignUp>(entityName: "SignUp")
    }

    @NSManaged public var designation: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: String?

}
