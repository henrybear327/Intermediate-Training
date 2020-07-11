//
//  CreateCompanyController.swift
//  IntermediateTraining
//
//  Created by Chun-Hung Tseng on 2020/7/11.
//  Copyright © 2020 Chun-Hung Tseng. All rights reserved.
//

import UIKit

class CreateCompanyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .darkBlue
        
        self.setupNavigationController()
        
        self.navigationController?.title = "Create company"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancle",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(handleCancelButton))
    }
    
    @objc func handleCancelButton() {
        self.dismiss(animated: true,
                     completion: nil)
    }

}
