//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/18/24.
//

import Foundation

protocol UserRepository {
    
    func get() async -> User?
    
    func create() async throws -> User
    
    func clear() async -> Bool
}
