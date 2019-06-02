//
//  MovieDetailViewModelTests.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import XCTest
@testable import IMDB

class MovieDetailViewModelTests: XCTestCase {

   
    var  viewModel: MovieDetailViewModelProtocol!
    var  view = MockMovieDetailViewController()
    
    override func tearDown() {
        viewModel = nil
    }

    func testViewDidLoad() {
        //Given
        let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
        viewModel = MovieDetailViewModel(upcomingMovies.results?.first)
        view.viewModel = viewModel
        view.bindViewModelOutput()
        
        //When
        viewModel.didLoad()
        
        //Then
        XCTAssertTrue(view.isMovieBannerImageViewCalls == true)
        XCTAssertTrue(view.isShowMovieTitleCalls == true)
        XCTAssertTrue(view.isShowMovieReleaseDate == true)
        XCTAssertTrue(view.isShowMovieDescriptionCalls == true)
        XCTAssertTrue(view.isShowMovieLanguageCalls == true)
        XCTAssertTrue(view.isShowMovieRatingCalls == true)
        
        
    }
    
    func testViewDidLoaddd() {
        //Given
        let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieNilStub)
        let viewModel = MovieDetailViewModel(upcomingMovies.results?.first)
        view.viewModel = viewModel
        view.bindViewModelOutput()
        
        //When
        viewModel.didLoad()
        
        //Then
        XCTAssertTrue(view.isMovieBannerImageViewCalls == true)
        XCTAssertTrue(view.isShowMovieTitleCalls == true)
        XCTAssertTrue(view.isShowMovieReleaseDate == true)
        XCTAssertTrue(view.isShowMovieDescriptionCalls == true)
        XCTAssertTrue(view.isShowMovieLanguageCalls == true)
        XCTAssertTrue(view.isShowMovieRatingCalls == true)
        
        
    }
}

