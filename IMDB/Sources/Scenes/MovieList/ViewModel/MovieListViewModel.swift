//
//  MovieListViewModel.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

typealias MoviesViewModelOutput = (MovieListViewModelImp.Output) -> ()

/// MovieListViewModel Protocol
protocol MovieListViewModel {
    
    var numberOfRows: Int { get }
    var dataProvider: MovieListDataProvider! { get }
    var coordinator: MoviesListCoordinator! { get }
    var output: MoviesViewModelOutput? { get set }
    func getMovieListCellViewModel(index : Int) -> MovieListTableCellViewModel
    func didSelectRow(index : Int)
    func viewDidLoad()
    func tableViewDidReachToEnd()
    func didCancelFiltering()
    func didSelectFiltering(with date: Date)
    func onTapOnResetOrFilterButton()
}

/// MovieListViewModel Implementation
final class MovieListViewModelImp: MovieListViewModel {
    
    
    /// View Output Bindings
    enum Output {
        case reloadMovies
        case showLoader(show: Bool)
        case showDatePicker(show: Bool)
        case showFilterImage(show: Bool)
        case showError(error: Error)
    }
    
    /// Injected Properties
    var dataProvider: MovieListDataProvider!
    var coordinator: MoviesListCoordinator!
    
    /// Injected Properties Initlizaer
    init(withDataProvider movieListDataProvider: MovieListDataProvider,
         andCoordinator movieListCoordinator: MoviesListCoordinator) {
        self.dataProvider = movieListDataProvider
        self.coordinator = movieListCoordinator
    }
    
    /// Stored Properties
    var output: MoviesViewModelOutput?
    
    /// Observables Properties
    var isFilteringActive: Bool = false {
        didSet {
            output?(.showFilterImage(show: isFilteringActive))
        }
    }
    private var allMovieListViewModels = [MovieListTableCellViewModel]() {
        didSet {
            output?(.reloadMovies)
        }
    }
    private var filteredMovieListViewModels = [MovieListTableCellViewModel]()  {
        didSet {
            output?(.reloadMovies)
        }
    }
    
    /// Computed Properties
    private var movieDataSourceViewModels: [MovieListTableCellViewModel] {
        if isFilteringActive {
            return filteredMovieListViewModels
        }
        return allMovieListViewModels
    }
    var numberOfRows: Int {
        return movieDataSourceViewModels.count
    }
    
   
    /// View Input Muatate Methods
    func viewDidLoad() {
        getUpcomingMovies()
    }
    func tableViewDidReachToEnd() {
        getUpcomingMovies()
    }
    func didSelectFiltering(with date: Date) {
        activateFilter(with: date)
    }
    func onTapOnResetOrFilterButton() {
        (isFilteringActive) ?  clearFilter() : output?(.showDatePicker(show: true))
    }
    func didCancelFiltering() {
        output?(.showDatePicker(show: false))
    }
    
    
    /// View Input Action Methods
    func getMovieListCellViewModel(index : Int) -> MovieListTableCellViewModel {
        return movieDataSourceViewModels[index]
    }
    func getUpcomingMovies() {
        
        if isFilteringActive == false  { dataProvider.providePaginatedUpcomingMovies() }
    }
    
    /// Private Methods
    private func activateFilter(with date: Date) {
        isFilteringActive = true
        output?(.showDatePicker(show: false))
        let dateString = DateFormatter.shortFormatDateFormatter.string(from: date)
        filteredMovieListViewModels = allMovieListViewModels.filter({ ($0.movie?.releaseDate ?? "") == dateString })
        
    }

    private func clearFilter() {
        isFilteringActive = false
        filteredMovieListViewModels.removeAll()
    }
    
    func didSelectRow(index: Int) {
        coordinator.navigateToMovieDetail(withMovie: getMovieListCellViewModel(index: index).movie)
    }
}


/// MovieListDataProviderDelegate Delegate
extension MovieListViewModelImp: MovieListDataProviderDelegate {
    
    func showLoader(show: Bool) {
        output?(.showLoader(show: show))
    }
    
    func onSuccess(_ upcomingMovies: UpcomingMovies) {
        guard let results = upcomingMovies.results else { return }
        allMovieListViewModels.append(contentsOf: results.map { MovieListTableCellViewModel.init($0) })
    }
    
    func onFailure(_ error: NetworkError) {
         output?(.showError(error: error))
    }
}

