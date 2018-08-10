//
//  MKImage.swift
//  MKImageViewer
//
//  Created by Mohit Kumar on 8/2/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

public class MKImage: NSObject {

    var imageUrl:URL?
    var downloadedImage:UIImage?
    
    override  init() {
        super.init()
    }
    
     public init(url:URL?) {
        self.imageUrl = url
    }
    
    public init(image:UIImage?){
        self.downloadedImage = image
    }
}
