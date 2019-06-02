//
//  MovieModel.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

struct Movie : Codable {
    let voteCount : Int?
    let id : Int?
    let video : Bool?
    let voteAverage : Double?
    let title : String?
    let popularity : Double?
    let posterPath : String?
    let originalLanguage : String?
    let originalTitle : String?
    let genreIds : [Int]?
    let backdropPath : String?
    let adult : Bool?
    let overview : String?
    let releaseDate : String?
    
    enum CodingKeys: String, CodingKey {
        
        case voteCount = "vote_count"
        case id = "id"
        case video = "video"
        case voteAverage  = "vote_average"
        case title = "title"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult = "adult"
        case overview = "overview"
        case releaseDate  = "release_date"
    }
}
