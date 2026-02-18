//
//  FavoriteCellModel.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 17.02.2026.
//

import Foundation

struct FavoriteCellModel: Codable {
    let title: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "image"
    }
}
