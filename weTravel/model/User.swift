//
//  User.swift
//  weTravel
//
//  Created by Admin on 6/7/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation
import SwiftyJSON
class User {
   
  
    var id : Int
    var name : String
     var password : String
     var email : String
     var user_phone : String
     var city : String
    
//    init(password : String , email : String) {
//        self.password = password
//        self.email = email
//    }
    init(id : Int , name : String , email : String , password : String , user_phone : String , city : String)  {
         self.id = id
          self.name = name
          self.password = password
        self.user_phone = user_phone
        self.email = email
          self.city = city
    }
    
    init(withJson data : JSON ) {
        self.id = data["id"].intValue
        self.name = data["name"].stringValue
        self.password = data["password"].stringValue
         self.email = data["email"].stringValue
         self.user_phone = data["user_phone"].stringValue
         self.city = data["city"].stringValue
        
    }
    
    
}
