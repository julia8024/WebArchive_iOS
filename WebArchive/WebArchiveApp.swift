//
//  WebArchiveApp.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/05.
//

import SwiftUI

@main
struct WebArchiveApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            TestView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            LinkListView() // 애플 개발자 포럼 코드 참고
            URLPreviewView() // LP 링크 프리뷰 커스텀한 뷰
        }
    }
}
