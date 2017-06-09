//
//  InstaAPI.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-06-08.
//  Copyright © 2017 Piyush. All rights reserved.
//

import Foundation

enum Method: String {
    case InterestingPhotos = "flickr.interestingness.getList"
}

struct InstaAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let APIKey = "a6d819499131071f158fd740860a5a88"
    
    private static func instaURL(method: Method, parameters: [String: String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": APIKey
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
    
    static var interestingPhotosURL: URL {
        return instaURL(method: .InterestingPhotos, parameters: ["extras": "url_h,date_taken"])
    }
    
}
