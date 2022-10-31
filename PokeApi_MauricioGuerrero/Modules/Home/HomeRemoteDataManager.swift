//
//  HomeRemoteDataManager.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 27/10/22.
//

import Foundation
class HomeRemoteDataManager {
    
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    private func buildUrls(nextId: Int ) -> [URL]{
        let askNumberRecords = 20
        
        var urls: [URL] = []
        
        for index in nextId...nextId + askNumberRecords - 1 {
            let urlStr = "https://pokeapi.co/api/v2/pokemon/\(index)"
            guard let url = URL(string: urlStr) else {continue}
            urls.append(url)
        }
        
        return urls
        
    }
    
}

extension HomeRemoteDataManager : HomeRemoteDataManagerInputProtocol{
    
    func getDataPokemonService(_ lastIdItem: Int?, _ closure: @escaping ([PokemonModel]) -> Void) {
        
        let nextId = lastIdItem != nil ? lastIdItem! + 1 : 1
        var objects: [PokemonModel] = []
        
        let urls = buildUrls(nextId: nextId)
   
        //Warning concurrent, overload system MG.
        DispatchQueue(label: "com.queue.serial").async {
            let downloadGroup = DispatchGroup()
            
            urls.forEach {
                downloadGroup.enter()
                PokemonService.downloadData(url: $0) {
                    
                    if let model = $0 {
                        objects.append(model)
                    }
                    downloadGroup.leave()
                }
            }
            
            downloadGroup.wait()
            DispatchQueue.main.async {
                objects.sort(by: { $0.id < $1.id })
                closure(objects)
            }
        }
        
    }
    
}
