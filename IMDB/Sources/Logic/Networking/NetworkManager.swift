//
//  NetworkManager.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation



/// Netwworking Protocol
protocol Networking {
    
    func request(_ request: Endpoint,completion: @escaping ((Result<Data,NetworkError>) -> Void))
}

/// Netwworking Protocol Implementation
public class NetworkManager : Networking {
    
    /// Properties
    private let session: URLSession
    
    /// Init
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    
    /// Methods
    func request(_ endPoint: Endpoint,completion: @escaping ((Result<Data,NetworkError>) -> Void)) {
        
        guard let request =  endPoint.urlRequest() else {
            completion(.failure(NetworkError.requestCreation))
            return
        }
        
        //Url Session Task creation
        session.dataTask(with: request) { (data, response, error) in
            
                let result: Result<Data,NetworkError>
            
                if let error = error {
                    result = .failure(NetworkError.server(error))
                }
                else if let data = data {
                    result = .success(data)
                    
                } else {
                    result = .failure(NetworkError.unknown)
                }
            
                DispatchQueue.main.async {
                    completion(result)
                }
            }.resume()
    }
}
