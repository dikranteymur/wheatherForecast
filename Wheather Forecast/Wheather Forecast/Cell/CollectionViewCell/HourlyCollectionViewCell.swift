//
//  HourlyCollectionViewCell.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import UIKit

final class HourlyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureContents()
        
    }
    
    func setCell(hour: String, image: UIImage, temp: Int) {
        hourLabel.text = hour
        iconImageView.image = image
        tempLabel.text = String(temp)
    }
}

// MARK: - ConfigureContents
extension HourlyCollectionViewCell {
    
    private func configureContents() {
        
    }
}
