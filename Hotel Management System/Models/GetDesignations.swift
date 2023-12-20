//
//  GetDesignations.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 24/11/23.
//

import Foundation


//struct GetDesignations:Codable{
//    var userData:[data]?
//}
//
//struct allData:Codable{
//    var id,designationId,designation:String
//}



//struct GetDesignations:Codable{
//   var userData:[data]?
//    
//}
struct Employee: Codable {
    let data: [EmployeeData]
    let statusCode: Int
}

struct EmployeeData: Codable {
    let id: String
    let designationId: String
    let designation: String

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case designationId
        case designation
    }
}
