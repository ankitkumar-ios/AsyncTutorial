//
//  NetworkRequestTests.swift
//  ApiRequestTests
//
//  Created by Ankit Kumar on 29/01/23.
//

import XCTest
@testable import ApiRequest

final class NetworkRequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func test_getTrendingData_errorResponse() async throws {
        let request = MockNetworkRequest()
        let data = try await request.getTrendingData()
        
        XCTAssertTrue(data.isEmpty)
    }
    
    func test_getSearchData_errorResponse() async throws {
        let request = MockNetworkRequest()
        let data = try await request.getSearchData(searchMessage: "")
        
        XCTAssertTrue(data.isEmpty)
    }
}

//MARK: - Stubbing classed

// Network error scenarios
enum NetworkError: Error {
    case invalidURL, dataNotFound, dataIsEmpty
}

// This class is for sending networks requests and getting response back
class MockNetworkRequest: NetworkRequest {
    // Requesting response for the searched strinng.
    func getSearchData(searchMessage search: String) async throws -> [FeedModel] {
        let response = try await getApiResponseData(from: "https://api.giphy.com/v1/gifs/search?message=\(search)")
        return response.data
    }
    
    // Getting trending data response
    func getTrendingData() async throws -> [FeedModel] {
        let response = try await getApiResponseData(from: "https://api.giphy.com/v1/gifs/trending")
        return response.data
    }
    
    // It helps to make actual network calls.
    func getApiResponseData(from url: String) async throws -> FeedResponseModel {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(FeedResponseModel.self, from: data)
        
        return response
    }
}
