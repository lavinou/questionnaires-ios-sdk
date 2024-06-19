//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

extension UserResponse {
    
    func toUser() -> User {
        
        return User(id: self.id, email: self.email, phone: nil)
    }
}
