//
//  DesignExtensions.swift
//  HseAlum
//
//  Created by Sergey on 10/19/17.
//  Copyright © 2017 Бизнес в стиле .RU. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func setCustomNavigationBarColor(){
        if self.navigationController != nil{
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 83/255, blue: 179/255, alpha: 1)
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Lato-Bold", size: 16)!, NSAttributedString.Key.foregroundColor : UIColor.white]
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController?.navigationBar.barStyle = .black
        }
    }
    
}

extension UIView{
    func addBlur(){
        if !UIAccessibility.isReduceTransparencyEnabled {
            self.backgroundColor = UIColor.clear
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurEffectView.layer.zPosition = -1
            self.addSubview(blurEffectView)
        }
    }
}


extension UIColor{
    static let mainBlue = UIColor(red: 0/255, green: 83/255, blue: 179/255, alpha: 1)
    static let translucentBlue = UIColor(red: 0/255, green: 83/255, blue: 179/255, alpha: 0.36)
}


extension UIViewController{
    func showDefaultAlertController(message: String, title: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultOKAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultOKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
