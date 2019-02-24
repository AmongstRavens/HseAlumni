//
//  AppDelegate.swift
//  HseAlumni
//
//  Created by Sergey on 2/11/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //showFontsNames()
        setNavigationAndTabBarApperance()
        return true
    }
    
    private func showFontsNames(){
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    private func setNavigationAndTabBarApperance(){
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().backgroundColor = .mainBlue
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .mainBlue
        UINavigationBar.appearance().isTranslucent = false
        UIBarButtonItem.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Lato-Regular", size: 15)!, NSAttributedString.Key.foregroundColor : UIColor.white]
        UITabBar.appearance().backgroundColor = .mainBlue
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .mainBlue
    }
}

