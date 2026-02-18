//
//  CustomCellModel.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 15.02.2026.
//

import Foundation

struct CustomCellModel: Codable {
    let title: String
    let price: Double
    var isLiked: Bool
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case title, price, isLiked
        case imageURL = "image"
    }
}
