//
//  ApiResponse.swift
//  weTravel
//
//  Created by Admin on 6/7/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation


public enum RequestResult<T>{
    case done(T)
    case failed(message: String)
}
