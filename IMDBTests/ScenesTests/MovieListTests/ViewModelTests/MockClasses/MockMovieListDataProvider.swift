//
//  MockMovieListDataProvider.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation
import UIKit
@testable import IMDB


class  MockMovieListDataProvider: MovieListDataProvider {
    var delegate: MovieListDataProviderDelegate?
    
    var closure: (() -> ())?
    
    func providePaginatedUpcomingMovies() {
        closure?()
    }
    
    
}
