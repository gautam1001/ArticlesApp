//
//  ArticlesRemoteRepo.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 04/11/22.
//

import Foundation
import Combine

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
    
    var cancellables = Set<AnyCancellable>()
    var cancellable : AnyCancellable?
    func fetch() -> AnyPublisher<[ArticleEntity], Error> {
        print("===== Inside ArticlesRemoteRepo =====")
      return  service.request(url: url, type: Articles.self)
            .map(\.articles)
            .map { articles in
                let list = articles.map{$0.toEntity()}
                print(list)
                return list
            }
            .eraseToAnyPublisher()

//        cancellable =  service.request(url: url, type: Articles.self)
//            .map(\.articles)
//            .map { articles in
//                let list = articles.map{$0.toEntity()}
//                return list
//            }
//           .sink { completion in
//               switch completion {
//               case .finished: print("Data received successfully")
//               case .failure(let failure): print(failure.localizedDescription)
//               }
//           } receiveValue: { articles in
//               print(articles)
//           }

      // return Empty<[ArticleEntity],Error>().eraseToAnyPublisher()
    }
    
    func save(articles: [ArticleEntity]) async throws {
        // call vetwork service
    }
}
