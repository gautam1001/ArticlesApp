//
//  ContentViewModel.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
   
    let remoteUsecase: ArticlesUseCaseInterface
    let localUsecase: ArticlesUseCaseInterface
    
    @Published var articles: [ArticleEntity] = [ArticleEntity]()
    
    var cancellable: Set<AnyCancellable> = []
    
    init(remoteUsecase: ArticlesUseCaseInterface, localUsecase:ArticlesUseCaseInterface) {
        self.remoteUsecase = remoteUsecase
        self.localUsecase = localUsecase
    }
    
    func fetchArticlesRemotely() async throws -> [ArticleEntity] {
        return try await remoteUsecase.fetch()
    }
    
    func fetchArticlesRemotely() {
        remoteUsecase.fetch().sink { completion in
            switch completion {
            case .finished: print("Articles downloaded successfully!!!!!")
            case .failure(let error): print(error.localizedDescription)
            }
        } receiveValue: { [weak self] entities in
            self?.articles = entities
        }.store(in: &cancellable)
    }
    
    func fetchArticlesLocally() async throws -> [ArticleEntity] {
        do {
            self.articles = try await localUsecase.fetch()
        } catch {
            throw error
        }
        return articles
    }
    
    func saveToDevice() async throws {
        try await localUsecase.save(articles: articles)
    }
    
}
