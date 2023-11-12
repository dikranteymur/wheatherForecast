//
//  MainViewController.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    var pageViewController: PageViewController?
    var viewControllers: [UIViewController] = []
    
    private let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.currentPageIndicatorTintColor = .red
        control.pageIndicatorTintColor = .gray
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        addSubviews()
        configureContents()
    }
}

// MARK: - UILayout
extension MainViewController {
    
    private func addSubviews() {
        addPageViewController()
        addPageControl()
    }
    
    private func addPageViewController() {
        guard let pageViewController = pageViewController else { return }
        view.addSubview(pageViewController.controllerView)
        pageViewController.controllerView.edgesToSuperview()
    }
    
    private func addPageControl() {
        view .addSubview(pageControl)
        pageControl.topToSuperview(offset: 20, usingSafeArea: true)
        pageControl.centerXToSuperview()
        pageControl.height(44)
        pageControl.width(120)
    }
}

// MARK: - ConfigureContents
extension MainViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        pageControl.numberOfPages = viewControllers.count
        print(viewControllers.count)
//        pageControl.backgroundColor = .red
    }
    
    private func configurePageViewController() {
//        let home1 = HomeBuilder.make(data: HomeData(cityName: "Diyarbakir",
//                                                    today: "Persembe, 20:00",
//                                                    image: UIImage(named: "cloudy")!,
//                                                    temperature: "22 ºC",
//                                                    info: "Parcali Bulutlu"))
//        
//        let home2 = HomeBuilder.make(data: HomeData(cityName: "Ankara",
//                                      today: "Persembe, 20:00",
//                                      image: UIImage(named: "cloudy")!,
//                                      temperature: "22 ºC",
//                                      info: "Bulutlu"))
//        
//        let home3 = HomeBuilder.make(data: HomeData(cityName: "Siirt",
//                                      today: "Persembe, 20:00",
//                                      image: UIImage(named: "cloudy")!,
//                                      temperature: "22 ºC",
//                                      info: "Gunesli"))
//        
//        
//        let home4 = HomeBuilder.make(data: HomeData(cityName: "Mardin",
//                                      today: "Persembe, 20:00",
//                                      image: UIImage(named: "cloudy")!,
//                                      temperature: "22 ºC",
//                                      info: "Parcali Bulutlu"))
//        pageViewController = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
//        pageViewController?.allViewControllers([home1, home2, home3, home4])
        
    }
}
