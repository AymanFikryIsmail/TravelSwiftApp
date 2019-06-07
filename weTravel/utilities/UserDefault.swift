//
//  UserDefault.swift
//  weTravel
//
//  Created by Admin on 6/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation


class UserDefault {

    let mUserDefault = UserDefaults.standard
      static let FirstTime = "firstTime"
    
    func setWalkThroughVisibilty(check : Bool){
        mUserDefault.set(check, forKey: UserDefault.FirstTime)
        mUserDefault.synchronize()
    }
    
    func getWalkThroughVisibilty() -> Bool?{
        return mUserDefault.bool(forKey: UserDefault.FirstTime)
    }
    
    
    func setUserId(userId : Int){
        mUserDefault.set(userId, forKey: "userId")
        mUserDefault.synchronize()
    }
    
    func getUserID() -> Int?{
        return mUserDefault.integer(forKey: "userId")
    }
}
