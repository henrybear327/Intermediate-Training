//
//  CoreDataManager.swift
//  IntermediateTraining
//
//  Created by Chun-Hung Tseng on 2020/7/11.
//  Copyright © 2020 Chun-Hung Tseng. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "CoreData")
        persistentContainer.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("\(err)")
            }
            
            
        }
        return persistentContainer
    }()
}
