//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

struct CurrentAnswer {
    let id: String
    let value: String?
    
    init(id: String, value: String? = nil) {
        self.id = id
        self.value = value
    }
}
