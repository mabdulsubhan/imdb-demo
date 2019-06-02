//
//  Endpoint.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

/// HTTP Methods
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

/// EndPoint
public struct Endpoint {
    
    /// Properties
    private let method: HTTPMethod
    private let route: String
    private let parameters: [String: String]?
    private let basePath: BasePath
    let headers: [String: String]?
    
    private var url: URL? {
        guard var components = URLComponents(string: basePath.rawValue + route) else { return nil }
        components.queryItems = parameters?.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
    
    /// Init
    public init(
        method: HTTPMethod,
        route: String = "",
        parameters: [String: String]? = nil,
        basePath: BasePath = BasePath.development,
        headers: [String: String]? = nil
        ) {
        
        self.method = method
        self.route = route
        self.parameters = parameters
        self.headers = headers
        self.basePath = basePath
        
    }
    
    func urlRequest() -> URLRequest? {
        
        guard let url = url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers?.forEach({ (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        })

        return request
    }
    
}


