//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

class QuestionApiService {
    
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func currentQuestion(questionnaireId: String, takerId: String) async throws -> CurrentQuestionResponse {
        return try await self.apiClient.get(
            resource: "/v1/questionnaires/\(questionnaireId)/current/?taker=\(takerId)"
        )
    }
    
    func nextQuestion(questionnaireId: String, takerId: String, request: NextQuestionRequest) async throws -> CurrentQuestionResponse {
        return try await self.apiClient.post(
            resource: "/v1/questionnaires/\(questionnaireId)/next/?taker=\(takerId)",
            data: request
        )
    }
    
    func previous(questionnaireId: String, takerId: String) async throws -> CurrentQuestionResponse {
        return try await self.apiClient.get(
            resource: "/v1/questionnaires/\(questionnaireId)/previous/?taker=\(takerId)"
        )
    }
   
}
