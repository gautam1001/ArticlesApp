//
//  ArticlesUseCase.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation
import Combine

class ArticlesUseCase: ArticlesUseCaseInterface {
    
    let repo: ArticlesDomainDataRepoInterface
    
    init(repo: ArticlesDomainDataRepoInterface) {
        self.repo = repo
    }
    
    //MARK: Asyn-Await API Implementation
    func fetch() async throws -> [ArticleEntity] {
         try await self.repo.fetch()
    }
    
    func save(articles:[ArticleEntity]) async throws {
        try await repo.save(articles: articles)
    }
    
    //MARK: Combine framework - AnyPublisher Implementation
    func fetch() -> AnyPublisher<[ArticleEntity], Error> {
        return self.repo.fetch()
    }
}
