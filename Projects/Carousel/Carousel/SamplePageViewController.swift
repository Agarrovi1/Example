//
//  SamplePageViewController.swift
//  Carousel
//
//  Created by Jocelyn Boyd on 1/14/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

class SamplePageViewController: UIPageViewController {
  
  fileprivate var items: [UIViewController] = [OneViewController(),TwoViewController(),ThreeViewController()]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.init(displayP3Red: 243/250, green: 239/250, blue: 235/250, alpha: 1)
    dataSource = self
    instantiateFirstController()
    // Do any additional setup after loading the view.
  }
  
  fileprivate func instantiateFirstController() {
    if let firstcontroller = items.first {
      setViewControllers([firstcontroller], direction: .forward, animated: true, completion: nil)
    }
  }
  
}
extension SamplePageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = items.firstIndex(of: viewController) else {
      return nil
    }
    
    let previousIndex = viewControllerIndex - 1
    
    guard previousIndex >= 0 else {
      return items.last
    }
    
    guard items.count > previousIndex else {
      return nil
    }
    
    return items[previousIndex]
    
    
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = items.firstIndex(of: viewController) else {
      return nil
    }
    
    let nextIndex = viewControllerIndex + 1
    guard items.count != nextIndex else {
      return items.first
    }
    
    guard items.count > nextIndex else {
      return nil
    }
    
    return items[nextIndex]
  }
  
  func presentationCount(for _: UIPageViewController) -> Int {
    return items.count
  }
  
  func presentationIndex(for _: UIPageViewController) -> Int {
    guard let firstViewController = viewControllers?.first,
      let firstViewControllerIndex = items.firstIndex(of: firstViewController) else {
        return 0
    }
    
    return firstViewControllerIndex
  }
}
