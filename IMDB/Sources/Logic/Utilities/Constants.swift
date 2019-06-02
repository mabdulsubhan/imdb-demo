//
//  Constant.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

/// Keys Constants
struct Keys {
    static let APIKey = "d12b2746c7eaafbfdcf204463e26ff70"
}

/// API Constants
struct APIConstants {
    static let ImageBaseURL = "http://image.tmdb.org/t/p/"
    static let ImagePreviewSize = "w92"
    static let ImageFullSize = "w500"
    static let MovieListAPIRoute = "3/movie/upcoming"
    
}

/// Base Path (Environment)
public enum BasePath: String {
    case development = "https://api.themoviedb.org/"
    case test = "http://someurl.com"
}
