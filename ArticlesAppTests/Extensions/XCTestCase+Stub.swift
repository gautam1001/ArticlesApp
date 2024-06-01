//
//  XCTestCase+Stub.swift
//  ArticlesAppTests
//
//  Created by Prashant Gautam on 26/06/23.
//

import XCTest

extension XCTestCase {
    
    // MARK: - Helper Methods

    func loadStub(name: String, fileExtension: String) -> Data? {
        // Obtain Reference to Bundle
        let bundle = Bundle(for: type(of: self))
        // Ask Bundle for URL of Stub
        guard let url = bundle.url(forResource: name, withExtension: fileExtension) else { return nil }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return nil
    }
}
