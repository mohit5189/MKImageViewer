//
//  MKImageViewModel.swift
//  MKImageViewer
//
//  Created by Mohit Kumar on 8/2/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

class MKImageViewModel: NSObject {

    var onDataChanged = {() -> () in}

    var placeholderImage:UIImage?
    
    // First priority will be of image, not URL
    var placeholderImageUrl:URL?
    
    var images:[MKImage]?{
        didSet{
            onDataChanged()
        }
    }
    
    func numberOfImages() -> Int {
        return self.images?.count ?? 0
    }
    
    func imageForIndex(index:Int) -> MKImage? {
        return self.images?[index] ?? nil
    }
}
