//
//  HomeView+UICollectionDelegate.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 27/10/22.
//

import Foundation
import UIKit

enum SectionsTbl: Int, CaseIterable {
    case header = 0
    case records = 1
    case loading = 2
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionsTbl.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let _enum = SectionsTbl(rawValue: section)
        
        switch _enum {
        case .loading, .header: return 1
        case .records: return dataList.count
        case .none: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let _enum = SectionsTbl(rawValue: indexPath.section)
        
        switch _enum {
        case .header:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderViewCell.id, for: indexPath) as! HeaderViewCell
            
            cell.headerImg.image = PokeImage.header.image
            
            return cell
        case .records:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCardCVC.id, for: indexPath) as! PokemonCardCVC
            let model = dataList[indexPath.row]
            cell.setup(with: model)
            return cell
        case .loading:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadCVC.id, for: indexPath) as! LoadCVC
            cell.loadInd.startAnimating()
            return cell
        case .none:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath
    ){
        let _enum = SectionsTbl(rawValue: indexPath.section)
        
        if _enum == .records,
           indexPath.row == dataList.count - 2,
           !isLoading {
            let lastItem = dataList[dataList.count - 1]
            isLoading = true
            presenter?.feedData(lastIdItem: lastItem.id)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let _enum = SectionsTbl(rawValue: indexPath.section)
        
        if _enum == .records{
            //NOTE: NO REQUIRE VIPER-arch THE DETAIL IS VERY SIMPLE MG
           let record = dataList[indexPath.row]
            let vc = HomeDetailView.instantiate(fromStoryboard: .Home)
            vc.data = record
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(vc, animated: true)
           
        }
    }
    
}

extension HomeView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let _enum = SectionsTbl(rawValue: indexPath.section)
        
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = _enum == .records ? 2 : 1
        let availableWidth = width - 5 * (numberOfItemsPerRow + 1)
        let itemWidthDimension = floor(availableWidth / numberOfItemsPerRow)
        let itemHeightDimension = _enum == .records ? itemWidthDimension * 1.5 : 100
        
        var size = CGSize(width: itemWidthDimension, height: itemHeightDimension)
        
        if _enum == .loading, !isLoading
        {
            size = CGSize.zero
        }
        
        return size
        
        
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForItemAt indexPath: IndexPath) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
    }
    
}
