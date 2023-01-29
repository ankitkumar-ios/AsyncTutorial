//
//  FeedModel.swift
//  ApiRequest
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

struct FeedResponseModel: Codable {
    var data: [FeedModel]
    var meta: FeedMetaModel
    
    enum CodingKeys: String, CodingKey {
        case data, meta
    }
}

struct FeedMetaModel: Codable {
    var status: Int
    var message: String
    var responseID: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case message = "msg"
        case responseID = "response_id"
    }
}

struct FeedModel: Codable {
    var id: Int?
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case id, url
    }
}
