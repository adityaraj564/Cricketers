//
//  APIService.swift
//  Cricketers
//
//  Created by Aditya Raj on 05/01/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case serverError(Int) // HTTP Status Code
    case decodingError(Error)
    case unknownError
}

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchData<T: Decodable>(from urlString: String, responseType: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                completion(.failure(.serverError(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.unknownError))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(responseType, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
}

