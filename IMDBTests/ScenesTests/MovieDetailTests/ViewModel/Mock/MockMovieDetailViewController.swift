//
//  MockMovieDetailViewController.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation
@testable import IMDB
import UIKit

class MockMovieDetailViewController: MovieDetailViewController {
    
    var isMovieBannerImageViewCalls = false
    var isShowMovieTitleCalls = false
    var isShowMovieReleaseDate = false
    var isShowMovieDescriptionCalls = false
    var isShowMovieLanguageCalls = false
    var isShowMovieRatingCalls = false
    
    override func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            
            guard let self = self else { return }
            
            switch output {
            case .showMovieBannerImageView( _):
                self.isMovieBannerImageViewCalls = true
            case .showMovieTitle(_):
                self.isShowMovieTitleCalls = true
            case .showMovieReleaseDate( _):
                self.isShowMovieReleaseDate = true
            case .showMovieDescription( _):
                self.isShowMovieDescriptionCalls = true
            case .showMovieLanguage( _):
                self.isShowMovieLanguageCalls = true
            case .showMovieRating( _):
                self.isShowMovieRatingCalls = true
            }
        }
    }
}

