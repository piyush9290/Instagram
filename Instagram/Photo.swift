//
//  Photo.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-06-10.
//  Copyright © 2017 Piyush. All rights reserved.
//

import Foundation

class Photo {
    let title: String
    let remoteURL: URL
    let photoId: String
    let dateTaken: Date
    
    init(title: String, photoId: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoId = photoId
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
}
