//
//  companiesController.swift
//  IntermediateTraining
//
//  Created by Chun-Hung Tseng on 2020/7/3.
//  Copyright © 2020 Chun-Hung Tseng. All rights reserved.
//

import UIKit
import CoreData

class companiesController: UITableViewController {
    
    let cellID = "UITableViewCell"
    private var companies: [CompanyStruct] = [
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "Companies"
        
        self.setupNavigationController()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(handleAddCompany))
        
        setupTableView()
        
        fetchCompanies()
    }
    
    private func fetchCompanies() {
        let persistentContainer = NSPersistentContainer(name: "CoreData")
        persistentContainer.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("\(err)")
            }
            
            let context = persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
            
            do {
                let companies = try context.fetch(fetchRequest)
                
                companies.forEach({(company) in
                    print(company.name ?? "")
                })
            } catch let err {
                fatalError("\(err)")
            }
        }
    }
    
    @objc func handleAddCompany() {
        print("handleAddCompany")
        
        let createCompanyController = CreateCompanyController()
        createCompanyController.delegate = self
        
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        present(navController,
                animated: true,
                completion: nil)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .darkBlue
        //        tableView.separatorStyle = .none
        tableView.separatorColor = .white
        
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
    }
    
    
    
    
    //    override var preferredStatusBarStyle: UIStatusBarStyle {
    //        return .lightContent // doesn't work
    //    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID,
                                                 for: indexPath)
        
        cell.backgroundColor = .tealColor
        
        let company = self.companies[indexPath.row]
        cell.textLabel?.text = company.name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.companies.count
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

extension companiesController: CreateCompanyControllerDelegate {
    func didAddCompany(company: CompanyStruct) {
        companies.append(company)
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
