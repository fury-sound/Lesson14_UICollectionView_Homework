//
//  FavoriteViewModel.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 18.02.2026.
//

import Foundation

protocol FavoriteViewModelProtocol: AnyObject {
    var favoriteArray: [FavoriteCellModel] { get }
    func addFavorite(model: FavoriteCellModel)
    func removeFavorite(at index: Int)
}

final class FavoriteViewModel { //}: FavoriteViewModelProtocol {

//    var favoriteArray: [FavoriteCellModel] = [
//        FavoriteCellModel(title: "Title Favorite 1", imageURL: "star"),
//        FavoriteCellModel(title: "Title Favorite 2", imageURL: "star.fill"),
//        FavoriteCellModel(title: "Title Favorite 1", imageURL: "star"),
//        FavoriteCellModel(title: "Title Favorite 2", imageURL: "star.fill"),
//        FavoriteCellModel(title: "Title Favorite 1", imageURL: "star"),
//        FavoriteCellModel(title: "Title Favorite 2", imageURL: "star.fill"),
//        FavoriteCellModel(title: "Title Favorite 1", imageURL: "star"),
//        FavoriteCellModel(title: "Title Favorite 2", imageURL: "star.fill")
//    ]

    var favoriteArray: [CustomCellModel] = []
    
    func addFavorite(model: CustomCellModel) {
        favoriteArray.append(model)
    }

//    func addFavorite(model: FavoriteCellModel) {
//        favoriteArray.append(model)
//    }
    
    func removeFavorite(at index: Int) {
        favoriteArray.remove(at: index)
    }
}

