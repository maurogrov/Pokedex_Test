//
//  HomeDetailVC.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 29/10/22.
//

import UIKit

class HomeDetailView: UIViewController, Storyboarded {
    
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var imageImg: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    
    var data : PokemonModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        build()
    }
    
    func build() {
        
        if let str = data!.sprites.other?.officialArtwork.frontDefault {
            imageImg.loadFrom(URLAddress: str )
        }
        
        idLbl.text = String(data!.id)
        nameLbl.text = data!.name.capitalized
        weightLbl.text = String(data!.height)
        heightLbl.text = String(data!.weight)
        
    }
    
    func buildViews() {
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = CGColor(red: 49.0/255.0, green: 100.0/255.0, blue: 175.0/255.0, alpha: 1.0)
        
        
    }

}

