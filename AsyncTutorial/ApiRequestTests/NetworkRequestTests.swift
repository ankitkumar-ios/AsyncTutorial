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
        
    func test_NetworkRequest_Call() async throws {
        let model = try await StubbedNetworkRequest.shared.getRequest(on: "https://api.giphy.com/v1/gifs/trending")
        XCTAssertEqual(model.meta.status, 401)
    }
}

class StubbedNetworkRequest: NetworkRequest {
    static let shared = StubbedNetworkRequest()
    
    private override init() {
        // Making it as a singleton class
    }
    
    // It helps to make actual network calls.
    func getRequest(on url: String) async throws -> FeedResponseModel {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(FeedResponseModel.self, from: data)
        
        return response
    }
}
