//
//  Result.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

 /// Result
public enum Result<V, E: Error> {
    case success(V)
    case failure(E)
}
