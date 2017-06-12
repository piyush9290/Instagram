//
//  PhotoStore.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-06-08.
//  Copyright © 2017 Piyush. All rights reserved.
//

import Foundation

enum PhotoResult {
    case success([Photo])
    case failure(Error)
}

enum FlickrError: Error {
    case invalidJSONData
}

class PhotoStore {
    
    //Date formatter
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    //Rest API 
    func fetchRecentPhotos(withURL urlStr: URL, success: @escaping (PhotoResult) -> (), failue: @escaping (String) -> ()) {
        let request = URLRequest(url: urlStr)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if let jsonData = data {
                DispatchQueue.main.async {
                    success(self.parseData(fromData: jsonData))
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
    
    //Data parsing
    
    private func parseData(fromData data: Data) -> PhotoResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let photos = jsonDictionary["photos"] as? [String:Any],
                let photosArray = photos["photo"] as? [[String:Any]] else {
                    return .failure(FlickrError.invalidJSONData)
            }
            var finalPhotos = [Photo]()
            for photoJSON in photosArray {
                if let photo = photo(fromJSON: photoJSON) {
                    finalPhotos.append(photo)
                }
            }
            if finalPhotos.isEmpty && !photosArray.isEmpty {
                return .failure(FlickrError.invalidJSONData)
            }
            return .success(finalPhotos)
            
        } catch let error {
            return .failure(error)
        }
    }
    
    private func photo(fromJSON json: [String:Any]) -> Photo? {
        guard
            let photoID = json["id"] as? String,
            let title = json["title"] as? String,
            let dateString = json["datetaken"] as? String,
            let photoURLString = json["url_h"] as? String,
            let url = URL(string: photoURLString),
            let dateTaken = dateFormatter.date(from: dateString) else {
                return nil
        }
        return Photo(title: title, photoId: photoID, remoteURL: url, dateTaken: dateTaken)
    }
    
}
