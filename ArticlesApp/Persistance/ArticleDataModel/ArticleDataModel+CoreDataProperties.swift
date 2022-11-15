//
//  ArticleDataModel+CoreDataProperties.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 15/11/22.
//
//

import Foundation
import CoreData


extension ArticleDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleDataModel> {
        return NSFetchRequest<ArticleDataModel>(entityName: "ArticleDataModel")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var author: String?

}

extension ArticleDataModel : Identifiable {

}

extension ArticleDataModel {

    func toEntity() -> ArticleEntity {
        ArticleEntity(author: author, title: title, description: desc)
    }
    
}
