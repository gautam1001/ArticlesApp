//
//  ContentViewModel.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

class ContentViewModel {
   
    let remoteUsecase: ArticlesUseCaseInterface
    let localUsecase: ArticlesUseCaseInterface
    
    var articles: [ArticleEntity] = [ArticleEntity]()
    
    init(remoteUsecase: ArticlesUseCaseInterface, localUsecase:ArticlesUseCaseInterface) {
        self.remoteUsecase = remoteUsecase
        self.localUsecase = localUsecase
    }
    
    func fetchArticlesRemotely() async throws -> [ArticleEntity] {
        do {
            articles = try await remoteUsecase.fetch()
        } catch {
            throw error
        }
        return articles
    }
    
    func fetchArticlesLocally() async throws -> [ArticleEntity] {
        do {
            articles = try await localUsecase.fetch()
        } catch {
            throw error
        }
        return articles
    }
    
    func saveToDevice() async throws {
        try await localUsecase.save(articles: articles)
    }
    
}
