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

struct StoreItemModel: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let imageURL: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price, description, category, rating
        case imageURL = "image"
    }
}

struct Rating: Codable  {
    let rate: Double
    let count: Int
}
