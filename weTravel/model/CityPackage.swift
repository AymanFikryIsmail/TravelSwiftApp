//
//  CityPackage.swift
//  weTravel
//
//  Created by Admin on 6/8/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation

import SwiftyJSON

class CityPackage{
    
    var pid : Int
    var p_name : String
    var travel_from : String
    var travel_to : String
    var price : Int
    var rate : Float
//    var discounted_price : Float
    var avail_tickets : Int
     var duration : Int
     var date : String
     var description : String
    // var addingDate : String

    var paths : [String]

    init(withJson data : JSON ) {
        self.pid = data["city_id"].intValue
        self.p_name = data["p_name"].stringValue
        self.travel_from = data["travel_from"].stringValue
           self.travel_to = data["travel_to"].stringValue
           self.price = data["price"].intValue
           self.rate = data["rate"].floatValue
        
           self.avail_tickets = data["avail_tickets"].intValue
           self.date = data["date"].stringValue
         self.duration = data["duration"].intValue
           self.description = data["description"].stringValue
        self.paths = data["paths"].arrayObject as! [String]
    }
}
