//
//  FavoritesViewController.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 17.02.2026.
//

import UIKit

final class FavoritesViewController: UIViewController {

    // MARK: - Properties
    var viewModel = FavoriteViewModel()
    private let padding: CGFloat = 8

    // MARK: - Subviews

    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    private let emptyImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.contentMode = .scaleAspectFit
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 12
        myImageView.layer.borderWidth = 1
        myImageView.layer.borderColor = UIColor.black.cgColor
        myImageView.backgroundColor = .white
        myImageView.scalesLargeContentImage = true
        myImageView.tintColor = .systemBlue
        myImageView.image = UIImage(named: "fish")
        return myImageView
    }()

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Layout
    private func setupViewProperties(){
        view.backgroundColor = .systemGray2
        title = "Избранное"
    }

    private func setupSubviews(){
        if viewModel.favoriteArray.isEmpty {
            view.addSubview(emptyImageView)
        } else {
            collectionView.register(FavoriteCellView.self, forCellWithReuseIdentifier: FavoriteCellView.favoriteIdentifier)
            view.addSubview(collectionView)
        }
    }

    private func setupConstraints(){
        if viewModel.favoriteArray.isEmpty {
            NSLayoutConstraint.activate([
                emptyImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                emptyImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                emptyImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                emptyImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        } else {
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
    }
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.favoriteArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCellView.favoriteIdentifier, for: indexPath) as? FavoriteCellView  else { return UICollectionViewCell() }
        cell.configure(itemIndex: indexPath.item, with: viewModel.favoriteArray[indexPath.item])
        return cell
    }

}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let actualItemWidth = view.frame.width / 2 - padding * 2
        let actualItemHeight = actualItemWidth * 2
        return CGSize(width: actualItemWidth, height: actualItemHeight)
    }
}

#Preview {
    FavoritesViewController()
}

