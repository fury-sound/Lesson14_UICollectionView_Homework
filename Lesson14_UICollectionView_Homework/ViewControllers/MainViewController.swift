//
//  MainViewController.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 14.02.2026.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties
    let padding: CGFloat = 8
    private var customCellVM: CustomCellViewModel = CustomCellViewModel()

    // MARK: - Subviews

    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.image = UIImage(systemName: "plus.circle.fill")
        config.title = "Добавить"
        config.imagePadding = 8
        config.imagePlacement = .leading
        button.configuration = config
        return button
    }()

    private lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.image = UIImage(systemName: "heart.circle.fill")
        config.title = "Избранное"
        config.imagePadding = 8
        config.imagePlacement = .leading
        button.configuration = config
        return button
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
        view.backgroundColor = .systemBackground
        title = "Каталог"
    }

    private func setupSubviews(){
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        collectionView.register(CustomCellView.self, forCellWithReuseIdentifier: CustomCellView.identifier)
        view.addSubview(addButton)
        view.addSubview(favoriteButton)
        view.addSubview(collectionView)
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            favoriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }

    @objc private func addButtonTapped() {
        customCellVM.addItem(index: customCellVM.itemArray.count)
        collectionView.reloadData()
    }

    @objc private func favoriteButtonTapped() {
        let favoritesVC = FavoritesViewController()
        favoritesVC.viewModel.favoriteArray = customCellVM.itemArray.compactMap { $0.isLiked ? $0 : nil }
        navigationController?.pushViewController(favoritesVC, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentVC = CurrentViewController()
        currentVC.configure(with: customCellVM.itemArray[indexPath.item])
        navigationController?.pushViewController(currentVC, animated: true)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        customCellVM.itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellView.identifier, for: indexPath) as? CustomCellView else { return UICollectionViewCell() }
        let itemIndex = indexPath.item
        cell.configure(itemIndex: itemIndex, with: customCellVM.itemArray[indexPath.item])
        cell.likeButtonTapped = { [weak self] value in
            guard let self else { return }
            self.customCellVM.likeItem(at: value)
            collectionView.reloadItems(at: [IndexPath(item: value, section: 0)])
        }
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let actualItemWidth = view.frame.width / 3 - padding * 2
        let actualItemHeight = actualItemWidth * 2
        return CGSize(width: actualItemWidth, height: actualItemHeight)
    }
}

#Preview {
    MainViewController()
}

