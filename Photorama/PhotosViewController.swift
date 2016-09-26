//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Rehan Sajid on 26/09/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
        @IBOutlet var imageView: UIImageView!
        
        var photoStore: PhotoStore!
        
        override func viewDidLoad() {
                super.viewDidLoad()
                
                photoStore.fetchRecentPhotos()
                
        }
        
}
