//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation


class KeyLocalStorage: LocalStorage {
    
    typealias T = Key
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func setString(_ value: String, key: Key) async {
        self.userDefaults.set(value, forKey: key.rawValue)
    }
    
    func getString(key: Key, defaultValue: String?) async -> String? {
        if let value = self.userDefaults.string(forKey: key.rawValue) {
            return value
        }
        
        return defaultValue
    }
    
    func clear(key: Key) async {
        self.userDefaults.set(nil, forKey: key.rawValue)
    }
    
    enum Key: String {
        case userId
    }
}
