//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/18/24.
//

import Foundation

class DefaultUserRepository: UserRepository {
    
    private let apiService: UserApiService
    private let localStorage: KeyLocalStorage
    private var inMemoryUser: User? = nil
    
    init(apiService: UserApiService, localStorage: KeyLocalStorage) {
        self.apiService = apiService
        self.localStorage = localStorage
    }
    
    func get() async -> User? {
        
        guard let id = await self.localStorage.getString(key: .userId, defaultValue: nil) else {
            return nil
        }
        
        if( id == self.inMemoryUser?.id) {
            return inMemoryUser
        }
        
        let user = await self.apiService.getUser(id: id)?.toUser()
        inMemoryUser = user
        
        return user
        
    }
    
    func create() async throws -> User {
        let user = try await self.apiService.createUser().toUser()
        
        await self.localStorage.setString(user.id, key: .userId)
        inMemoryUser = user
        
        return user
    }
    
    func clear() async -> Bool {
        await self.localStorage.clear(key: .userId)
        return true
    }
}
