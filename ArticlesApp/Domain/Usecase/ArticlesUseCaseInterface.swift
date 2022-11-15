//
//  ArticlesUseCaseInterface.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 15/11/22.
//

import Foundation

protocol ArticlesUseCaseInterface {
    func fetch() async throws -> [ArticleEntity]
    func save(articles:[ArticleEntity]) async throws
}
