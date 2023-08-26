//
//  PageViewController.swift
//  PageViewController
//
//  Created by Jolly BANGUE on 2023-08-25.
//

import UIKit

class PageViewController: UIPageViewController {
    
    lazy var controllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrangeViewController") as! OrangeViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
        ]
    }()
    
    required init?(coder: NSCoder) { /// Creates a page view controller from data in an unarchiver
        super.init(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        setViewControllers([controllers[0]], direction: .forward, animated: false)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentIndex = controllers.firstIndex(of: viewController) {
            if currentIndex > 0 { /// 0 is the index min
                return controllers[currentIndex - 1]
            } else {
                return nil
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentIndex = controllers.firstIndex(of: viewController) {
            if currentIndex < controllers.count - 1 { /// (controllers.count - 1) is the index max
                return controllers[currentIndex + 1]
            } else {
                return nil
            }
        }
        return nil
    }
}
