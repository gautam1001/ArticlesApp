//
//  ArticlesUseCaseInterface.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 15/11/22.
//

import Foundation
import Combine

protocol ArticlesUseCaseInterface {
    func fetch() async throws -> [ArticleEntity]
    func fetch() -> AnyPublisher<[ArticleEntity], Error>
    func save(articles:[ArticleEntity]) async throws
}
