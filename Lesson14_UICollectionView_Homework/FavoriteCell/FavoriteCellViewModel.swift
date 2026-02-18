//
//  FavoriteCellViewModel.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 17.02.2026.
//

import Foundation

final class FavoriteCellViewModel {
    var favoriteArray: [CustomCellModel] = []

    func addFavorite(model: CustomCellModel) {
        favoriteArray.append(model)
    }
}
