//
//  BuildConfiguration.swift
//  AsyncTutorial
//
//  Created by Ankit Kumar on 30/01/23.
//

import Foundation

private enum Environment: String {
    case debugDevelopment = "Debug Development"
    case debugStaging = "Debug Staging"
    case debugProduction = "Debug Production"
    
    case releaseDevelopment = "Release Development"
    case releaseStaging = "Release Staging"
    case releaseProduction = "Release Production"
}

class BuildConfiguration {
    static let shared = BuildConfiguration()
    private var environment: Environment
    
    private init() {
        guard let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String else {
            environment = .debugDevelopment
            return
        }
        environment = Environment(rawValue: currentConfiguration) ?? .debugDevelopment
    }
    
    var baseURL: String {
        switch environment {
        case .debugStaging, .releaseStaging:
            return "https://api.giphy.com/v1/gifs/"
        case .debugDevelopment, .releaseDevelopment:
            return "https://api.giphy.com/v1/gifs/"
        case .debugProduction, .releaseProduction:
            return "https://api.giphy.com/v1/gifs/"
        }
    }
}
