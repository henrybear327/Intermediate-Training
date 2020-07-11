//
//  companiesViewController.swift
//  IntermediateTraining
//
//  Created by Chun-Hung Tseng on 2020/7/3.
//  Copyright © 2020 Chun-Hung Tseng. All rights reserved.
//

import UIKit

class companiesViewController: UITableViewController {
    
    let cellID = "UITableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        tableView.backgroundColor = .darkBlue
//        tableView.separatorStyle = .none
        tableView.separatorColor = .white
        
        setupNavigationController()
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        style: .plain,
        target: self,
        action: #selector(handleAddCompany))
    }
    
    //    override var preferredStatusBarStyle: UIStatusBarStyle {
    //        return .lightContent // doesn't work
    //    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID,
                                                 for: indexPath)
        
        cell.backgroundColor = .tealColor
        
        cell.textLabel?.text = "Hi"
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
}

