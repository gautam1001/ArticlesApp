//
//  ArticlesDomainDataRepoInterface.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

protocol ArticlesDomainDataRepoInterface {
    func fetch() async throws -> [ArticleEntity]
}
