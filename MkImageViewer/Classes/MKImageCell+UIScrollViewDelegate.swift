//
//  MKImageCell+UIScrollViewDelegate.swift
//  MKImageViewer
//
//  Created by Mohit Kumar on 8/6/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

extension MKImageCell:UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {

        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
        let subView = scrollView.subviews[0]
        
        let offsetX = max((scrollView.bounds.size.width - scrollView.contentSize.width)*0.5 , 0.0)
        let offsetY = max((scrollView.bounds.size.height - scrollView.contentSize.height)*0.5 , 0.0)
        
        subView.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY)
    }
}
