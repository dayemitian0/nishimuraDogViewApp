//
//  SingleDogViewController.swift
//  DogViewApp_School
//
//  Created by user on 2023/09/14.
//

import UIKit
import AlamofireImage // 画像をきゃっしゅして使うためにライブラリ使用

class SingleDogViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageViewController: DogPagingPageViewController?


    

    override func viewDidLoad() {
        super.viewDidLoad()
    /*    self.pageViewController = DogPagingPageViewController()
        pageViewController?.dataSource = self
        pageViewController?.delegate = self

        let setViewController = SingleDogViewController()
        pageViewController?.setViewControllers([setViewController], direction: .forward , animated: true)
        pageViewController?.view.frame = self.view.frame
        
        if let setView = pageViewController?.view {
            self.view.addSubview(setView)
        }
      */
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }

}
