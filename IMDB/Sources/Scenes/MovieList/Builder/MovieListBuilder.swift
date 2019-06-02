//
//  MovieListBuilder.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import UIKit

/// Movie List Builder protocol
protocol MoviesListBuilder {
    func build() -> MovieListViewController
}

/// Protocol implementation of movies list builder
class MoviesListBuilderImpl: MoviesListBuilder {
    
    
    /// Builds view controller and binds coordinator, data provider and viewmodels with it.
    ///
    /// - Returns: MovieListViewController
    func build() -> MovieListViewController {
    
        let storyboard = UIStoryboard(name: UIStoryboard.Name.moviesList.rawValue, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: UIViewController.Name.moviesList.rawValue) as! MovieListViewController
        
        let dataProvider = MovieListDataProviderImpl()
        dataProvider.movieService = MovieListServiceImpl()
        let coordinator = MoviesListCoordinatorImpl(view: viewController)
        
        let viewModel = MovieListViewModelImp(withDataProvider: dataProvider, andCoordinator: coordinator)
        
        dataProvider.delegate = viewModel
        viewModel.dataProvider = dataProvider
        viewController.viewModel = viewModel
        return viewController
    }
}



