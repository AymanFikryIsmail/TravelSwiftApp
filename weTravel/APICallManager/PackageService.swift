//
//  PackageService.swift
//  weTravel
//
//  Created by Admin on 6/8/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PackageService{
    
    static let instance = PackageService()
    
    
    
    func getCityPackages(city : String  ,completion: @escaping (_ result: RequestResult<[CityPackage]>)-> Void){
//localhost:3000/packages/city/packages?city=luxor
        Alamofire.request("\(API_BASE_URL)/packages/city/packages?city=\(city)", method: .get)
            .responseJSON { (response) in
                if let result = response.result.value{
                    let json = JSON(result)
                      var listpackage = [CityPackage]()
                    let status = json["status"].stringValue
                    if status == "true"{
                        let packages = json["data"].arrayValue
                        for pkg in packages{
                            let data = CityPackage(withJson: pkg)
                            listpackage.append(data)
                        }
                        
                        completion(RequestResult.done(listpackage))
                    }else{
                        completion(RequestResult.failed(message: status))
                    }
                }
        }
        
    }
}
