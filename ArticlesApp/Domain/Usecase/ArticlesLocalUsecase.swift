//
//  ArticlesLocalUsecase.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 15/11/22.
//

import Foundation
import Combine

class ArticlesLocalUsecase: ArticlesUseCaseInterface {
    
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
    
    func fetch() -> AnyPublisher<[ArticleEntity], Error> {
        return self.repo.fetch()
    }
    
}
