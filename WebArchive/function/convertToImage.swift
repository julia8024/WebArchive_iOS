//
//  convertToImage.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/06.
//

import Foundation
import UIKit
import LinkPresentation
import UniformTypeIdentifiers


func convertToImage(_ imageProvider: NSItemProvider?) async throws -> UIImage? {
    var image: UIImage?
    
    if let imageProvider {
        let type = String(describing: UTType.image)
        
        if imageProvider.hasItemConformingToTypeIdentifier(type) {
            let item = try await imageProvider.loadItem(forTypeIdentifier: type)
            
            if item is UIImage {
                image = item as? UIImage
            }
            
            if item is URL {
                guard let url = item as? URL,
                      let data = try? Data(contentsOf: url) else { return nil }
                
                image = UIImage(data: data)
            }
            
            if item is Data {
                guard let data = item as? Data else { return nil }
                
                image = UIImage(data: data)
            }
        }
    }
    
    return image
}
