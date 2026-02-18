//
//  CustomCellView.swift
//  Lesson14_UICollectionView_Homework
//
//  Created by Valery Zvonarev on 15.02.2026.
//

import UIKit

final class CustomCellView: UICollectionViewCell {

    // MARK: - Properties
    static let identifier: String = "CustomCellView"
//    private var customCellVM: CustomCellViewModel?
    private var itemIndex: Int?
    var likeButtonTapped: ((Int) -> Void)?

    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 3
        label.text = "Item Name \n Continued"
        label.layer.cornerRadius = 10
        label.backgroundColor = .systemGreen
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .regular)
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

    private let likeImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        //        myImageView.layer.cornerRadius = 10
        myImageView.backgroundColor = .clear // .blue.withAlphaComponent(0.2)
        myImageView.tintColor = .red
        myImageView.image = UIImage(systemName: "heart")
        return myImageView
    }()

    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Like", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 7
        return button
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


    // MARK: - Lifecycles
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        priceLabel.text = nil
        cellImageView.image = nil
        itemIndex = nil
        //        cellBGColor = .clear
        //        tempColor = .clear
    }

    // MARK: - Layout
    private func setupViewProperties(){
        contentView.backgroundColor = .systemGray2.withAlphaComponent(0.5)
        contentView.layer.cornerRadius = 12
    }

    private func setupSubviews(){
        likeButton.addTarget(self, action: #selector(onLikeButtonTapped), for: .touchUpInside)
        [titleLabel, priceLabel, cellImageView, likeImageView, likeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        cellImageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        cellImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        priceLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        priceLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }

    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            cellImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            cellImageView.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -5),
            likeImageView.topAnchor.constraint(equalTo: cellImageView.topAnchor, constant: 5),
            likeImageView.trailingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: -5),
            likeImageView.heightAnchor.constraint(equalToConstant: 20),
            likeImageView.widthAnchor.constraint(equalToConstant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            likeButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            likeButton.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    func configure(itemIndex: Int, with model: CustomCellModel) {
        self.itemIndex = itemIndex
        titleLabel.text = model.title
        priceLabel.text = "$\(model.price)"
        cellImageView.image = UIImage(systemName: model.imageURL)
        likeImageView.image = (model.isLiked) ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")

//        titleLabel.text = "After reuse"
//        priceLabel.text = "$\(111.22)"
//        cellImageView.image = UIImage(systemName: "photo")
    }

    @objc private func onLikeButtonTapped() {
//        likeImageView.image = (likeImageView.image == UIImage(systemName: "heart")) ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        guard let index = itemIndex else { return }
        likeButtonTapped?(index)
//        customCellVM.likeItem(at: index)
    }

}

#Preview {
    {
        let cell = CustomCellView()
        cell.frame = CGRect(x: 50, y: 200, width: 100, height: 200)
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        container.backgroundColor = .systemBackground
        container.addSubview(cell)
        return container
    }()
}
