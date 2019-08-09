//
//  LettersViewController.swift
//  SignLearning
//
//  Created by Zain on 09/01/2017.
//  Copyright © 2017 Zain. All rights reserved.
//

import UIKit

class LettersViewController: UIViewController , UIPageViewControllerDataSource{

    
    var pageViewController : UIPageViewController?
    var contentImages : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let arrayClass = ArrayClass()
        if(MainTableViewController.staticVal.index == 16)
        {
            contentImages = arrayClass.a
            MainTableViewController.staticVal.labelArray = arrayClass.aText
        }
        else if(MainTableViewController.staticVal.index == 17)
        {
            contentImages = arrayClass.b
            MainTableViewController.staticVal.labelArray = arrayClass.bText
        }
        else if(MainTableViewController.staticVal.index == 18)
        {
            contentImages = arrayClass.c
            MainTableViewController.staticVal.labelArray = arrayClass.cText
        }
        else if(MainTableViewController.staticVal.index == 19)
        {
            contentImages = arrayClass.d
            MainTableViewController.staticVal.labelArray = arrayClass.dText
        }
        else if(MainTableViewController.staticVal.index == 20)
        {
            contentImages = arrayClass.e
            MainTableViewController.staticVal.labelArray = arrayClass.eText
        }
        else if(MainTableViewController.staticVal.index == 21)
        {
            contentImages = arrayClass.f
            MainTableViewController.staticVal.labelArray = arrayClass.fText
        }
        else if(MainTableViewController.staticVal.index == 22)
        {
            contentImages = arrayClass.g
            MainTableViewController.staticVal.labelArray = arrayClass.gText
        }
        else if(MainTableViewController.staticVal.index == 23)
        {
            contentImages = arrayClass.h
            MainTableViewController.staticVal.labelArray = arrayClass.hText
        }
        else if(MainTableViewController.staticVal.index == 24)
        {
            contentImages = arrayClass.i
            MainTableViewController.staticVal.labelArray = arrayClass.iText
        }
        else if(MainTableViewController.staticVal.index == 25)
        {
            contentImages = arrayClass.j
            MainTableViewController.staticVal.labelArray = arrayClass.jText
        }
        else if(MainTableViewController.staticVal.index == 26)
        {
            contentImages = arrayClass.k
            MainTableViewController.staticVal.labelArray = arrayClass.kText
        }
        else if(MainTableViewController.staticVal.index == 27)
        {
            contentImages = arrayClass.l
            MainTableViewController.staticVal.labelArray = arrayClass.lText
        }
        else if(MainTableViewController.staticVal.index == 28)
        {
            contentImages = arrayClass.m
            MainTableViewController.staticVal.labelArray = arrayClass.mText
        }
        else if(MainTableViewController.staticVal.index == 29)
        {
            contentImages = arrayClass.n
            MainTableViewController.staticVal.labelArray = arrayClass.nText
        }
        else if(MainTableViewController.staticVal.index == 30)
        {
            contentImages = arrayClass.o
            MainTableViewController.staticVal.labelArray = arrayClass.oText
        }
        else if(MainTableViewController.staticVal.index == 31)
        {
            contentImages = arrayClass.p
            MainTableViewController.staticVal.labelArray = arrayClass.pText
        }
        else if(MainTableViewController.staticVal.index == 32)
        {
            contentImages = arrayClass.q
            MainTableViewController.staticVal.labelArray = arrayClass.qText
        }
        else if(MainTableViewController.staticVal.index == 33)
        {
            contentImages = arrayClass.r
            MainTableViewController.staticVal.labelArray = arrayClass.rText
        }
        else if(MainTableViewController.staticVal.index == 34)
        {
            contentImages = arrayClass.s
            MainTableViewController.staticVal.labelArray = arrayClass.sText
        }
        else if(MainTableViewController.staticVal.index == 35)
        {
            contentImages = arrayClass.t
            MainTableViewController.staticVal.labelArray = arrayClass.tText
        }
        else if(MainTableViewController.staticVal.index == 36)
        {
            contentImages = arrayClass.u
            MainTableViewController.staticVal.labelArray = arrayClass.uText
        }
        else if(MainTableViewController.staticVal.index == 37)
        {
            contentImages = arrayClass.v
            MainTableViewController.staticVal.labelArray = arrayClass.vText
        }
        else if(MainTableViewController.staticVal.index == 38)
        {
            contentImages = arrayClass.w
            MainTableViewController.staticVal.labelArray = arrayClass.wText
        }
        else if(MainTableViewController.staticVal.index == 39)
        {
            contentImages = arrayClass.y
            MainTableViewController.staticVal.labelArray = arrayClass.yText
        }

        createPageViewController()
        setupPageControl()
    }

    fileprivate func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewController(withIdentifier: "PageController") as! UIPageViewController
        pageController.dataSource = self
        
        
        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        self.addChild(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParent: self)
    }
    
    fileprivate func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.darkGray
        
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemViewController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemViewController
        
        if itemController.itemIndex+1 < contentImages.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    fileprivate func getItemController(_ itemIndex: Int) -> PageItemViewController? {
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewController(withIdentifier: "ItemController") as! PageItemViewController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    
    
    // MARK: - Page Indicator
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }


}
