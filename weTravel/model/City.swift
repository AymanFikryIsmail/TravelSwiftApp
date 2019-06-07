//
//  File.swift
//  weTravel
//
//  Created by Admin on 6/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation

import SwiftyJSON

class City{
    
    var city_id : Int
    
    var city_name : String
     var city_photo : String
    
    init(withJson data : JSON ) {
       self.city_id = data["city_id"].intValue
        self.city_name = data["city_name"].stringValue
        self.city_photo = data["city_photo"].stringValue
    }
}
