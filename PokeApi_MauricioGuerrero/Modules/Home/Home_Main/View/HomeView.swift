//
//  HomeView.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 27/10/22.
//

import UIKit

class HomeView: UIViewController, Storyboarded {

    @IBOutlet weak var PokemonCV: UICollectionView!
    
    var presenter: HomePresenterProtocol?
    var dataList: [PokemonModel] = []
    var isLoading: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoading = true
        presenter?.viewDidLoad()
        build()
    }
    
    func build(){
        PokemonCV.delegate = self
        PokemonCV.dataSource = self
        PokemonCV.collectionViewLayout = UICollectionViewFlowLayout()
        
        let headerCell = UINib(nibName: HeaderViewCell.id, bundle: nil)
        PokemonCV.register(headerCell, forCellWithReuseIdentifier: HeaderViewCell.id)
        
        let cardCell = UINib(nibName: PokemonCardCVC.id, bundle: nil)
        PokemonCV.register(cardCell, forCellWithReuseIdentifier: PokemonCardCVC.id)
        
        let loadCell = UINib(nibName: LoadCVC.id, bundle: nil)
        PokemonCV.register(loadCell, forCellWithReuseIdentifier: LoadCVC.id)
        
    }

}

extension HomeView : HomeViewProtocol {
    func getListPokemon(list: [PokemonModel]) {
        isLoading = false
        
        for element in list {
            if let _ = dataList.first(where: {$0.id == element.id}){
                continue
            }
            dataList.append(element)
            let indexPath = IndexPath(row: dataList.count - 1, section: SectionsTbl.records.rawValue)
            PokemonCV.insertItems(at: [indexPath])
        }
    }
     
}
