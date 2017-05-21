//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-05-02.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var addProfileButton = UIBarButtonItem(image: UIImage(named: "addProfileNav"), style: .plain, target: self, action: Selector(("didTapAddProfileButton")))
    var settingsButton = UIBarButtonItem(image: UIImage(named: "settingsNav"), style: .plain, target: self, action: Selector(("didTapSettingsButton")))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "piyush9290"
        navigationItem.leftBarButtonItem = addProfileButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = settingsButton
        navigationItem.rightBarButtonItem?.tintColor = .black
        self.view.backgroundColor = .white
        
        let profile: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "profile")
            return imageView
        }()
        self.view.addSubview(profile)
        self.view.addConstraintWithFormat(format: "H:|[v0]|", views: profile)
        self.view.addConstraintWithFormat(format: "V:|-60-[v0]|", views: profile)
        
        
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapAddProfileButton() {
        
    }
    
    func didTapSettingsButton() {
        
    }
    

}
