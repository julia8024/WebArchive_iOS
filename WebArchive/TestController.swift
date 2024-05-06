//
//  TestController.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/05.
//

import Foundation
import LinkPresentation

class TestController: ObservableObject {
    
    // LP 기본 사용법
    func urlPreview(urlPath: String) {
        let metadataProvider = LPMetadataProvider()
        let url = URL(string: urlPath)!
        
        metadataProvider.startFetchingMetadata(for: url) { metadata, error in
            if error != nil {
                // The fetch failed; handle the error
                return
            }
            
            // TODO: Make use of fetched metadata.
        }
        
        
    }
    
    
}
