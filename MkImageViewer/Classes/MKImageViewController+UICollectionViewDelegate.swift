//
//  MKImageViewController+UICollectionViewDelegate.swift
//  MKImageViewer
//
//  Created by Mohit Kumar on 8/2/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

extension MKImageViewController:UIScrollViewDelegate{
    

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if let delegate = self.delegate {
            delegate.willDisplayImage(index: indexPath.row)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.navigationController?.navigationBar.isHidden)! == false{
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
    
    
    
}
