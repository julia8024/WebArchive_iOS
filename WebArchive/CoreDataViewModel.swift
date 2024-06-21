//
//  CoreDataViewModel.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/10.
//

import Foundation
import CoreData

@MainActor
class CoreDataViewModel: ObservableObject {
    static let shared = CoreDataViewModel()
//    let container = NSPersistentContainer(name: "WebArchive")

    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WebArchive")
        
        container.loadPersistentStores {_, error in
            if let error {
                fatalError("failed to load persistent store \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    private init() { }
    
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "WebArchive")
//        if inMemory {
//            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
//        }
//
//        container.loadPersistentStores { descriptions, error in
//            if let error = error {
//                fatalError("failed to load data store \(error)")
//            }
//
//        }
//    }

//    func save(context: NSManagedObjectContext) {
//        do {
//            try context.save()
//            print("DATA SAVED \(context)")
//        } catch {
//            print("FAILED TO SAVE DATA")
//        }
//    }
    
    
    // 안씀 - 아카이빙
//    func saveContext() {
//        let context = container.viewContext
//        if context.hasChanges { // 변화가 있을 때만 저장
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch {
            print("ERROR SAVING CORE DATA")
            print(error.localizedDescription)
        }
    }
    
    
    
    // MARK: - Link Data
    
    func addLink(title: String, url: String,description_url: String, url_type: String, context: NSManagedObjectContext) {
        let link = Link(context: context)
        link.id = UUID()
        link.title = title
        link.url = url
        link.description_url = description_url
        link.url_type = url_type
        
//        save(context: context)
        saveData()
    }
    
    func editLink(link: Link, title: String, url: String, url_type: String, context: NSManagedObjectContext) {
        link.title = title
        link.url = url
        link.url_type = url_type
        
//        save(context: context)
        saveData()
    }
    
    
    // MARK: - Category Data
    
    func addCategory(title: String, imoji: String, context: NSManagedObjectContext) {
        let category = Category(context: context)
        category.id = UUID()
        category.title = title
        category.imoji = imoji
        
//        save(context: context)
        saveData()
    }
    
    func editCategory(category: Category, title: String, imoji: String, context: NSManagedObjectContext) {
        category.title = title
        category.imoji = imoji
        
//        save(context: context)
        saveData()
    }    
    
}



extension CoreDataViewModel {
    func save() {
        guard container.viewContext.hasChanges else { return }
        
        do {
            try container.viewContext.save()
        } catch {
            print("Failed to save the context: ", error.localizedDescription)
        }
    }
    
    func delete(item: Link) {
        container.viewContext.delete(item)
        save()
    }
}
