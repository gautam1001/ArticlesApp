//
//  NetworkServiceMocks.swift
//  ArticlesAppTests
//
//  Created by Prashant Gautam on 26/06/23.
//

import Foundation
@testable import ArticlesApp

protocol NetworkServiceMockInterface: NetworkServiceInterface {
    var data: Data? {get set}
    var error: NetworkError? {get set}
}

class NetworkServiceMocks: NetworkServiceMockInterface {

    var data: Data?
    var error: NetworkError?
    let queue = DispatchQueue(label: "NetworkServiceMockQueue", attributes: .concurrent)
    
    func request<T>(url: String, type: T.Type, decoder: JSONDecoder) async throws -> T where T : Decodable {
        guard let _ = URL(string: url) else {
            throw NetworkError.badUrl
        }
        do {
            if let data {
                let result = try decoder.decode(type, from: data)
                return result
            } else {
                throw NetworkError.incorrectData
            }
        } catch {
            throw error
        }
    }
    
}
