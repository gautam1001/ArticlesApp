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
        let remoteDataRepo = ArticlesDataRepo(remoteRepo)
        let remote = ArticlesUseCase(repo: remoteDataRepo)
        let localRepo =  ArticlesLocalRepo(dataManager: CoreDataManager.shared)
        let localDataRepo = ArticlesDataRepo(localRepo)
        let local = ArticlesLocalUsecase(repo: localDataRepo)
        return ContentViewModel(remotecase: remote, localcase: local)
    }
}
