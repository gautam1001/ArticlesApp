//
//  ContentViewModel.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

class ContentViewModel {
   
    let remote:ArticlesUseCaseInterface
    let local:ArticlesUseCaseInterface
    
    var articles: [ArticleEntity] = [ArticleEntity]()
    
    init(remotecase: ArticlesUseCaseInterface, localcase:ArticlesUseCaseInterface) {
        self.remote = remotecase
        self.local = localcase
    }
    
    func fetchArticles() async throws -> [ArticleEntity] {
        do {
            articles = try await local.fetch()
        } catch {
            throw error
        }
        return articles
    }
    
    func saveToDevice() async throws {
        try await local.save(articles: articles)
    }
    
}
