//
//  PokeImage.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 29/10/22.
//

import UIKit

enum PokeImage: String {
    
    case launch = "launch"
    case header = "headerPokemon"

    
    
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
