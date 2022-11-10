//
//  NetworkError.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 04/11/22.
//

import Foundation

enum NetworkError: LocalizedError {
    case badUrl
    case unknown
    case somethingWentWrong
    case incorrectData
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return "Incorrect url"
        case .unknown:
            return "Unknown error"
        case .somethingWentWrong:
            return "something went wrong"
        case .incorrectData:
            return "Incorrect Data format"
        case .custom(let description):
            return description
        }
    }
}
