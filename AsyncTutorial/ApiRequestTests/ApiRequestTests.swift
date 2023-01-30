//
//  ApiRequestTests.swift
//  ApiRequestTests
//
//  Created by Ankit Kumar on 29/01/23.
//

import XCTest
@testable import ApiRequest

final class ApiRequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getTrendingData_errorResponse() async throws {
        let request = MockApiRequest()
        let data = try await request.getTrendingData(from: "https://api.giphy.com/v1/gifs/")
        
        XCTAssertTrue(data.isEmpty)
    }
    
    func test_getSearchData_errorResponse() async throws {
        let request = MockApiRequest()
        let data = try await request.getSearchData(from: "https://api.giphy.com/v1/gifs/", searchMessage: "")
        
        XCTAssertTrue(data.isEmpty)
    }
}

//MARK: - Stubbing classed
// This class is for sending networks requests and getting response back
class MockApiRequest: ApiRequest {

}
