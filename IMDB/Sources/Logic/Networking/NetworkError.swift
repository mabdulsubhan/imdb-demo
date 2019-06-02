//
//  NetworkError.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

/// Network Error

enum NetworkError: Error {
    /// Cases
    case requestCreation
    case decoding(Error)
    case server(Error)
    case unknown
}

/// Custom Messages
extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .requestCreation:
            return "Request could not be created."
        case .decoding(let error):
            return "Decoding failed: \(error.localizedDescription)"
        case .server(let error):
            return error.localizedDescription
        case .unknown:
            return "Unknown, known error."
        }
        
    }
}


