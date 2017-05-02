//
//  ViewController.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-05-02.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    var navCameraButton = UIBarButtonItem(image: UIImage(named: "cameraNav"), style: .plain, target: self, action: Selector(("didTapNavCameraButton")))
    var navDirectButton = UIBarButtonItem(image: UIImage(named: "directNav"), style: .plain, target: self, action: Selector(("didTapNavDirectButton")))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Instagram"
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Billabong", size: 30)!]
        navigationItem.leftBarButtonItem = navCameraButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = navDirectButton
        navigationItem.rightBarButtonItem?.tintColor = .black
        self.collectionView?.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapNavCameraButton() {
        
    }
    
    func didTapNavDirectButton() {
        
    }
    
    
    
}

