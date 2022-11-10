//
//  ContentViewModel.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

class ContentViewModel {
   
    let usecase:ArticlesUseCaseInterface
    
    init(usecase: ArticlesUseCaseInterface) {
        self.usecase = usecase
    }
    
    func fetchArticles() async throws -> [ArticleEntity] {
        try await usecase.fetch()
    }
    
}
