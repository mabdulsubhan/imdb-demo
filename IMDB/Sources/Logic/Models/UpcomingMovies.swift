//
//  UpcomingMoviesModel.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

struct UpcomingMovies : Codable {
    
    let results : [Movie]?
    let page : Int
    let totalResults : Int
    let totalPages : Int
    
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
