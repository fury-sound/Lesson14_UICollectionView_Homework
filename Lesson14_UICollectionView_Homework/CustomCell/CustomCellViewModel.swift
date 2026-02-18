//
//  CustomCellViewModel.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 15.02.2026.
//

import Foundation

final class CustomCellViewModel {
    var itemArray: [CustomCellModel] = [
        CustomCellModel(title: "Title 1", price: 11.22, isLiked: false, imageURL: "photo"),
        CustomCellModel(title: "Title 2", price: 22.33, isLiked: true, imageURL: "person.fill"),
        CustomCellModel(title: "Title 3", price: 33.44, isLiked: false, imageURL: "camera")
    ]

    func addItem(index: Int) {
        let newItem = CustomCellModel(title: "New Title \(index + 1)", price: 00.00, isLiked: false, imageURL: "questionmark")
        itemArray.append(newItem)
    }

    func likeItem(at index: Int) {
        itemArray[index].isLiked.toggle()
    }

}
