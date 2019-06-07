//
//  UserService.swift
//  weTravel
//
//  Created by Admin on 6/7/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService{
    
    static let instance = UserService()



    func login(year : String  ,completion: @escaping (_ result: RequestResult<User>)-> Void){
        let param = [
            "email": "ayman@gmail.com",
            "password" : "123456"
            
            ] as [String : Any]
        Alamofire.request("\(API_BASE_URL)/users/login", method: .post, parameters: param)
            .responseJSON { (response) in
                if let result = response.result.value{
                    let json = JSON(result)
                    let status = json["status"].stringValue
                    if status == "true"{
                        let user  = User(withJson: json["data"])
                        completion(RequestResult.done(user))
                    }else{
                        completion(RequestResult.failed(message: status))
                    }
                }
        }
        
    }
}
