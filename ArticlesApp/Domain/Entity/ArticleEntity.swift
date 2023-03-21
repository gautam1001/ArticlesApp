//
//  ArticleEntity.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 04/11/22.
//

import Foundation

struct ArticleEntity:Identifiable {
    let id:UUID = UUID()
    let author:String?
    let title:String?
    let description:String?
}
