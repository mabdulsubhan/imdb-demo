//
//  MovieDetailBuilderTests.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import XCTest
@testable import IMDB

class MovieDetailBuilderTests: XCTestCase {

    var view: MovieDetailViewController!
    
    override func setUp() {
        
        let upcomingMovies = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
        view = (SceneFactory.shared().getScene(sceneType: .MovieDetail, withMovie: upcomingMovies.results?.first) as! MovieDetailViewController)
    }

    func testBuilderBuildViewModelProperly() {
        //Given
        
        //When
        
        //Then
        XCTAssertTrue(view.viewModel != nil)

    }
    func testBuilderBuildViewControllerProperly() {
        //Given
        
        //When
        
        //Then
        XCTAssertTrue(view != nil)
        
    }


}
