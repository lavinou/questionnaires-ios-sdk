//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/18/24.
//

import Foundation

class UserApiService {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func createUser() async throws -> UserResponse {
        let response: UserResponse = try await self.apiClient.post(
            resource: "/users/takers/",
            data: Optional<String>.none
        )
        
        return response
    }
    
    func getUser(id: String) async -> UserResponse? {
        do {
            return try await self.apiClient.get(resource: "/users/takers/\(id)/")
        } catch {
            return nil
        }
    }
}
