//
//  NetworkRequest.swift
//  ApiRequest
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

// Network error scenarios
enum NetworkError: Error {
    case invalidURL, dataNotFound, dataIsEmpty
}

// This class is for sending networks requests and getting response back
class ApiRequest: NSObject {
    // Requesting response for the searched strinng.
    func getSearchData(searchMessage search: String) async throws -> [FeedModel] {
        let response = try await NetworkRequest.shared.getRequest(on: "https://api.giphy.com/v1/gifs/search?message=\(search)")
        return response.data
    }
    
    // Getting trending data response
    func getTrendingData() async throws -> [FeedModel] {
        let response = try await NetworkRequest.shared.getRequest(on: "https://api.giphy.com/v1/gifs/trending")
        return response.data
    }
}
