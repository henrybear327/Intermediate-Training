//
//  UIViewController+setup.swift
//  IntermediateTraining
//
//  Created by Chun-Hung Tseng on 2020/7/11.
//  Copyright © 2020 Chun-Hung Tseng. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavigationController() {
        //        self.navigationController?.navigationBar.backgroundColor = .red
        //        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.barTintColor = .red
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .lightRed
            appearance.largeTitleTextAttributes = [
                .foregroundColor : UIColor.white
            ] //portrait title (large)
            appearance.titleTextAttributes = [
                .foregroundColor : UIColor.white
            ] //landscape title (small)
            
            UINavigationBar.appearance().tintColor = .white
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.standardAppearance = appearance //landscape
            self.navigationController?.navigationBar.compactAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance //portrait
        } else {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
            self.navigationController?.navigationBar.largeTitleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
        }
    }
}
