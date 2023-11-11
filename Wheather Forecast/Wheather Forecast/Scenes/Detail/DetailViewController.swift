//
//  DetailViewController.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import UIKit
import TinyConstraints

final class DetailViewController: UIViewController {
    
    private let hoursCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 44, height: 60)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerFromNib(HourlyCollectionViewCell.self)
        return collectionView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let windSpeedView: InfoView = {
        let view = InfoView()
        view.setView(image: UIImage(systemName: "wind")!, value: "8 km/s", info: "Ruzgar Hizi")
        return view
    }()
    
    private let humidityView: InfoView = {
        let view = InfoView()
        view.setView(image: UIImage(systemName: "humidity")!, value: "%65", info: "Nem Miktari")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
    }
}

// MARK: - AddSubviews
extension DetailViewController {
    
    private func addSubviews() {
        addHoursCollectionView()
        addInfoStackView()
    }
    
    private func addHoursCollectionView() {
        view.addSubview(hoursCollectionView)
        hoursCollectionView.topToSuperview(offset: 20, usingSafeArea: true)
        hoursCollectionView.horizontalToSuperview(insets: .horizontal(20))
        hoursCollectionView.height(120)
    }
    
    private func addInfoStackView() {
        view.addSubview(infoStackView)
        infoStackView.topToBottom(of: hoursCollectionView, offset: 20)
        infoStackView.horizontalToSuperview(insets: .horizontal(20))
        infoStackView.addArrangedSubview(windSpeedView)
        infoStackView.addArrangedSubview(humidityView)
    }
}

// MARK: - ConfigureContents
extension DetailViewController {
    
    private func configureContents() {
        navigationItem.title = "Hava Durumu"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle.fill")!, style: .done, target: self, action: #selector(close))
    }
}

// MARK: - Actions
extension DetailViewController {
    
    @objc
    private func close() {
        navigationController?.dismiss(animated: true)
    }
}
