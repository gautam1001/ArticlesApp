//
//  ArticlesDataRepo.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

protocol ArticlesDataRepoInterface {
    func fetch() async throws -> [ArticleEntity]
    func save(articles: [ArticleEntity]) async throws
}

class ArticlesDataRepo: ArticlesDomainDataRepoInterface {
    
    private let repo:ArticlesDataRepoInterface
    
    init(_ repo: ArticlesDataRepoInterface) {
        self.repo = repo
    }
    
    func fetch() async throws -> [ArticleEntity] {
        try await self.repo.fetch()
    }
    
    func save(articles: [ArticleEntity], toDevice: Bool) async throws {
        try await self.repo.save(articles: articles)
    }
}
