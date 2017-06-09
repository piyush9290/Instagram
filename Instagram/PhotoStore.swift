//
//  PhotoStore.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-06-08.
//  Copyright © 2017 Piyush. All rights reserved.
//

import Foundation

class PhotoStore {
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchRecentPhotos(withURL urlStr: URL, success: @escaping (String) -> (), failue: @escaping (String) -> ()) {
        let request = URLRequest(url: urlStr)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    DispatchQueue.main.async {
                        success(jsonString)
                    }
                }
                
            } else if let requestError = error {
                DispatchQueue.main.async {
                    failue(requestError.localizedDescription)
                }
            } else {
                DispatchQueue.main.async {
                    failue("Unexpected error")
                }
            }
        }
        task.resume()
    }
}
