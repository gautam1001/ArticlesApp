//
//  Articles.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

struct Articles: Decodable {
    let articles:[Article]
}

struct Article: Decodable {
    let author:String?
    let title:String
    let description:String
    
    func toEntity() -> ArticleEntity {
        ArticleEntity(author: author, title: title, description: description)
    }
}
