//
//  HomeProtocols.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 27/10/22.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? {get set}
    func getListPokemon(list: [PokemonModel])
//    func finishLoad()
}

protocol HomeInteractorInputProtocol: AnyObject {
    //PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDataManager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDataManager: HomeRemoteDataManagerInputProtocol? { get set }
    
    func getDataPokemon(_ lastIdItem: Int?)
}

protocol HomePresenterProtocol: AnyObject {
    //VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? {get set}
    var wireFrame: HomeWireFrame? {get set}
    func viewDidLoad()
    func feedData(lastIdItem: Int)
    
}

protocol HomeInteractorOutputProtocol: AnyObject {
    //INTERACTOR -> PRESENTER
    func getListPokemon(list: [PokemonModel])
}
protocol HomeRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
}
protocol HomeRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    func getDataPokemonService(_ lastIdItem: Int?, _ closure: @escaping ([PokemonModel]) -> Void)
    
}
protocol HomeLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
