//
//  ArticlesUseCase.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

protocol ArticlesUseCaseInterface {
    func fetch() async throws -> [ArticleEntity]
}

class ArticlesUseCase: ArticlesUseCaseInterface {
    
    let repo: ArticlesDomainDataRepoInterface
    
    init(repo: ArticlesDomainDataRepoInterface) {
        self.repo = repo
    }
    
    func fetch() async throws -> [ArticleEntity] {
         try await self.repo.fetch()
    }
}
