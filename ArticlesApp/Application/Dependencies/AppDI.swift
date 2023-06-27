//
//  AppDI.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

protocol AppDIInterface {
    func articlesDI() -> ContentViewModel
}


class AppDI: AppDIInterface {
    
    @MainActor func articlesDI() -> ContentViewModel {
        
        let remoteRepo =  ArticlesRemoteRepo(url: Environment.articlesUrl, service: NetworkService())
        let remoteDataRepo = ArticlesDataRepo(remoteRepo)
        let remoteUsecase = ArticlesUseCase(repo: remoteDataRepo)
        
        let localRepo =  ArticlesLocalRepo(dataManager: CoreDataManager.shared)
        let localDataRepo = ArticlesDataRepo(localRepo)
        let localUsecase = ArticlesLocalUsecase(repo: localDataRepo)
        
        return ContentViewModel(remoteUsecase: remoteUsecase, localUsecase: localUsecase)
    }
}
