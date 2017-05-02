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
