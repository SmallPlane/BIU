//
//  BIUTabBarController.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/23.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class BIUTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var viewControllerArray = [BIUBaseNavigationController]();
        
        //首页
        let homePageViewController = BIUHomePageController();

        let homePageNavigationController = BIUBaseNavigationController(rootViewController: homePageViewController);
        homePageNavigationController.tabBarItem = UITabBarItem(
            title: "首页",
            image: UIImage(named: "auction_gray")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal),
            selectedImage: UIImage(named: "auction")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal));
        
        viewControllerArray.append(homePageNavigationController);
        
        
        
        //揭晓
        let announceViewController = BIUAnnounceController();
        
        let announceNavigationController = BIUBaseNavigationController(rootViewController: announceViewController);
        announceNavigationController.tabBarItem = UITabBarItem(
            title: "揭晓",
            image: UIImage(named: "announce_gray")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal),
            selectedImage: UIImage(named: "announce")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal));
        
        viewControllerArray.append(announceNavigationController);
        
        
        
        //个人中心
        let myCenterViewController = BIUMyCenterController();
        
        let myCenterNavigationController = BIUBaseNavigationController(rootViewController: myCenterViewController);
        myCenterNavigationController.tabBarItem = UITabBarItem(
            title: "我",
            image: UIImage(named: "me_gray")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal),
            selectedImage: UIImage(named: "me")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal));
        
        viewControllerArray.append(myCenterNavigationController);
        
        
        self.viewControllers = viewControllerArray;
        
        
        //设置tabBar不透明
        let appearanceTabBar = UITabBar.appearance();
        appearanceTabBar.translucent = false;
        
        //设置tabBar字体
        let appearanceTabBarItem = UITabBarItem.appearance();
        appearanceTabBarItem.setTitleTextAttributes([
            NSForegroundColorAttributeName : BIUColorTextDescribe,
            NSFontAttributeName : BIUFontTabBar,
            ],
                                                    forState: UIControlState.Normal);
        
        appearanceTabBarItem.setTitleTextAttributes([
            NSForegroundColorAttributeName : BIUColorTextDefault,
            NSFontAttributeName : BIUFontTabBar,
            ],
                                                    forState: UIControlState.Selected);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
