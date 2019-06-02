//
//  MoviesListBuilderTests.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import XCTest
@testable import IMDB

class MoviesListBuilderTests: XCTestCase {
    
    var builder: MoviesListBuilder!
    var view: MovieListViewController!

    override func setUp() {
        
        builder = MoviesListBuilderImpl()
        view = builder.build()
      
    }

    override func tearDown() {
        builder = nil
        view = nil
    }

    func testBuilderBuildViewModelProperly() {
        //Given
        
        //When
        
        //Then
        XCTAssertTrue(view.viewModel != nil)
        XCTAssertTrue(view.viewModel.coordinator != nil)
        XCTAssertTrue(view.viewModel.dataProvider != nil)
        
    }

    func testBuilderBuildViewControllerProperly() {
        //Given
        
        //When
        
        //Then
        XCTAssertTrue(view != nil)
        
    }
   

}
