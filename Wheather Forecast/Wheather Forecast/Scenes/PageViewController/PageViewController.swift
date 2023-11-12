//
//  PageViewController.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import UIKit

protocol PageViewControllerProtocol: AnyObject {
    var controllerView: UIView! { get set }
    func indexFor(_ viewController: UIViewController) -> Int
    func allViewControllers(_ viewControllers: [UIViewController])
    func selectViewControllerAt(indexPath: IndexPath)
}

final class PageViewController: UIPageViewController {
    
    var controllerView: UIView!
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - UILayout
extension PageViewController {
    
    private func addSubviews() {
        
    }
}

// MARK: - ConfigureContents
extension PageViewController {
    
    private func configureContents() {
        controllerView = view
        guard let viewControllers = viewControllers, !viewControllers.isEmpty else { return }
        setViewControllers([viewControllers[0]], direction: .forward, animated: true)
        delegate = self
        dataSource = self
    }
}

extension PageViewController: PageViewControllerProtocol {
    func indexFor(_ viewController: UIViewController) -> Int {
        return viewControllers?.firstIndex(where: { $0 === viewController }) ?? 0
    }
    
    func allViewControllers(_ viewControllers: [UIViewController]) {
//        guard !viewControllers.isEmpty else { return }
        return setViewControllers([viewControllers[0]], direction: .forward, animated: true)
    }
    
    func selectViewControllerAt(indexPath: IndexPath) {
        guard let viewControllers = viewControllers else { return }
        setViewControllers([viewControllers[indexPath.row]], direction: .forward, animated: true)
    }
    
    
}

// MARK: - UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let viewController = pageViewController.viewControllers?.first {
            if completed {
                let index = viewControllers?.firstIndex(of: viewController)
                print("Page Index: \(String(describing: index))")
            }
        }
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllers?.count ?? 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = viewControllers, let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        guard previousIndex >= 0 else { return viewControllers.last }
        guard viewControllers.count > previousIndex else { return nil }
        return viewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = viewControllers, let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        guard nextIndex < viewControllers.count else { return viewControllers.first }
        guard viewControllers.count > nextIndex else { return nil }
        return viewControllers[nextIndex]
    }
}
