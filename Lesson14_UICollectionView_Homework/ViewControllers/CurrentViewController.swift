//
//  CurrentViewController.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 18.02.2026.
//

import UIKit

final class CurrentViewController: UIViewController {

    // MARK: - Properties
    private let padding: CGFloat = 20

    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = "Item Name"
        label.layer.cornerRadius = 10
        label.backgroundColor = .clear
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = "$99.99"
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

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Layout
    private func setupViewProperties(){
        view.backgroundColor = .systemGray2
    }

    private func setupSubviews(){
        [titleLabel, priceLabel, cellImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            cellImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            cellImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            priceLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: padding),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }

    func configure(with model: CustomCellModel) {
        titleLabel.text = model.title
        priceLabel.text = "$\(model.price)"
        cellImageView.image = UIImage(systemName: model.imageURL)
    }

    //    @objc private func didTapButton(){
    //    }
}

#Preview {
    CurrentViewController()
}

