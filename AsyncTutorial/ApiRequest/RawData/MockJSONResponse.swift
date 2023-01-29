//
//  MockJSONResponse.swift
//  ApiRequest
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

class MockJSONResponse {
    static let shared = MockJSONResponse()
    private init() {
        // making singleton class
    }
    
    func getJSONInvalidKey() -> String {
        return """
{
      "data": [],
      "meta": {
        "status": 401,
        "msg": "No API key found in request.",
        "response_id": ""
      }
    }
"""
    }
}
