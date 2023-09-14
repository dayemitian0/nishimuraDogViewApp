//
//  DogPagingPageViewController.swift
//  DogViewApp_School
//
//  Created by user on 2023/09/14.
//

import UIKit
import AlamofireImage // 画像をきゃっしゅして使うためにライブラリ使用

class DogPagingPageViewController: UIPageViewController , UIGestureRecognizerDelegate{

    var pagingDogImageList: [DogImageData] = [DogImageData(urlString: "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg")]
    var index: Int = 0

    var pageControl: UIPageControl!

    var singleDogImageViewController: SingleDogImageViewController?
    
    var pagingViewController: SingleDogImageViewController?
    let pagingViewControlleridentifier = "SingleDogImageViewController"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.pageControl = UIPageControl()
        
        // Do any additional setup after loading the view.
        self.setUpPagingView()
    }
    
    private func setUpPagingView() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let singleDogImageViewController = storyBoard.instantiateViewController(withIdentifier: pagingViewControlleridentifier) as? SingleDogImageViewController else {
            return
        }
        
        self.setViewControllers([singleDogImageViewController], direction: .forward, animated: true)
                
        if !self.pagingDogImageList.isEmpty {
            let dogImageData = self.pagingDogImageList[self.index]
            if let dogImageUrl = URL(string: dogImageData.urlString) {
                singleDogImageViewController.dogImageView.af.setImage(withURL: dogImageUrl)
            }
        }
        
    }

}

extension DogPagingPageViewController: UIPageViewControllerDataSource {

    // ひとつ前のページを返すDelegateメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let prevPageIndex = pageControl.currentPage - 1
            
        if prevPageIndex < 0 {
            return nil
        }
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: pagingViewControlleridentifier) as? SingleDogImageViewController else {
            return nil
        }
        
        // viewの読み込みをして実体化する
        viewController.loadViewIfNeeded()

        if !self.pagingDogImageList.isEmpty {
            let dogImageData = self.pagingDogImageList[0]
            if let dogImageUrl = URL(string: dogImageData.urlString) {
                viewController.dogImageView.af.setImage(withURL: dogImageUrl)
            }
        }
        
        return viewController
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: pagingViewControlleridentifier) as? SingleDogImageViewController else {
            return nil
        }
        let afterPageIndex = pageControl.currentPage + 1

        if self.pagingDogImageList.count < afterPageIndex {
            return nil
        }
        
        // viewの読み込みをして実体化する
        viewController.loadViewIfNeeded()
        
        if !self.pagingDogImageList.isEmpty {
            let dogImageData = self.pagingDogImageList[0]
            if let dogImageUrl = URL(string: dogImageData.urlString) {
                viewController.dogImageView.af.setImage(withURL: dogImageUrl)
            }
        }

        return viewController
    }
   
}
