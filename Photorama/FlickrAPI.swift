//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Rehan Sajid on 26/09/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import Foundation

enum Method: String {
        case recentPhotos = "flickr.photos.getRecent"
        
}

struct FlickrAPI {
        
        private static let baseURLString = "https://api.flickr.com/services/rest"
        
        private static let apiKey = "a6d819499131071f158fd740860a5a88"
        
        private static func flickrURL(method: Method, parameters: [String: String]?) -> URL?{
                
                let components = NSURLComponents(string: baseURLString)
                
                var queryItems = [URLQueryItem]()
                
                let baseParams = [
                        "method" : method.rawValue,
                        "api_key": apiKey,
                        "format" : "json",
                        "nocallabackjson": "1"
                        
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
                
                components?.queryItems = queryItems
                
                return components?.url!
                
        }
        
        static func recentPhotosURL() -> URL {
                
                return flickrURL(method: .recentPhotos, parameters: ["extras" : "url_h,date_taken"])!
                
                
        }
        
        
        
}
