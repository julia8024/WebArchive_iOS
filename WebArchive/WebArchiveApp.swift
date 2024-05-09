//
//  WebArchiveApp.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/05.
//

import SwiftUI

@main
struct WebArchiveApp: App {
//    let persistenceController = PersistenceController.shared
    @StateObject var dataController =  DataController.shared
    
//    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            URLPreviewView() // LP 링크 프리뷰 커스텀한 뷰
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.managedObjectContext, dataController.container.viewContext)

        }
    }
}
