//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

protocol LocalStorage {
    
    associatedtype T;
    
    func setString(_ value: String, key: T) async
    
    func getString(key: T, defaultValue: String?) async -> String?
    
    func clear(key: T) async
}
