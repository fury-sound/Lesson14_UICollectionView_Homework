//
//  FavoriteViewModel.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 18.02.2026.
//

import Foundation

final class FavoriteViewModel {

    var favoriteArray: [CustomCellModel] = []
    
    func addFavorite(model: CustomCellModel) {
        favoriteArray.append(model)
    }

}

