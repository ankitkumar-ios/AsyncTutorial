//
//  FeedModel.swift
//  ApiRequest
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

public struct FeedModel: Codable {
    public var id: Int?
    public var url: String
    
    enum CodingKeys: String, CodingKey {
        case id, url
    }
}
