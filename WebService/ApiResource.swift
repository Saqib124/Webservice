//
//  ApiResource.swift
//  WebService
//
//  Created by Muhammad Saqib Khan on 6/10/18.
//  Copyright © 2018 Muhammad Saqib Khan. All rights reserved.
//

import UIKit

protocol ApiResource {
    //This type is a generic expressed by the associatedtype.
    associatedtype Model
    
    //it the path of the resource in the URL, for example, /questions.
    var methodPath: String { get }
    
    //method takes a JSON serialization and converts it into the appropriate model value
    func makeModel(serialization: Serialization) -> Model
}


/*
Here, I hardcoded all the parameters for the URL query, like the iOS tag, the sorting, etc. for the simplicity of the example.
In a real app, these would likely need to change according to the resource we want to access. So they would have to be requirements in the protocol like the methodPath property, instead of constants.
 */
extension ApiResource {
    var url: URL {
        let baseUrl = "https://api.stackexchange.com/2.2"
        let site = "site=stackoverflow"
        let order = "order=desc"
        let sorting = "sort=votes"
        let tags = "tagged=ios"
        let url = baseUrl + methodPath + "?" + order + "&" + sorting + "&" + tags + "&" + site
        return URL(string: url)!
    }
    
    func makeModel(data: Data) -> [Model]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            return nil
        }
        guard let jsonSerialization = json as? Serialization else {
            return nil
        }
        let wrapper = ApiWrapper(serialization: jsonSerialization)
        return wrapper.items.map(makeModel(serialization:))
    }
}



struct QuestionsResource: ApiResource {
    let methodPath = "/questions"
    
    func makeModel(serialization: Serialization) -> Question {
        return Question(serialization: serialization)
    }
}
