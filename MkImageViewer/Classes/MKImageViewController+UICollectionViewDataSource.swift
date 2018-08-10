//
//  MKImageViewController+UICollectionViewDataSource.swift
//  MKImageViewer
//
//  Created by Mohit Kumar on 8/2/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

extension MKImageViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell:MKImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MKImageCell
        
        cell.placeholderImage = self.placeholderImage
        
        cell.image = self.mkImageViewModel.imageForIndex(index: indexPath.row)
        
        cell.didTapScrollView = {
            if (self.navigationController?.navigationBar.isHidden)!{
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            }else{
                self.navigationController?.setNavigationBarHidden(true, animated: true)
            }
        }
       
        return cell

    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.mkImageViewModel.numberOfImages()
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0 ;
    }
    
    
    
}
