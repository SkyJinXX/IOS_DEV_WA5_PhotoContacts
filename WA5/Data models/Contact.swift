//
//  Contact.swift

import Foundation
import UIKit

//MARK: struct to create a package to send to the Contact Detail Screen...
public struct Contact {
    var name:String?
    var image: UIImage?
    var email:String?
    var phoneType:String?
    var phoneNum:String?
    var address:String?
    var cityAndState:String?
    var zipCode:String?
    
    init(name: String? = nil, image: UIImage? = nil, email: String? = nil, phoneType: String? = nil, phoneNum: String? = nil, address: String? = nil, cityAndState: String? = nil, zipCode: String? = nil) {
        self.name = name
        self.image = image
        self.email = email
        self.phoneType = phoneType
        self.phoneNum = phoneNum
        self.address = address
        self.cityAndState = cityAndState
        self.zipCode = zipCode
    }
}

