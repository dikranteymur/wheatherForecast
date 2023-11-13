//
//  SearchViewController.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

import UIKit
import TinyConstraints

final class SearchViewController: UIViewController, SearchViewProtocol {
    
    var presenter: SearchPresenterProtocol?
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .semiBold, size: 22)
        label.textColor = .darkGray
        return label
    }()
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.placeholder = "Sehir"
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Arama Yap", for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
    }
    
    func handleOutput(_ output: SearchPresenterOutput) {
        switch output {
        case .showInfo(let weatherInfoModel):
            print(weatherInfoModel)
            presenter?.loadHomeView(with: weatherInfoModel)
        }
    }
}

// MARK: - UILayout
extension SearchViewController {
    
    private func addSubviews() {
        addMainView()
        addTitleLabel()
        addCloseButton()
        addTextField()
        addDividerView()
        addSearchButton()
    }
    
    private func addMainView() {
        view.addSubview(mainView)
        mainView.centerInSuperview()
    }
    
    private func addTitleLabel() {
        mainView.addSubview(titleLabel)
        titleLabel.topToSuperview(offset: 12)
        titleLabel.centerXToSuperview()
    }
    
    private func addCloseButton() {
        mainView.addSubview(closeButton)
        closeButton.trailingToSuperview(offset: 12)
        closeButton.centerY(to: titleLabel)
        closeButton.size(.init(width: 44, height: 44))
    }
    
    private func addTextField() {
        mainView.addSubview(textField)
        textField.topToBottom(of: titleLabel, offset: 30)
        textField.horizontalToSuperview(insets: .horizontal(12))
        textField.width(UIScreen.main.bounds.width * 0.65)
        textField.height(44)
    }
    
    private func addDividerView() {
        mainView.addSubview(dividerView)
        dividerView.topToBottom(of: textField, offset: 0)
        dividerView.width(to: textField)
        dividerView.centerXToSuperview()
        dividerView.height(2)
    }
    
    private func addSearchButton() {
        mainView.addSubview(searchButton)
        searchButton.topToBottom(of: dividerView, offset: 40)
        searchButton.centerXToSuperview()
        searchButton.width(120)
        searchButton.height(40)
        searchButton.bottomToSuperview(offset: -12)
    }
}

// MARK: - ConfigureContents
extension SearchViewController {
    
    private func configureContents() {
        view.backgroundColor = .black.withAlphaComponent(0.5)
        titleLabel.text = "Arama"
        configureCloseButton()
        configureSearchButton()
    }
    
    private func configureCloseButton() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    private func configureSearchButton() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
}

extension SearchViewController {
    
    @objc
    private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc
    private func searchButtonTapped() {
        if let city = textField.text, !city.isEmpty {
            presenter?.search(with: city)
        } else {
            print("error")
        }
    }
    
}
