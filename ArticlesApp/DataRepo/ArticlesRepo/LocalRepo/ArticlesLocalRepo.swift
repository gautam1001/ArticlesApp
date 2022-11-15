//
//  ArticlesLocalRepo.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 04/11/22.
//

import Foundation
import CoreData

protocol ArticlesLocalRepoInterface: ArticlesDataRepoInterface {
    init(dataManager: CoreDataManager)
}

class ArticlesLocalRepo: ArticlesLocalRepoInterface {
    private let dataManager:CoreDataManager
    
    required init(dataManager: CoreDataManager) {
        self.dataManager = dataManager
    }
    
    func fetch() async throws -> [ArticleEntity] {
        do {
           return try ArticleDataModel.fetchRequest().execute().map{ $0.toEntity()}
        } catch {
            throw error
        }
    }
    
    func save(articles: [ArticleEntity]) async throws {
        for article in articles {
            let model = ArticleDataModel(context: dataManager.backgroundContext)
            model.title = article.title
            model.desc = article.description
            model.author = article.author
            do {
                try dataManager.backgroundContext.save()
               // try dataManager.backgroundContext.parent?.save()
                print("### Saved locally ####")
            } catch {
                print("### Unable to save: \(error.localizedDescription) ####")
                throw error
            }
        }
    }
    
}
