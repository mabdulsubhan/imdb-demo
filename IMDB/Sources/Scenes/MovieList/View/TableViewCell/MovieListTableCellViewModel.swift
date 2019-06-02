//
//  MovieListTableCellViewModel.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

/// MovieListViewModel

struct MovieListTableCellViewModel {
    
     /// Properties
    var movieTitleText: String
    var movieDescription: String
    var moviePosterUrl: String
    var movieReleaseDate: String
    var movie: Movie?
    
    init(_ movie: Movie?) {
        
        self.movie = movie
        self.movieTitleText = movie?.title ?? ""
        self.movieDescription = movie?.overview ?? ""
        self.moviePosterUrl = APIConstants.ImageBaseURL + APIConstants.ImagePreviewSize + (movie?.posterPath ?? "")
        
        let date = DateTimeUtility.getReleaseDateFromString(dateString: movie?.releaseDate ?? "")
        self.movieReleaseDate = DateTimeUtility.convertToLongDateFormat(from: date) ?? ""
    }
    
}
