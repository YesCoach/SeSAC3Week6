//
//  OnboardingViewController.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/25.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }
}

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
    }
}

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .magenta
    }
}

class OnboardingViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    // 1.
    var list: [UIViewController] = []

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = [FirstVC(), SecondVC(), ThirdVC()]
        
        view.backgroundColor = .systemPink
        delegate = self
        dataSource = self

        guard let first = list.first else { return }
        setViewControllers([first], direction: .forward, animated: true)

    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }

        let previousIndex = currentIndex - 1

        return previousIndex < 0 ? nil : list[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }

        let nextIndex = currentIndex + 1

        return nextIndex >= list.count ? nil : list[nextIndex]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first,
              let index = list.firstIndex(of: first)
        else { return 0 }
        return index
    }
}





