//
//  BookPackage.swift
//  weTravel
//
//  Created by Admin on 6/16/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation


import SwiftyJSON

class BookPackage {

    var packageId : Int;
    var userName : String;

    var user : Int;
    
    var adults : Int ;
   
     var children : Int ;
    var  totalCost  : Double;


    init(withJson data : JSON ) {
        self.packageId = data["packageId"].intValue
        self.user = data["user"].intValue
         self.adults = data["adults"].intValue
         self.children = data["adults"].intValue
         self.userName = data["userName"].stringValue
         self.totalCost = data["totalCost"].doubleValue

    }
}
