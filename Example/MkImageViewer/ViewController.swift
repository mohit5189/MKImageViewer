//
//  ViewController.swift
//  MkImageViewer
//
//  Created by mohit5189 on 08/10/2018.
//  Copyright (c) 2018 mohit5189. All rights reserved.
//

import UIKit
import MkImageViewer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loadImages(_ sender: Any) {
        let controller:MKImageViewController = MKImageViewController()
        controller.images = [MKImage(url: URL(string: "https://images.pexels.com/photos/34950/pexels-photo.jpg")),MKImage(url: URL(string: "https://images.pexels.com/photos/459225/pexels-photo-459225.jpeg")),MKImage(url: URL(string: "https://i.ytimg.com/vi/c2NmyoXBXmE/maxresdefault.jpg")),MKImage(url: URL(string: "https://www.nmfnewsonline.com/upload/news/lifestyle/Nmf2adb21_02_01_slide_nature.jpg")),MKImage(image: UIImage.init(named: "water"))];
        controller.delegate = self;
        controller.placeholderImage = UIImage(named: "Placeholder")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // delegate method
    func willDisplayImage(index:Int) -> Void{
        print("Image to display",index)
    }}

