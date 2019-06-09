//
//  File.swift
//  weTravel
//
//  Created by Admin on 6/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let API_BASE_URL = "http://172.16.5.220:3000"

class APICallManager{
    
    static let instance = APICallManager()
    
    enum RequestMethod {
        case get
        case post
    }
    
   
    enum Endpoint: String {
        case city = "/packages/city"
    }
    
    
    func login(user  : User , completion: @escaping (_ result: RequestResult<User>)-> Void){
        UserService.instance.login(year: "a", completion: completion)
    }
    
    func getCityPackages(city  : String , completion: @escaping (_ result: RequestResult<[CityPackage]>)-> Void){
        PackageService.instance.getCityPackages(city: city, completion: completion)
    }
    func callAPIGetCity(onSuccess successCallback: ((_ city: [City]) -> Void)?,
                          onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        let url = API_BASE_URL + Endpoint.city.rawValue
        self.getCities(url, onSuccess: {(responseObject: JSON) -> Void in
            if let responseDict = responseObject["data"].arrayObject{
                print("jsonnya:\(responseObject)")
                var listCity = [City]()
                let cities = responseObject["data"].arrayValue
                for city in cities{
                    let data = City(withJson: city)
                    listCity.append(data)
                }
                
                
                successCallback?(listCity)
            } else {
                failureCallback?("An error has occured.")
            }
            }
            
        
            , onFailure: {(errorMessage: String) -> Void in
            failureCallback?(errorMessage)
            })
        
    }
    
    
    
    
    
    
    func getCities( _ url: String,
                    onSuccess successCallback: ((JSON) -> Void)?,
                   onFailure failureCallback: ((String) -> Void)?){
        Alamofire.request("\(url)",method: .get).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    // Return
                    callback(error.localizedDescription)
                }
            }

        }
    }
}
