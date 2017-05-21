//
//  DirectMessageViewController.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-05-20.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

class DirectMessageViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setUpNavigationBar()
        setUpView()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "directNav.png")
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let stackView: UIStackView = {
        
        let bigLabel: UILabel = {
            let label = UILabel()
            label.text = "Instagram Direct"
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = label.font.withSize(20)
            return label
        }()
        
        let smallLabel: UILabel = {
            let label = UILabel()
            label.text = "Send private photos, videos and messages to a friend or group."
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = label.font.withSize(12)
            return label
        }()
        
        let sendMessageButton: UIButton = {
            let button = UIButton()
            button.setTitle("Send Message", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.borderWidth = 0
            button.setTitleColor(.blue, for: .normal)
            button.titleLabel?.font = button.titleLabel?.font.withSize(12)
            button.layer.masksToBounds = true
            return button
        }()
        
        let stackView = UIStackView(arrangedSubviews: [bigLabel,smallLabel, sendMessageButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 15
        
        return stackView
    }()
    
    
    let cameraButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0
        button.setImage(UIImage(named: "camera.png"), for: .normal)
        button.setTitle("  Camera", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.layer.masksToBounds = true
        return button
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    
    func setUpView() {
        self.view.addSubview(arrowImage)
        self.view.addSubview(stackView)
        self.view.addSubview(cameraButton)
        self.view.addSubview(separatorView)
        self.view.addConstraintWithFormat(format: "H:|[v0]|", views: separatorView)
        self.view.addConstraintWithFormat(format: "V:[v0(1)]-4-[v1]-10-|", views: separatorView, cameraButton)
        self.view.addConstraint(NSLayoutConstraint(item: cameraButton, attribute: .centerX, relatedBy: .equal, toItem: stackView, attribute: .centerX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: arrowImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        self.view.addConstraint(NSLayoutConstraint(item: arrowImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        self.view.addConstraint(NSLayoutConstraint(item: arrowImage, attribute: .centerX, relatedBy: .equal, toItem: stackView, attribute: .centerX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: arrowImage, attribute: .bottom, relatedBy: .equal, toItem: stackView, attribute: .top, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    func setUpNavigationBar() {
        navigationItem.title = "Direct"
        navigationController?.navigationBar.tintColor = .darkGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(didTapNavAddButton))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func didTapNavAddButton() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
