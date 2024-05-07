//
//  TestView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/05.
//

import SwiftUI
import SafariServices
import Foundation

// input -> url 입력

struct TestView: View {
    
    @ObservedObject var testController = TestController()
    
    @State private var inputURL: String = "url1"

    var body: some View {
        VStack {
                TextField(inputURL.isEmpty ? "URL 입력" : inputURL, text: $inputURL)
                    .padding(10)
                    .border(.gray, width: 1)
                    .padding(30)
                    .textInputAutocapitalization(.never)
                    
            
            Button("테스트 버튼", action: {
                testController.urlPreview(urlPath: inputURL)
            })

        } // VStack
        
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
