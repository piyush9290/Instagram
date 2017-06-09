//
//  ViewController.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-05-02.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var store = PhotoStore()
    var jsonData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpNavigationBar()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(HomeFeedCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView?.register(HomeFeedTopCell.self, forCellWithReuseIdentifier: "cellTop")
        PhotoStore().fetchRecentPhotos(withURL: InstaAPI.interestingPhotosURL, success: {(responseStr) in
            self.jsonData = responseStr
            print(self.jsonData)
        }) { (errorStr) in
            print(errorStr)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        setUpNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTop", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: view.frame.width, height: 100)
        } else {
            return CGSize(width: view.frame.width, height: 500)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func didTapNavCameraButton() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            messageAlertView(title: "Camera", message: "Camera is not available, Please check with Apple Store")
        }
    }
    
    func didTapNavDirectButton() {
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(DirectMessageViewController(), animated: true)
    }
    
    func messageAlertView(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func setUpNavigationBar() {
        navigationItem.title = "Instagram"
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Billabong", size: 30)!]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cameraNav"), style: .plain, target: self, action: #selector(didTapNavCameraButton))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "directNav"), style: .plain, target: self, action: #selector(didTapNavDirectButton))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
}

class HomeFeedCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userImage.png")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "taft"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "more.png"), for: .normal)
        return button
    }()
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "thumbnail.png")
        return imageView
    }()
    
    let buttonStackView: UIStackView = {
        
        let heartButton: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(named: "activityTab.png"), for: .normal)
            return button
        }()
        
        let commentButton: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(named: "comment.png"), for: .normal)
            return button
        }()
        
        let directButton: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(named: "directNav.png"), for: .normal)
            return button
        }()
        
        let stackView = UIStackView(arrangedSubviews: [heartButton,commentButton, directButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 15
        
        return stackView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "save.png"), for: .normal)
        return button
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    func setUpViews() {
        addSubview(userProfileImageView)
        addSubview(userNameLabel)
        addSubview(moreButton)
        addSubview(thumbnailImageView)
        addSubview(buttonStackView)
        addSubview(saveButton)
        addSubview(separatorView)
        addConstraintWithFormat(format: "H:|-8-[v0(44)]", views: userProfileImageView)
        addConstraintWithFormat(format: "H:|-2-[v0]-2-|", views: thumbnailImageView)
        addConstraintWithFormat(format: "H:|-12-[v0]", views: buttonStackView)
        addConstraintWithFormat(format: "H:[v0]-8-|", views: saveButton)
        
        //Vertical Constraints
        addConstraintWithFormat(format: "V:|-8-[v0(44)]-8-[v1]-8-[v2]-8-[v3(1)]|", views: userProfileImageView, thumbnailImageView, buttonStackView, separatorView)
        addConstraintWithFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintWithFormat(format: "H:[v0]-8-|", views: moreButton)
        
        //CenterConstraints
        addConstraint(NSLayoutConstraint(item: userNameLabel, attribute: .centerY, relatedBy: .equal, toItem: userProfileImageView, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: moreButton, attribute: .centerY, relatedBy: .equal, toItem: userProfileImageView, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: userNameLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //TopConstraints
        addConstraint(NSLayoutConstraint(item: saveButton, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeFeedTopCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    let userStoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userImage.png")
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Piyush"
        label.font = label.font.withSize(10)
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    func setUpView() {
        addSubview(userStoryImageView)
        addSubview(userNameLabel)
        addSubview(separatorView)
        addConstraintWithFormat(format: "H:|-10-[v0(60)]", views: userStoryImageView)
        addConstraintWithFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintWithFormat(format: "V:|-10-[v0(60)]-4-[v1(12)]-10-[v2(1)]|", views: userStoryImageView, userNameLabel,separatorView)
        addConstraint(NSLayoutConstraint(item: userNameLabel, attribute: .centerX, relatedBy: .equal, toItem: userStoryImageView, attribute: .centerX, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIView {
    func addConstraintWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

