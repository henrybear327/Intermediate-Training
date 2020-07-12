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
    private var companies: [Company] = []
    
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
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        do {
            let companies = try context.fetch(fetchRequest)
            
            self.companies = companies
            self.tableView.reloadData()
        } catch let err {
            fatalError("\(err)")
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive,
                                        title: "Delete") { (action, view, callback) in
                                            let company = self.companies[indexPath.row]
                                            print("Deleting \(String(describing: company.name))")
                                            
                                            // tableview
                                            self.companies.remove(at: indexPath.row) // rowInSection will be called in deletion!
                                            self.tableView.deleteRows(at: [indexPath],
                                                                      with: .automatic)
                                            
                                            // core data
                                            let context = CoreDataManager.shared.persistentContainer.viewContext
                                            context.delete(company)
                                            
                                            do {
                                                try context.save()
                                            } catch let err {
                                                fatalError("\(err)")
                                            }
                                            
        }
        
        let edit = UIContextualAction(style: .normal,
                                      title: "Edit") { (action, view, callback) in
                                        let company = self.companies[indexPath.row]
                                        print("Editing \(String(describing: company.name))")
                                        
                                        let editController = CreateCompanyController()
                                        editController.delegate = self
                                        editController.setCompany(company: self.companies[indexPath.row])
                                        self.present(CustomNavigationController(rootViewController: editController),
                                                     animated: true,
                                                     completion: nil)
        }
        
        delete.backgroundColor = .lightRed
        edit.backgroundColor = .darkBlue
        
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
}

extension companiesController: CreateCompanyControllerDelegate {
    func didEditCompany(company: Company) {
        let row = self.companies.firstIndex(of: company)
        
        let reloadIndexPath = IndexPath(row: row!,
                                        section: 0)
        
        tableView.reloadRows(at: [reloadIndexPath],
                             with: .automatic)
    }
    
    func didAddCompany(company: Company) {
        companies.append(company)
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
