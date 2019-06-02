//
//  MovieListServiceTests.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import XCTest
@testable import IMDB


class MovieListServiceTests: XCTestCase {

    //Test
    func testUpcomingMovieModelDecodingSuccess() {
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let mockNetworkManager = NetworkManager(session: mockSession)
        
        MockURLProtocol.requestHandler =  { request in
            return (nil, upcomingMovieSuccessStub ,nil)
        }
        
        MovieListServiceImpl(networkManager: mockNetworkManager).fetchMovies(forPage: 2) { (result) in
            if case let .success(upcomingMovie) = result {
                XCTAssertTrue(upcomingMovie.page == 1)
                XCTAssertTrue(upcomingMovie.totalPages == 17)
            }
        }
    }
    
    func testUpcomingMovieModelDecodingFailed() {

        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)

        let mockNetworkManager = NetworkManager(session: mockSession)

        MockURLProtocol.requestHandler =  { request in
            return (nil, upcomingMovieDecodingFailedStub ,nil)
        }

        MovieListServiceImpl(networkManager: mockNetworkManager).fetchMovies(forPage: 1) { (result) in
            if case let .failure(error) = result {
                XCTAssertTrue(error.localizedDescription == "Decoding failed: The data couldn’t be read because it isn’t in the correct format.")
            }
        }
    }

    func testUpcomingMovieMethodWithNoInternetConnection() {
        
         let error = NSError(domain: NSURLErrorDomain, code: -1009, userInfo: [NSLocalizedDescriptionKey: "The Internet connection appears to be offline."])
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let mockNetworkManager = NetworkManager(session: mockSession)
        
        MockURLProtocol.requestHandler =  { request in
            return (nil, nil ,error)
        }
        
        MovieListServiceImpl(networkManager: mockNetworkManager).fetchMovies(forPage: 1) { (result) in
            if case let .failure(error) = result {
                XCTAssertTrue(error.localizedDescription == "The Internet connection appears to be offline.")
            }
        }

    }



}
