//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by 朱璇 on 16/3/9.
//  Copyright © 2016年 Big Nerd Ranch. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchImageForPhoto(photo) { (result) -> Void in
            switch result {
            case let .Success(image):
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                self.imageView.image = image
                }
            case let .Failure(error):
                print("Error fetching image for photo \(error)")
            }
            
        }
    }
}

