//
//  ArticlesDataRepo.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation
import Combine

protocol ArticlesDataRepoInterface {
    func fetch() async throws -> [ArticleEntity]
    func save(articles: [ArticleEntity]) async throws
    func fetch() -> AnyPublisher<[ArticleEntity], Error>
}

class ArticlesDataRepo: ArticlesDomainDataRepoInterface {
    
    private let repo:ArticlesDataRepoInterface
    
    init(_ repo: ArticlesDataRepoInterface) {
        self.repo = repo
    }
    
    func fetch() async throws -> [ArticleEntity] {
        try await self.repo.fetch()
    }
    
    func fetch() -> AnyPublisher<[ArticleEntity], Error> {
        return repo.fetch()
    }
    
    func save(articles: [ArticleEntity]) async throws {
        try await self.repo.save(articles: articles)
    }
}
