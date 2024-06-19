//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation


enum UiResult<T> {
    
    case success(data: T)
    case error(message: String)
}
