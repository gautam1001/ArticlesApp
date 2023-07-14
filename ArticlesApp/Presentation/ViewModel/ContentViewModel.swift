//
//  ContentViewModel.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation
import Combine

@MainActor class ContentViewModel: ObservableObject {
   
    let remoteUsecase: ArticlesUseCaseInterface
    let localUsecase: ArticlesUseCaseInterface
    
    @Published var articles: [ArticleEntity] = [ArticleEntity]()
    
    var cancellable: Set<AnyCancellable> = []
    
    init(remoteUsecase: ArticlesUseCaseInterface, localUsecase:ArticlesUseCaseInterface) {
        self.remoteUsecase = remoteUsecase
        self.localUsecase = localUsecase
    }
    
    //MARK:  Asyn-Await API Implementation
    func fetchArticlesRemotely() async throws {
        self.articles =  try await remoteUsecase.fetch()
    }
    
    func fetchArticlesLocally() async throws {
         self.articles = try await localUsecase.fetch()
    }
    
    func saveToDevice() async throws {
        try await localUsecase.save(articles: articles)
    }
    
    //MARK: Combine framework - AnyPublisher Implementation
    func fetchArticlesRemotely() {
        remoteUsecase.fetch()
            .receive(on: DispatchQueue.main)
            .sink { completion in
            switch completion {
            case .finished: print("Articles downloaded successfully!!!!!")
            case .failure(let error): print(error.localizedDescription)
            }
        } receiveValue: { [weak self] entities in
            self?.articles = entities
        }.store(in: &cancellable)
    }
    
}
