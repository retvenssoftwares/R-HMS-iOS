//
//  ApiData.swift
//  Hotel Management System
//
//  Created by mayur bobade on 13/11/23.
//

import Foundation

struct APIEndpoints {
    static let baseURL = ""

    struct Users {
        
//MARK: PostApi Method
        static let createUser = baseURL + "/createUser"
        static let getUser = baseURL + "/getUser"
        static let createProperty = baseURL + "/createProperty"
//MARK: Patch Api
        static let userEdit = baseURL + "/userEdit"
    }
}

struct ApiData {
    var userId:String =  "cVDoB8BP"
    var authToken:String = "b45c11b64f1436811d44ea6ac7a528e509c1fa45b56c80c881b999e9e8d30380ad2e01a17c5cd29b77adf4036111204cd4b1cadbf165da6415121345a0621a6d"
    enum CodingKeys: String, CodingKey {
            case userID, authToken
    }
}
