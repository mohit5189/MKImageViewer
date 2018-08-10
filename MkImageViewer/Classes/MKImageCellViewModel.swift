//
//  MKImageCellViewModel.swift
//  MKImageViewer
//
//  Created by Mohit Kumar on 8/2/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

class MKImageCellViewModel: NSObject {

    var onImageDownloaded = { (image:UIImage?) -> () in}
    
    var image:MKImage{
        didSet{
          downloadImage()
        }
    }
    
    var downloadedImage:UIImage?{
        didSet{
            onImageDownloaded(downloadedImage)
            self.image.downloadedImage = self.downloadedImage
        }
    }
    
    override init() {
        self.image = MKImage()
    }
    
    func downloadImage(){
        
        if let image = self.image.downloadedImage{
            
            self.downloadedImage = image
            
        }else{
            if let imageUrl = self.image.imageUrl{
                URLSession.shared.dataTask(with: imageUrl as URL, completionHandler: { (data, response, error) -> Void in
                    if error != nil {
                        print("Error while download image")
                        return
                    }
                    if let data = data{
                        self.downloadedImage = UIImage(data: data);
                    }
                    
                }).resume()
                
            }
        }
    }
    
    func getUpdatedImageSize(fromScrollSize scrollSize:CGSize, imageWidth:CGFloat, imageHeight:CGFloat) -> CGSize {
        
        let ratio1 = scrollSize.width/scrollSize.height
        let ratio2 = imageWidth/imageHeight
        
        if ratio1 < ratio2{
            return CGSize(width: scrollSize.width, height: scrollSize.width/ratio2)
        }else{
            return CGSize(width: scrollSize.height*ratio2, height: scrollSize.height)
        }
    }
}
