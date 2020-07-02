//
//  companiesViewController.swift
//  IntermediateTraining
//
//  Created by Chun-Hung Tseng on 2020/7/3.
//  Copyright © 2020 Chun-Hung Tseng. All rights reserved.
//

import UIKit

class companiesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Companies"
        
        self.view.backgroundColor = .white
        
        setupNavigationController()
        
        let imageView = UIImageView(image: UIImage(systemName: "plus.rectangle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: imageView)
    }
    
    @objc func handleAddCompany() {
        
    }
    
    func setupNavigationController() {
        //        self.navigationController?.navigationBar.backgroundColor = .red
        //        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.barTintColor = .red
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
            appearance.backgroundColor = lightRed
            appearance.largeTitleTextAttributes = [
                .foregroundColor : UIColor.white
            ] //portrait title
            appearance.titleTextAttributes = [
                .foregroundColor : UIColor.white
            ] //landscape title
            
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
    
    //    override var preferredStatusBarStyle: UIStatusBarStyle {
    //        return .lightContent // doesn't work
    //    }
}

