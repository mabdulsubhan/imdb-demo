//
//  MovieListViewControllerTests.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import XCTest
@testable import IMDB

class MovieListViewControllerTests: XCTestCase {

    var  viewModel: MockMovieListViewModelImpl!
    var  view: MovieListViewController!
    let mockTableView = UITableView()
    
    override func setUp() {
        viewModel = MockMovieListViewModelImpl()
        let storyboard = UIStoryboard(name: "MovieList", bundle: Bundle.main)
        view = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController
        view.viewModel = viewModel
        view.loadView()
    }

    //MARK - testOnRightBarButtonTapped
    func testOnRightBarButtonTappedTriggeredViewModelProperMethod() {
        
        view.onRightBarButtonTapped(view.rightBarButton)
        
        XCTAssertTrue(viewModel.isTapOnResetOrFilterButton == true)
    }
    
    //MARK - testOnRightBarButtonTapped
    func testNumberOfRowsInSectionTriggeredViewModelProperMethod() {
        
        _ = view.tableView(view.movieListTableview, numberOfRowsInSection: 1)
        
        XCTAssertTrue(viewModel.isNumberOfRowsCalls == true)
    }
    
    
    //MARK - testOnRightBarButtonTapped
    func testCellDidSelectForRowAtIndexTriggeredViewModelProperMethod() {
        let indexPath = IndexPath(row: 0, section: 1)
        _ = view.tableView(view.movieListTableview, didSelectRowAt: indexPath)
        
        XCTAssertTrue(viewModel.isDidSelectRowCalls == true)
    }

    func testAlert() {
        let messageString = "This is an error message"
        let alert = UIAlertController.showAlert(withMessage: messageString)
        XCTAssertEqual(alert.message, messageString)
    }
}




