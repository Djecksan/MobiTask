//
//  APIClient.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 01.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//



import UIKit
import Alamofire
import ObjectMapper

private let BASE_URL = "http://api.fixer.io"

typealias APIClientSuccess = (AnyObject?) -> Void
typealias APIClientFailure = (NSError?, NSHTTPURLResponse?) -> Void

class APIClient {
    
    private static func request(request:Request, success:APIClientSuccess, fail:APIClientFailure) {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        request.responseJSON { request, response, JSON, error in
            
            if response?.statusCode == 200 || response?.statusCode == 204{
                success(JSON)
            } else {
                fail(error, response)
            }
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        
    }
    
}


extension APIClient {
    static func rates(parmeters:String, success: APIClientSuccess, fail: APIClientFailure) {
        var request = Alamofire.request(.GET, "\(BASE_URL)/\(parmeters)", parameters: nil)
        APIClient.request(request, success: { (result) -> Void in
            let fixer = Mapper<Fixer>().map(result)
            success(fixer)
        }, fail: fail)
    }
}
