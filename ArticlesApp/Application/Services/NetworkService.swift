//
//  NetworkService.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import Foundation
import Combine

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
    
    func request<T:Decodable>(url:String, type:T.Type, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T,Error>{
        guard let url = URL(string: url) else { return Fail(error: NetworkError.badUrl).eraseToAnyPublisher() }
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .catch {error in Fail(error: error)}
            .eraseToAnyPublisher()
    }
}
