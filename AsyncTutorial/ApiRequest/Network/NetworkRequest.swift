//
//  NetworkRequest.swift
//  ApiRequest
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL, dataNotFound, dataIsEmpty
}

class NetworkRequest: NSObject {
    func getTrendingData() async throws -> [FeedModel] {
        let response = try await getApiResponseData(from: "https://api.giphy.com/v1/gifs/trending")
        return response.data
    }
    
    func getApiResponseData(from url: String) async throws -> FeedResponseModel {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(FeedResponseModel.self, from: data)
        
        return response
    }
}
