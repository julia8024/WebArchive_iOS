//
//  DataController.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/10.
//

import Foundation
import CoreData

@MainActor
class DataController: ObservableObject {
    static let shared = DataController()
//    let container = NSPersistentContainer(name: "WebArchive")
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "WebArchive")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { descriptions, error in
            if let error = error {
                fatalError("failed to load data store \(error)")
            }

        }
    }

    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("DATA SAVED")
        } catch {
            print("FAILED TO SAVE DATA")
        }
    }
    
    
    // MARK: - Link Data
    
    func addLink(title: String, url: String, url_type: String, context: NSManagedObjectContext) {
        let link = Link(context: context)
        link.id = UUID()
        link.title = title
        link.url = url
        link.url_type = url_type
        
        save(context: context)
    }
    
    func editLink(link: Link, title: String, url: String, url_type: String, context: NSManagedObjectContext) {
        link.title = title
        link.url = url
        link.url_type = url_type
        
        save(context: context)
    }
    
    
    // MARK: - Category Data
    
    func addCategory(title: String, imoji: String, context: NSManagedObjectContext) {
        let category = Category(context: context)
        category.id = UUID()
        category.title = title
        category.imoji = imoji
        
        save(context: context)
    }
    
    func editCategory(category: Category, title: String, imoji: String, context: NSManagedObjectContext) {
        category.title = title
        category.imoji = imoji
        
        save(context: context)
    }
    
}
