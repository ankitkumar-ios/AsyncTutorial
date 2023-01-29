//
//  MockJsonResponse.swift
//  ApiRequestTests
//
//  Created by Ankit Kumar on 29/01/23.
//

import Foundation

func failedResponseData() -> String {
    return  """
{
      "data": [],
      "meta": {
        "status": 401,
        "msg": "No API key found in request.",
        "response_id": ""
      }
    }
}
"""
}
