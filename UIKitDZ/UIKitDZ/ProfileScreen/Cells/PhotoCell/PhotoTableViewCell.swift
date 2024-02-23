// PhotoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с коллекцией фото
final class PhotoTableViewCell: UITableViewCell {
    var sourse: [String] = []

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configeruContentView()
        configCollection()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(model: Photo) {
        sourse = model.photos
    }

    // MARK: - Private Methods

    private func configeruContentView() {
        contentView.heightAnchor.constraint(equalToConstant: 124 * 5).isActive = true
    }

    private func configCollection() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.register(
            PhotoCollectionViewCell.self,
            forCellWithReuseIdentifier: AppConstants.photoIdentifier
        )
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 1.5
        layout.minimumInteritemSpacing = 1.5
        return layout
    }
}

// MARK: - Extension UICollectionViewDataSource

extension PhotoTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sourse.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AppConstants.photoIdentifier,
            for: indexPath
        ) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(imageName: sourse[indexPath.item])
        return cell
    }
}
