//
//  MoviesListCoordinator.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation
import UIKit

/// Movie list coordinator protocol
protocol MoviesListCoordinator {
    func navigateToMovieDetail(withMovie movie: Movie?)
}

/// Protocol implementation of movies list coordinator
class MoviesListCoordinatorImpl: MoviesListCoordinator {
    weak var view: UIViewController?
    
    init(view: UIViewController?) {
        self.view = view
    }
}

extension MoviesListCoordinatorImpl {
    
    func navigateToMovieDetail(withMovie movie: Movie?) {
        let detailController = MovieDetailBuilderImpl().build(withMovie: movie)
        view?.navigationController?.pushViewController(detailController, animated: true)
    }
}
