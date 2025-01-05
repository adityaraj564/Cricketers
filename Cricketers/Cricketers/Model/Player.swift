//
//  Player.swift
//  Cricketers
//
//  Created by Aditya Raj on 05/01/25.
//

struct Player: Codable {
    let id: Int
    let name: String
    let description: String
    let avatar: String?
    let countryFlagURL: String?
    let matches: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, avatar, matches
        case countryFlagURL = "country_flag_url"
    }
}


