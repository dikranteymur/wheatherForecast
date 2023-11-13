//
//  UICollectionView+Extension.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import UIKit

extension UICollectionView {
    
    func registerFromClass<T: UICollectionViewCell>(_ cellClass: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func registerFromNib<T: UICollectionViewCell>(_ nib: T.Type) {
        self.register(UINib(nibName: String(describing: T.self), bundle: nil), forCellWithReuseIdentifier: String(describing: T.self))
    }
}
