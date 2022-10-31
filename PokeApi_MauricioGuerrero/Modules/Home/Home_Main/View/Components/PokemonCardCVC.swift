//
//  PokemonCardCVC.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 27/10/22.
//

import UIKit

class PokemonCardCVC: UICollectionViewCell {
    
    static let id : String = "PokemonCardCVC"

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var representationImg: UIImageView!
        
    func setup(with data: PokemonModel){
        
        cardView.layer.cornerRadius = 20
        cardView.layer.borderWidth = 3
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.masksToBounds = true
        
        nameLbl.layer.backgroundColor = UIColor.white.cgColor
        nameLbl.layer.cornerRadius = 15
        nameLbl.layer.borderWidth = 1
        nameLbl.layer.borderColor = UIColor.gray.cgColor
        
        imageView.loadGradient(colors: [.gray, .white, .white])
        
        nameLbl?.text = data.name.capitalized
        
        
        if let str = data.sprites.other?.officialArtwork.frontDefault {
            representationImg.loadFrom(URLAddress: str)
        }
        else {
            representationImg.image = nil
        }
    }
}



