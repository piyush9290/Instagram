//
//  AppDelegate.swift
//  Instagram
//
//  Created by Piyush Sharma on 2017-05-02.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let tabBarController = UITabBarController()
        let layout = UICollectionViewFlowLayout()
        let homeVC = UINavigationController(rootViewController: HomeViewController(collectionViewLayout: layout))
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let activityVC = UINavigationController(rootViewController: ActivityViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        tabBarController.viewControllers = [homeVC, searchVC, activityVC, profileVC]
        window?.rootViewController = tabBarController
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "homeTab"), selectedImage: UIImage(named: "homeTabSolid"))
        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "searchTab"), selectedImage: UIImage(named: "searchTabSolid"))
        activityVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "activityTab"), selectedImage: UIImage(named: "activityTabSolid"))
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "profileTab"), selectedImage: UIImage(named: "profileTabSolid"))
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().barTintColor = UIColor(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        UITabBar.appearance().layer.borderWidth = 0.5
        UITabBar.appearance().layer.borderColor = UIColor.black.cgColor
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

