//
//  ArticlesDataRepo.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

protocol ArticlesDataRepoInterface {
    func fetch() async throws -> [ArticleEntity]
}

class ArticlesDataRepo: ArticlesDomainDataRepoInterface {
   
    private let repo:ArticlesDataRepoInterface
    
    init(_ repo: ArticlesDataRepoInterface) {
        self.repo = repo
    }
    
    func fetch() async throws -> [ArticleEntity] {
        try await self.repo.fetch()
    }
    
}
