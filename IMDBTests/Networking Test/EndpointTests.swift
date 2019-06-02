//
//  EndpointTests.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import XCTest
@testable import IMDB

class EndpointTests: XCTestCase {

    //MARK: - Http Method Mapping
    func testEndPointHttpMethodMapping() {
        
        let getEndPoint = Endpoint(method: .get)
        let postEndPoint = Endpoint(method: .post)
        let putEndPoint = Endpoint(method: .put)
        let deleteEndPoint = Endpoint(method: .delete)
        
        XCTAssertTrue(getEndPoint.urlRequest()?.httpMethod == "GET","Should Return GET")
        XCTAssertTrue(postEndPoint.urlRequest()?.httpMethod == "POST","Should Return POST")
        XCTAssertTrue(putEndPoint.urlRequest()?.httpMethod == "PUT","Should Return PUT")
        XCTAssertTrue(deleteEndPoint.urlRequest()?.httpMethod == "DELETE","Should Return DELETE")
    }
    
    //MARK: - EndPoint Route Mapping
    func testEndPointHttpRouteMapping() {
        
        let endPoint = Endpoint(method: .get, route: "/todos",basePath: BasePath.test)
        XCTAssertTrue(endPoint.urlRequest()?.url?.absoluteString == "http://someurl.com/todos","Should Return Current Route Mapping")
        
    }
    
    //MARK: - EndPoint Parameter Mapping
    func testEndPointParametersMapping() {
        
        let endPoint = Endpoint(method: .get,route: "/todos", parameters: ["api_key":"d12b2746c7eaafbfdcf204463e26ff70"], basePath: BasePath.test)
        XCTAssertTrue((endPoint.urlRequest()?.url?.absoluteString)! == "http://someurl.com/todos?api_key=d12b2746c7eaafbfdcf204463e26ff70","Should Map Parameter in Url")
        
    }
    
    //MARK: - EndPoint Base path Mapping
    func testEndPointHttpBasePathMapping() {
        let endPoint = Endpoint(method: .get,basePath: BasePath.test)
        XCTAssertTrue(endPoint.urlRequest()?.url?.absoluteString == "http://someurl.com","Should Return Test Base Path")
        
    }
    
    //MARK: - EndPoint Headers Mapping
    func testEndPointHttpHeadersMapping() {
        let endPoint = Endpoint(method: .get,basePath: BasePath.test,headers:["token":"key"])
        XCTAssertTrue(endPoint.urlRequest()?.value(forHTTPHeaderField: "token") == "key","Should Return Header with value key ")
        
    }
    
    
  
    

 

}
