//
//  companiesViewController.swift
//  IntermediateTraining
//
//  Created by Chun-Hung Tseng on 2020/7/3.
//  Copyright © 2020 Chun-Hung Tseng. All rights reserved.
//

import UIKit

class companiesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        tableView.backgroundColor = UIColor(red: 9/255,
                                            green: 45/255,
                                            blue: 64/255,
                                            alpha: 1)
        tableView.separatorStyle = .none
        
        setupNavigationController()
    }
    
    @objc func handleAddCompany() {
        print("handleAddCompany")
    }
    
    func setupNavigationController() {
        self.navigationItem.title = "Companies"
        
        //        self.navigationController?.navigationBar.backgroundColor = .red
        //        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.barTintColor = .red
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
            appearance.backgroundColor = lightRed
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        style: .plain,
        target: self,
        action: #selector(handleAddCompany))
    }
    
    //    override var preferredStatusBarStyle: UIStatusBarStyle {
    //        return .lightContent // doesn't work
    //    }
    
    
}

