//
//  ArticlesDataRepo.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation
import Combine

protocol ArticlesDataRepoInterface {
    //MARK: Asyn-Await API Implementation
    func fetch() async throws -> [ArticleEntity]
    func save(articles: [ArticleEntity]) async throws
    
    //MARK: Combine framework - AnyPublisher Implementation
    func fetch() -> AnyPublisher<[ArticleEntity], Error>
}

class ArticlesDataRepo: ArticlesDomainDataRepoInterface {
    
    private let repo:ArticlesDataRepoInterface
    
    init(_ repo: ArticlesDataRepoInterface) {
        self.repo = repo
    }
    
    //MARK: Asyn-Await API Implementation
    func fetch() async throws -> [ArticleEntity] {
        try await self.repo.fetch()
    }
    
    func save(articles: [ArticleEntity]) async throws {
        try await self.repo.save(articles: articles)
    }
    
    //MARK: Combine framework - AnyPublisher Implementation
    func fetch() -> AnyPublisher<[ArticleEntity], Error> {
        return repo.fetch()
    }
    
    
}
