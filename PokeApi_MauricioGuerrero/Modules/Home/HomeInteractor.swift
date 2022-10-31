//
//  HomeInteractor.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 27/10/22.
//

import Foundation
import UIKit


class HomeInteractor : HomeInteractorInputProtocol{
   
    weak var presenter : HomeInteractorOutputProtocol?
    var localDataManager: HomeLocalDataManagerInputProtocol?
    var remoteDataManager: HomeRemoteDataManagerInputProtocol?
    
    private var dataPokemons: [PokemonModel] = []
    
    func getDataPokemon(_ lastIdItem: Int?) {
    
        //if existinlocalDataManager ==> implement future else Continue flow =>
        
        remoteDataManager?.getDataPokemonService(lastIdItem, { pokemons in
            self.presenter?.getListPokemon(list: pokemons)
        })
        
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {

}



