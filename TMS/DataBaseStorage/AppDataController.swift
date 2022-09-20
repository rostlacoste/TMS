//
//  AppDataController.swift
//  TMS
//
//  Created by Rastsislau Yurevich on 20/09/2022.
//
import CoreData
import Foundation

final class AppDataController {
    
    static let shared = AppDataController()
    
    let container = NSPersistentContainer(name: "TMS")
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init () {
        container.loadPersistentStores { result, error in
            if let error = error {
                print("Core data failed to load \(error)")
            }
        }
         
    }
    
    
}
