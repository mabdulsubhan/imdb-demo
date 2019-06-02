//
//  MovieListViewModelTests.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import XCTest
@testable import IMDB

class MovieListViewModelTests: XCTestCase {
    
    var  dataProvider: MockMovieListDataProvider!
    var  viewModel: MovieListViewModelImp!
    var  view = MockMovieListViewController()

    override func setUp() {
        
        dataProvider = MockMovieListDataProvider()
        
        let coordinator = MoviesListCoordinatorImpl(view: UIViewController())
        viewModel = MovieListViewModelImp(withDataProvider: dataProvider, andCoordinator: coordinator)
        dataProvider.delegate = viewModel
        view.viewModel = viewModel
        view.bindViewModelOutput()
       
    }

    override func tearDown() {
        dataProvider = nil
        viewModel = nil
    }

    //MARK: -  Success Case
    
    //// - testGetUpcomingMoviesOnSuccessCraetingProperMovieCellViewModel
    func testGetUpcomingMoviesMethodOnSuccess() {
        
        
        //Given Upooming Movies Successfully Fetch and Decode \
        dataProvider.closure = { [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }
        
        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.getUpcomingMovies()
        
        //Then
         let cellViewModel = viewModel.getMovieListCellViewModel(index: 0)
         XCTAssert(cellViewModel.movieTitleText == "John Wick: Chapter 3 – Parabellum")
    
    }
    //MARK: -  Failure Case
    
    //// - testGetUpcomingMoviesMethodOnFailureWithUnknownError
    func testGetUpcomingMoviesMethodOnFailureWithUnknownError() {
        
        
        //Given
        dataProvider.closure = { [unowned self] in
            self.dataProvider.delegate?.onFailure(NetworkError.unknown)
        }
        
        //When getUpcomingMovies method on View model Failed to fetch Upcoming Movies
        viewModel.getUpcomingMovies()
        
        //Then
        XCTAssert(view.isShowErrorCalls == true)
        
    }
    //// - testGetUpcomingMoviesMethodOnFailure
    func testGetUpcomingMoviesMethodOnFailureWithServerError() {
        
        
        //Given
        let error = NSError(domain: NSURLErrorDomain, code: -1009, userInfo: [NSLocalizedDescriptionKey: "The Internet connection appears to be offline."])
        dataProvider.closure = { [unowned self] in
            self.dataProvider.delegate?.onFailure(NetworkError.server(error))
        }
        
        //When getUpcomingMovies method on View model Failed to fetch Upcoming Movies
        viewModel.getUpcomingMovies()
        
        //Then
        XCTAssert(view.isShowErrorCalls == true)
        
    }
    
    
    
    
    //MARK: -  Success Case

    //// - testViewModelViewModelDidLoad On success Api Call
    func testViewModelDidLoadOnSuccessServerCall() {

        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }

        //When
        viewModel.didLoad()

        //Then
        let cellViewModel = viewModel.getMovieListCellViewModel(index: 0)
        XCTAssert(cellViewModel.movieTitleText == "John Wick: Chapter 3 – Parabellum")

    }

    //// - testViewModelTableViewDidReachToEndOnSuccessServerCall
    func testViewModelTableViewDidReachToEndOnSuccessServerCall() {

        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }

        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.tableViewDidReachToEnd()

        //Then
        let cellViewModel = viewModel.getMovieListCellViewModel(index: 0)
        XCTAssert(cellViewModel.movieTitleText == "John Wick: Chapter 3 – Parabellum")

    }

    //// - testViewModelOnTapOnResetOrFilterButtonWhenFilterIsActive
    func testViewModelOnTapOnResetOrFilterButtonWhenFilterIsActive() {


        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }

        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.isFilteringActive = true
        viewModel.performCTA()

        //Then
        XCTAssert(viewModel.isFilteringActive == false)
    }
    //// - testViewModelOnTapOnResetOrFilterButtonWhenFilterIsInActive
    func testViewModelOnTapOnResetOrFilterButtonWhenFilterIsInActive() {
        
        
        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }
        
        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.performCTA()
        
        //Then
        XCTAssert(viewModel.isFilteringActive == false)
        XCTAssert(view.isShowDatePickerCalls == true)
    }

    //// - testViewModelDidCancelFiltering
    func testViewModelDidCancelFiltering() {

        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }

        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.didReset()

        //Then
        XCTAssert(view.isShowDatePickerCalls == true)

    }
    
    //// - testViewModelDidSelectFilteringWhenNoData
    func testViewModelDidSelectFilteringWithNoData() {
        
        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }
        
        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.didSelectFiltering(with: Date())
        
        //Then
        XCTAssert(viewModel.isFilteringActive == true)
        XCTAssert(view.isShowDatePickerCalls == true)
        
    }
    //// - testViewModelDidSelectFilteringWhenNoData
    func testViewModelDidSelectFilteringWithData() {
        
        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }
        
        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.getUpcomingMovies()
        viewModel.didSelectFiltering(with: Date())
        
        //Then
        XCTAssert(viewModel.isFilteringActive == true)
        XCTAssert(view.isShowDatePickerCalls == true)
        
    }
    
    //// - testViewModelNumberOfRowsWhenFilteringIsAvtive
    func testViewModelNumberOfRowsWhenFilteringIsAvtive() {
        
        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }
        
        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.getUpcomingMovies()
        viewModel.isFilteringActive = true
       
        
        //Then
        XCTAssert(viewModel.numberOfMovies == 0)
        
    }
    //// - testViewModelNumberOfRowsWhenFilteringIsInAvtive
    func testViewModelNumberOfRowsWhenFilteringIsInAvtive() {
        
        //Given
        dataProvider.closure = {  [unowned self] in
            let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
            self.dataProvider.delegate?.onSuccess(upcomingMovies)
        }
        
        //WHen getUpcomingMovies method on View model fetches Upcoming Movies
        viewModel.getUpcomingMovies()
        viewModel.isFilteringActive = false
        
        
        //Then
        XCTAssert(viewModel.numberOfMovies == 1)
        
    }



    


}




