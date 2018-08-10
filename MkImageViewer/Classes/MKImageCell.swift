//
//  MKImageCell.swift
//  MKImageViewer
//
//  Created by Mohit Kumar on 8/2/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

class MKImageCell: UICollectionViewCell {
    
    var mkImageCellViewModel:MKImageCellViewModel!
    
    var imageView:UIImageView!
    
    var placeholderImage:UIImage?
    
    var scrollView:UIScrollView!
    
    var didTapScrollView = { () -> () in}
    
    var image:MKImage?{
        didSet{
            
            self.scrollView.zoomScale = 1.0
            self.scrollView.contentSize = self.scrollView.frame.size
            self.imageView.image = nil
            self.mkImageCellViewModel = MKImageCellViewModel()
            
            if let placeholderimage = placeholderImage {
                
                updateFrame(placeholderimage.size)

                self.imageView.image = placeholderimage
            }
            
            self.mkImageCellViewModel.onImageDownloaded = {
                if let image = self.mkImageCellViewModel.downloadedImage {
                    DispatchQueue.main.async {
                        let imageSize = image.size
                        
                        self.updateFrame(imageSize)
                        
                        self.imageView.image = image
                        
                    }
                }
            }
            
            if let image = image {
                self.mkImageCellViewModel.image  = image
            }
            
        }
    }
    
    func updateFrame(_ imageSize:CGSize) -> Void{
        let updatedImageSize = self.mkImageCellViewModel.getUpdatedImageSize(fromScrollSize: self.scrollView.contentSize, imageWidth: imageSize.width, imageHeight: imageSize.height);
        
        self.imageView.frame = CGRect(x: (self.scrollView.contentSize.width-updatedImageSize.width)/2, y: (self.scrollView.contentSize.height-updatedImageSize.height)/2, width: updatedImageSize.width, height: updatedImageSize.height)

    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height))
        self.scrollView.maximumZoomScale = 2.0
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.contentSize = self.scrollView.frame.size
        self.scrollView.delegate = self

        
        self.imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height))
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.isUserInteractionEnabled = false
       

        self.scrollView.addSubview(self.imageView)
        
        self.contentView.addSubview(self.scrollView)

        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapScroll(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.scrollView.addGestureRecognizer(tapGesture)

        self.backgroundColor = UIColor.black
        self.imageView.backgroundColor = UIColor.clear
        self.scrollView.backgroundColor = UIColor.clear
        
    }
    
    @objc func didTapScroll(_ sender:UIGestureRecognizer) {
     didTapScrollView()
    }
    
    required init?(coder:NSCoder){
        super.init(coder: coder)
    }
    
    
}
