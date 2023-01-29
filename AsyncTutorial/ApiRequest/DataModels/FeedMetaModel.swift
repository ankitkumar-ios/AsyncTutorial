//
//  FeedMetaModel.swift
//  ApiRequest
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

public struct FeedMetaModel: Codable {
    public var status: Int
    public var message: String
    public var responseID: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case message = "msg"
        case responseID = "response_id"
    }
}
