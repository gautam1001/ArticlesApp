//
//  ArticlesLocalRepo.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 04/11/22.
//

import Foundation

protocol ArticlesLocalRepoInterface: ArticlesDataRepoInterface {}

class ArticlesLocalRepo: ArticlesLocalRepoInterface {
    
    func fetch() async throws -> [ArticleEntity] {
        []
    }
    
    func save(articles: [ArticleEntity]) async throws {
        
    }
    
}
