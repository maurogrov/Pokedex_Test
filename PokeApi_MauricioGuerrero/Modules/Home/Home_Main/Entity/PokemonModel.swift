//
//  PokemonModel.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 27/10/22.
//

import Foundation

// MARK: - PokemonModel
struct PokemonModel: Codable {
    let height: Int
    let id: Int
    let name: String
    let sprites: Sprites
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case height
        case id
        case name
        case sprites
        case weight
    }
}

