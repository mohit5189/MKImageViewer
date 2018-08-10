//
//  MKImageViewController.swift
//  MKImageViewer
//
//  Created by Mohit Kumar on 8/2/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

protocol MKImageViewControllerDelegate {
    func willDisplayImage(index:Int) -> Void
}

extension MKImageViewControllerDelegate{
    func willDisplayImage(index:Int) -> Void {
        
    }
}

public class MKImageViewController: UIViewController {

     var mkImageViewModel:MKImageViewModel!
    private var collectionView:UICollectionView!
    
    var delegate:MKImageViewControllerDelegate?
    
    var images:[MKImage]?
    
    var placeholderImage:UIImage?
        
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor.black

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal

        self.collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: flowLayout)
        self.collectionView.isPagingEnabled = true
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.black
        if #available(iOS 11.0, *) {
            self.collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        self.view.addSubview(self.collectionView)
        
        self.mkImageViewModel = MKImageViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(MKImageCell.self, forCellWithReuseIdentifier: "cell")
        
        self.mkImageViewModel.onDataChanged = {
            self.collectionView.reloadData()
        }
        self.mkImageViewModel.images = images
        
        
    }
    
    func appendImages(images:[MKImage]?) -> Void {
        if let images = images {
            self.images?.append(contentsOf: images)
            self.mkImageViewModel.images = self.images
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
