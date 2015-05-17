//
//  ApiRequest.swift
//  WBMediaControllerApp
//
//  Created by YOKOTA, Kenji on 2015/02/28.
//  Copyright (c) 2015年 wb55. All rights reserved.
//

import Foundation

class ApiRequest {
    class func GET(apiName: String, params: Dictionary<String, String>, success: (JSON)->Void, failure: ()->Void) {
        var urlStr: String = apiUri(apiName) + createGetParamsString(params)
        
        let manager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        let serializer:AFJSONRequestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer = serializer
        manager.GET(urlStr, parameters: nil,
            success: {(operation: AFHTTPRequestOperation!, responsobject: AnyObject!) in
                self.requestSuccess(operation, responsobject: responsobject, successCallback: success, failureCallback: failure)
            },
            failure: {(operation: AFHTTPRequestOperation!, error: NSError!) in
                self.requestFailure(operation, error: error, successCallback: success, failureCallback: failure)
            }
        )
    }

    class func POST(apiName: String, params: Dictionary<String, String>, success: (JSON)->Void, failure: ()->Void) {
        var urlStr: String = apiUri(apiName)
        
        let manager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        let serializer:AFJSONRequestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer = serializer
        manager.POST(urlStr, parameters: params,
            success: {(operation: AFHTTPRequestOperation!, responsobject: AnyObject!) in
                self.requestSuccess(operation, responsobject: responsobject, successCallback: success, failureCallback: failure)
            },
            failure: {(operation: AFHTTPRequestOperation!, error: NSError!) in
                self.requestFailure(operation, error: error, successCallback: success, failureCallback: failure)
            }
        )
    }

    class func requestSuccess(operation: AFHTTPRequestOperation!, responsobject: AnyObject!, successCallback: (JSON)->Void, failureCallback: ()->Void) {
        let json = JSON(responsobject)
        if(json["status"].int == 1) {
            successCallback(json["result"])
        } else {
            UIAlertView(title: "", message: json["error"].string, delegate: nil, cancelButtonTitle: "OK").show()
            failureCallback()
        }
    }
    
    class func requestFailure(operation: AFHTTPRequestOperation!, error: NSError!, successCallback: (JSON)->Void, failureCallback: ()->Void) {
        if(operation == nil || operation.response == nil) {
            UIAlertView(title: "request error", message: "check network or seerver", delegate: nil, cancelButtonTitle: "OK").show()
            failureCallback()
            return
        }
        let code = operation.response.statusCode
        if code == 400 {
            UIAlertView(title: "", message: "400", delegate: nil, cancelButtonTitle: "OK").show()
        }
        if code == 403 {
            UIAlertView(title: "", message: "403", delegate: nil, cancelButtonTitle: "OK").show()
        }
        if code == 404 {
            UIAlertView(title: "", message: "404", delegate: nil, cancelButtonTitle: "OK").show()
        }
        if code == 500 {
            UIAlertView(title: "", message: "500", delegate: nil, cancelButtonTitle: "OK").show()
        }
        failureCallback()
    }

    class func apiUri(apiName: String) -> String {
        return String(format: "http://192.168.50.16/api/%@", apiName)
    }
    
    class func createGetParamsString(params: Dictionary<String, String>) -> String {
        var getQueries: NSMutableArray = []
        for (key:String, value:String) in params {
            getQueries.addObject(NSString(format: "%@=%@", key, value))
        }
        return "?" + getQueries.componentsJoinedByString("&")
    }
    
}
