//
//  FeedResponseModel.swift
//  ApiRequest
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

public struct FeedResponseModel: Codable {
    public var data: [FeedModel]
    public var meta: FeedMetaModel
    
    enum CodingKeys: String, CodingKey {
        case data, meta
    }
}
