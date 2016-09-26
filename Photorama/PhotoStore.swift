//
//  PhotoStore.swift
//  Photorama
//
//  Created by Rehan Sajid on 26/09/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import Foundation

class PhotoStore {
        let session: URLSession = {
                let config = URLSessionConfiguration.default
                return URLSession(configuration: config)
     
        }()
        
        func fetchRecentPhotos() {
                let url = FlickrAPI.recentPhotosURL()
                let request = URLRequest(url: url )
                
                let task = URLSession.shared.dataTask(with: request, completionHandler: {
                        (data,response,error) -> Void in
                        if let jsonData = data {
                                if let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
                                        print(jsonString)
                                        
                                }
                                
                        } else if let requestError = error {
                                print("Error fetching recent photos: \(requestError)")
                        } else {
                                print("Unexpected error with the request")
                        }
                        
                        
                })
                
                task.resume()
        }
}
