//
//  FavoriteCellView.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 18.02.2026.
//

import UIKit

final class FavoriteCellView: UICollectionViewCell {

    // MARK: - Properties
    static let favoriteIdentifier: String = "favoriteCellView"

    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Item Name"
        label.layer.cornerRadius = 10
        label.backgroundColor = .clear
        return label
    }()

    private let cellImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 12
        myImageView.layer.borderWidth = 1
        myImageView.layer.borderColor = UIColor.black.cgColor
        myImageView.backgroundColor = .white
        myImageView.scalesLargeContentImage = true
        myImageView.tintColor = .systemBlue
        myImageView.image = UIImage(systemName: "star.fill")
        return myImageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    private func setupViewProperties(){
        contentView.backgroundColor = .systemGray2
    }

    private func setupSubviews(){
        [titleLabel, cellImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }

    private func setupConstraints(){
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(itemIndex: Int, with model: CustomCellModel) {
        titleLabel.text = model.title
        cellImageView.image = UIImage(systemName: model.imageURL)
    }
}

#Preview {
    FavoriteCellView()
}

