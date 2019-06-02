//
//  MovieDetailBuilder.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import UIKit

/// Movie Detail Builder protocol
protocol MovieDetailBuilder {    
    func build(withMovie movie: Movie?) -> MovieDetailViewController
}

/// Protocol implementation of movies details builder
class MovieDetailBuilderImpl: MovieDetailBuilder {
    
    /// Builds view controller and binds coordinator, data provider and viewmodels with it.
    ///
    /// - Returns: MovieDetailViewController
    func build(withMovie movie: Movie?) -> MovieDetailViewController {
        
        let storyboard = UIStoryboard(name: UIStoryboard.Name.moviesDetails.rawValue, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: UIViewController.Name.moviesDetails.rawValue) as! MovieDetailViewController
        let viewModel = MovieDetailViewModelImp(movie)
        viewController.viewModel = viewModel
        
        return viewController
    }
}
