//
//  HoursTableViewCell.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import UIKit

final class HoursTableViewCell: UITableViewCell {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerFromClass(HourCollectionViewCell.self)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setCell() {
        
    }
}

// MARK: - UILayout
extension HoursTableViewCell {
    
    private func addSubviews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.horizontalToSuperview(insets: .horizontal(20))
        collectionView.verticalToSuperview(insets: .vertical(8))
        collectionView.height(68)
    }
}

// MARK: - ConfigureContents
extension HoursTableViewCell {
    
    private func configureContents() {
        
    }
}
