//
//  ArticlesRemoteRepo.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 04/11/22.
//

import Foundation

protocol ArticlesRemoteRepoInterface: ArticlesDataRepoInterface {
    init(url:String, service: NetworkService)
}

class ArticlesRemoteRepo : ArticlesRemoteRepoInterface {
    
    private let url:String
    private let service:NetworkService
    
    required init(url: String, service: NetworkService) {
        self.url = url
        self.service = service
    }
    
    func fetch() async throws -> [ArticleEntity] {
        try await service.request(url: self.url, type: Articles.self).articles.map{$0.toEntity()}
    }
    
    func save(articles: [ArticleEntity]) async throws {
        // call vetwork service
    }
}
