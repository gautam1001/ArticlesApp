//
//  ArticlesUseCaseInterface.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 15/11/22.
//

import Foundation
import Combine

protocol ArticlesUseCaseInterface {
    //MARK: Asyn-Await API Implementation
    @discardableResult
    func fetch() async throws -> [ArticleEntity]
    func save(articles:[ArticleEntity]) async throws
    //MARK: Combine framework - AnyPublisher Implementation
    func fetch() -> AnyPublisher<[ArticleEntity], Error>
}
