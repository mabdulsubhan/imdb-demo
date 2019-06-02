//
//  JSONTranslator.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation

/// TranslationLayer Protocol
protocol TranslationLayer {
    func translateToObject<T: Decodable>(withData data: Data) throws -> T
}

/// TranslationLayer Protocol Implmentation
class JSONTranslation: TranslationLayer {
    
    func translateToObject<T: Decodable>(withData data: Data) throws -> T {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
    }
}
