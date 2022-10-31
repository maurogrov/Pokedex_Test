//
//  PokemonService.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 28/10/22.
//

import Foundation

class PokemonService {
    
    static func downloadData(url: URL, completionData: @escaping (PokemonModel?) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                if let error = error {
                    print("Error en la operación \(error), NT001")
                }
                //                completionData(nil)
                return
            }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(PokemonModel.self, from: data)
                    completionData(object)
                }
                catch let error {
                    print("Ha ocurrido un error: \(error.localizedDescription), NT001")
                    completionData(nil)
                }
            } else {
                print("Error \(response.statusCode), NT001")
                completionData(nil)
            }
        }.resume()
    }
    
    
    
    
}
