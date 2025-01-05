//
//  PlayerViewModel.swift
//  Cricketers
//
//  Created by Aditya Raj on 05/01/25.
//

import Foundation

class PlayersViewModel {
    private let apiURL = "https://run.mocky.io/v3/ede2e288-5b09-4964-8076-69cf7eb103d8"
    var players: [Player] = []
    var onPlayersUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func fetchPlayers() {
        APIService.shared.fetchData(from: apiURL, responseType: [String: [Player]].self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.players = data["data"] ?? []
                    self?.onPlayersUpdated?()
                case .failure(let error):
                    self?.handleError(error)
                }
            }
        }
    }
    
    private func handleError(_ error: APIError) {
        switch error {
        case .invalidURL:
            onError?("The URL is invalid.")
        case .networkError(let networkError):
            onError?("Network error: \(networkError.localizedDescription)")
        case .serverError(let statusCode):
            onError?("Server error with status code: \(statusCode)")
        case .decodingError(let decodingError):
            onError?("Failed to decode JSON: \(decodingError.localizedDescription)")
        case .unknownError:
            onError?("An unknown error occurred.")
        }
    }
}

