//
//  NetworkServiceTests.swift
//  ArticlesAppTests
//
//  Created by Prashant Gautam on 27/06/23.
//

import XCTest
@testable import ArticlesApp

final class NetworkServiceTests: XCTestCase {
    
    var serviceMock: NetworkServiceMockInterface?

    override func setUpWithError() throws {
        self.serviceMock = NetworkServiceMocks()
        self.serviceMock?.data = loadStub(name: "articles", fileExtension: "json")
    }

    override func tearDownWithError() throws {
        self.serviceMock = nil
    }

    func testRequestSuccess() async throws {
        let articles = try await self.serviceMock?.request(url: "https://gist.githubusercontent.com/bkobilansky/02acd558cac8d3ac2fa85b68f0c9d402/raw/a68f962e71e2d524576fb70299ef3f466c9739f8/sample-feed.json", type: Articles.self, decoder: JSONDecoder())
        XCTAssertNotNil(articles)
    }
    
    func testRequestBadUrlError() async throws {
        do {
            let _ =  try await self.serviceMock?.request(url: "", type: Articles.self, decoder: JSONDecoder())
        } catch NetworkError.badUrl {
            XCTAssert(true)
        }
    }
    
    func testRequestIncorrectDataError() async throws {
        self.serviceMock?.data = nil
        do {
            let _ =  try await self.serviceMock?.request(url: "https://gist.githubusercontent.com/bkobilansky/02acd558cac8d3ac2fa85b68f0c9d402/raw/a68f962e71e2d524576fb70299ef3f466c9739f8/sample-feed.json", type: Articles.self, decoder: JSONDecoder())
        } catch NetworkError.incorrectData {
            XCTAssert(true)
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
