//
//  AppDI.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

class AppDI {
    
    func articlesDI() -> ContentViewModel {
        let remoteRepo =  ArticlesRemoteRepo(url: Environment.articlesUrl, service: NetworkService())
        let repo = ArticlesDataRepo(remoteRepo)
//        let localRepo =  ArticlesLocalRepo()
//        let repo = ArticlesDataRepo(localRepo)
        let useCase = ArticlesUseCase(repo: repo)
        return ContentViewModel(usecase: useCase)
    }
}
