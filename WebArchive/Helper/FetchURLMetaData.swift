//
//  FetchURLMetaData.swift
//  WebArchive
//
//  Created by 장세희 on 6/22/24.
//

import Foundation
import LinkPresentation
import UniformTypeIdentifiers

class MetaDataModel {
    var title: String
    var url: String

    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}

func fetchURLMetadata(url: URL?) async -> MetaDataModel {
    guard let url = url else { return MetaDataModel(title: "", url: "") }
    let provider = LPMetadataProvider()

    do {
        let metadata = try await provider.startFetchingMetadata(for: url)
        let title = metadata.title ?? ""
        let urlString = metadata.url?.absoluteString ?? ""
        return MetaDataModel(title: title, url: urlString)
    } catch {
        print("Failed to fetch metadata: \(error)")
        return MetaDataModel(title: "", url: "")
    }
}


