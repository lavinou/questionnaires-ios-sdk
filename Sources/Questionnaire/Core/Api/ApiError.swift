//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/18/24.
//

import Foundation

enum ApiError: Error {
    
    case invalidUrl
    case httpError(code: Int)
    case noneHttpResponse
    case unableToDecode
    
    enum Request: Error {
        
        case missingBaseUrl
        case unableToEncode(data: Encodable)
    }
    
}
