//
//  ApiRequest.swift
//  WebService
//
//  Created by Muhammad Saqib Khan on 6/10/18.
//  Copyright © 2018 Muhammad Saqib Khan. All rights reserved.
//

import UIKit

class ApiRequest<Resource: ApiResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}



extension ApiRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.Model]? {
        return resource.makeModel(data: data)
    }
    
   // static func callGetMethod(url:NSString , completion:(_ responseData:AnyObject,_ errorMessage:NSError)->Void)

    func load(withCompletion completion: @escaping ([Resource.Model]?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}
