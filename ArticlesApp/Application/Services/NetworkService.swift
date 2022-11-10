//
//  NetworkService.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation

class NetworkService {
    
    func request<T:Decodable>(url:String, type:T.Type, decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        guard let url = URL(string: url) else { throw NetworkError.badUrl }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw error
        }
    }
}
