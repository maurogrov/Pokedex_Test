//
//  Sprites.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 29/10/22.
//

import Foundation

// MARK: - Sprites
class Sprites: Codable {
//    let backDefault, backFemale, backShiny, backShinyFemale: String
//    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String
    let other: Other?
//    let versions: Versions?
//    let animated: Sprites?

    enum CodingKeys: String, CodingKey {
//        case backDefault = "back_default"
//        case backFemale = "back_female"
//        case backShiny = "back_shiny"
//        case backShinyFemale = "back_shiny_female"
//        case frontDefault = "front_default"
//        case frontFemale = "front_female"
//        case frontShiny = "front_shiny"
//        case frontShinyFemale = "front_shiny_female"
//        case other, versions, animated
        case other
    }
}

// MARK: - Other
struct Other: Codable {
    let officialArtwork: OfficialArtwork
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
