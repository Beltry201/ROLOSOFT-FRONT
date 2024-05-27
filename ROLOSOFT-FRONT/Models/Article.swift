//
//  Article.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 21/05/24.
//

import Foundation

struct Article: Identifiable {
    let id: UUID
    let title: String
    let content: String
    let publicationDate: Date
    let imageURL: URL?
    
    init(id: UUID = UUID(), title: String, content: String, publicationDate: Date, imageURL: URL? = nil) {
        self.id = id
        self.title = title
        self.content = content
        self.publicationDate = publicationDate
        self.imageURL = imageURL
    }
}
