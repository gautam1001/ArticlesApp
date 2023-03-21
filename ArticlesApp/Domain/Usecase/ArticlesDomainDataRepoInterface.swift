//
//  ArticlesDomainDataRepoInterface.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation
import Combine

protocol ArticlesDomainDataRepoInterface {
    //MARK: Asyn-Await API Implementation
    func fetch() async throws -> [ArticleEntity]
    func save(articles:[ArticleEntity]) async throws
    func fetch() -> AnyPublisher<[ArticleEntity], Error>
}
