//
//  NetworkManagerTests.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import XCTest
@testable import IMDB

class NetworkManagerTests: XCTestCase {

    func testSuccessResponseFromServer() {
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let networkManger = NetworkManager(session: mockSession)
        
        MockURLProtocol.requestHandler =  { request in
            return (nil, upcomingMovieSuccessStub ,nil)
        }
    
        let endPoint = Endpoint(method: .get)
        networkManger.request(endPoint) { (result) in
            if case let .success(data) = result {
                let upcomingMovie = try! JSONDecoder().decode(UpcomingMovies.self, from: upcomingMovieSuccessStub)
                print(data.count)
                XCTAssertTrue(upcomingMovie.page == 1)
                XCTAssertTrue(upcomingMovie.totalPages == 17)
            }
        }
    }

 
    //MARK: - Test Failure Case
    
    //Test error  is mapping  from server and Model class
    func testInternetConnectionFailureResponseFromServer() {
        
        let error = NSError(domain: NSURLErrorDomain, code: -1009, userInfo: [NSLocalizedDescriptionKey: "The Internet connection appears to be offline."])
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let networkManger = NetworkManager(session: mockSession)
    
        MockURLProtocol.requestHandler =  { request in
            return (nil, nil ,error)
        }
        
        let endPoint = Endpoint(method: .get)
        networkManger.request(endPoint) { (result) in
            if case let .failure(error) = result {
                XCTAssertTrue(error.localizedDescription == "The Internet connection appears to be offline.")
            }
        }
        
    }
    
    //Test error  is mapping  from server and Model class
    func testUnkownErrorFailureResponseFromServer() {
        
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let networkManger = NetworkManager(session: mockSession)
        
        MockURLProtocol.requestHandler =  { request in
            return (nil, nil ,nil)
        }
        
        let endPoint = Endpoint(method: .get)
        networkManger.request(endPoint) { (result) in
            if case let .failure(error) = result {
                XCTAssertTrue(error.localizedDescription == "Unknown, known error.")
            }
        }
        
    }
    
    func testRequestCreationFailureResponse() {
        
        let endPoint = Endpoint(method: .get, route: "\todos",basePath: BasePath.test)
        let networkManger = NetworkManager()
        networkManger.request(endPoint) { (result) in
            if case let .failure(error) = result {
                XCTAssertTrue(error.localizedDescription == "Request could not be created.")
            }
        }
       
        
    }
    
    

}
