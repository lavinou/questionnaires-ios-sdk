//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/18/24.
//

import Foundation

struct ApiClient {
    
    let apiKey: String
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    
}

extension ApiClient {
    
    func createRequest(endpoint: EndPoint) throws -> URLRequest {
        
        var component = URLComponents()
        component.scheme = endpoint.scheme
        component.host = endpoint.host
        component.path = endpoint.path
        component.queryItems = endpoint.queryParams.map({
            URLQueryItem(name: $0.key, value: $0.value)
        })
        
        guard let url = component.url else {
            throw ApiError.invalidUrl
        }
        
        
        var request = URLRequest(url: url)
        if let data = endpoint.data {
            do {
                request.httpBody = try encoder.encode(data)
            } catch {
                throw ApiError.Request.unableToEncode(data: data)
            }
        }
        request.httpMethod = endpoint.method.rawValue
        request.setValue("questai-sdk/", forHTTPHeaderField: "User-Agent")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Api-Key \(apiKey)", forHTTPHeaderField: "Authorization")
    
        
        return request
    }
    
    func getResponse<RESPONSE: Decodable>(request: URLRequest) async throws -> RESPONSE {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw ApiError.noneHttpResponse
        }
        
        if(response.statusCode >= 400) {
            throw ApiError.httpError(code: response.statusCode)
        }
        
        
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decoded = try decoder.decode(RESPONSE.self, from: data)
            return decoded
        } catch {
            throw ApiError.unableToDecode
        }
    }
}

extension ApiClient {
    
    func get<RESPONSE: Decodable>(resource: String, params: [String: String] = [:]) async throws -> RESPONSE {
        let endpoint = EndPoint(path: resource, method: .get, queryParams: params)
        let request = try createRequest(endpoint: endpoint)
        
        return try await getResponse(request: request)
    }
    
    func post<REQUEST: Encodable, RESPONSE: Decodable>(
        resource: String,
        data: REQUEST,
        params: [String: String] = [:]
    ) async throws -> RESPONSE {
        let endpoint = EndPoint(path: resource, method: .post, queryParams: params, data: data)
        let request = try createRequest(
            endpoint: endpoint
        )
        
        return try await getResponse(request: request)
    }
    
    func put<REQUEST: Encodable, RESPONSE: Decodable>(
        resource: String,
        data: REQUEST,
        params: [String: String] = [:]
    ) async throws -> RESPONSE {
        let endpoint = EndPoint(path: resource, method: .put, queryParams: params, data: data)
        let request = try createRequest(
            endpoint: endpoint
        )
        
        return try await getResponse(request: request)
    }
    
    func patch<REQUEST: Encodable, RESPONSE: Decodable>(
        resource: String,
        data: REQUEST,
        params: [String: String] = [:]
    ) async throws -> RESPONSE {
        let endpoint = EndPoint(path: resource, method: .patch, queryParams: params, data: data)
        let request = try createRequest(
            endpoint: endpoint
        )
        
        return try await getResponse(request: request)
    }
    
    func delete<REQUEST: Encodable, RESPONSE: Decodable>(
        resource: String,
        data: REQUEST? = nil,
        params: [String: String] = [:]
    ) async throws -> RESPONSE {
        let endpoint = EndPoint(path: resource, method: .delete, queryParams: params, data: data)
        let request = try createRequest(
            endpoint: endpoint
        )
        
        return try await getResponse(request: request)
    }
}
