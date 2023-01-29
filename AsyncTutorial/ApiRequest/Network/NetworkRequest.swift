//
//  NetworkRequest.swift
//  ApiRequest
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

class NetworkRequest: NSObject {
    static let shared = NetworkRequest()
    
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
