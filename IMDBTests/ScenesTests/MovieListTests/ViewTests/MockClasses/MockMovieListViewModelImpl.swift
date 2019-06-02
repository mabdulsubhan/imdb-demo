//
//  MockMovieListViewModelImpl.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation
@testable import IMDB
import UIKit


class MockMovieListViewModelImpl: MovieListViewModel {
    var dataProvider: MovieListDataProvider!
    var coordinator: MoviesListCoordinator!
    
    var isTapOnResetOrFilterButton = false
    var isNumberOfRowsCalls = false
    var isGetMovieListCellViewModelCalls = false
    var isDidSelectRowCalls = false
    
    var numberOfMovies: Int {
        isNumberOfRowsCalls = true
        return 1
    }
    
    var output: MoviesViewModelOutput?
    
    func getMovieListCellViewModel(index: Int) -> MovieListTableCellViewModel {
        
        isGetMovieListCellViewModelCalls = true
        let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
        return MovieListTableCellViewModel(upcomingMovies.results?.first )
    }
    
    func didSelectMovie(index: Int) {
        isDidSelectRowCalls = true
    }
    
    func didLoad() {
        
    }
    
    func tableViewDidReachToEnd() {
        
    }
    
    func didReset() {
        
    }
    
    func didSelectFiltering(with date: Date) {
        
    }
    
    func performCTA() {
        isTapOnResetOrFilterButton = true
    }
}
