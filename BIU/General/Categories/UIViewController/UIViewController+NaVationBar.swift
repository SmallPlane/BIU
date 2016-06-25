//
//  UIViewController+NaVationBar.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/23.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

extension UIViewController {
    
//MARK: - 设置Navigation的Title
    /**
     设置导航的title(default font blodSystem:18 textClor:white)
     
     - parameter title: 导航的文本
     */
    func setNavigationTitleWhite(title: NSString) -> Void {
        self.setNavigationTitle(title, titleColor: BIUColorWhite);
    }
    
    /**
     设置导航的黑色title(default font blodSystem:18 textClor:blank)
     
     - parameter title: 导航的文本
     */
    func setNavigationTitleBlank(title: NSString) -> Void {
        self.setNavigationTitle(title, titleColor: BIUColorTextHeadline);
    }
    
    /**
     设置导航的title
     
     - parameter title:      导航的文本
     - parameter titleColor: 导航文本的颜色
     */
    func setNavigationTitle(title: NSString, titleColor: UIColor) -> Void {
        self.setNavigationTitle(title, titleColor: titleColor, titleFont: BIUFontNavigationBold);
    }
    
    /**
     设置导航的title
     
     - parameter title:      导航的文本
     - parameter titleColor: 导航文本的颜色
     - parameter titleFont:  导航的字体
     */
    func setNavigationTitle(title: NSString, titleColor: UIColor, titleFont: UIFont) -> Void {
        self.navigationItem.title = title as String;
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: titleColor,
            NSFontAttributeName : titleFont,
        ];
    }
    
    
    
//MARK: - 设置Navigtion的背景色
    /**
     设置导航的颜色, 默认颜色:BIUColorRed, 默认没有下面的线
     */
    func setNavigationBackgroundColorRed() -> Void {
        self.setNavigationBackgroundColor(BIUColorRed, shadowLineHidden: false);
    }
    
    /**
     设置导航的颜色, 默认没有下面的线
     
     - parameter backgroundColor: 导航的颜色
     */
    func setNavigationBackgroundColor(backgroundColor: UIColor) -> Void {
        self.setNavigationBackgroundColor(backgroundColor, shadowLineHidden: false);
    }
    
    /**
     设置导航的颜色
     
     - parameter color:            导航的颜色
     - parameter shadowLineHidden: 是否隐藏下面的线
     */
    func setNavigationBackgroundColor(backgroundColor: UIColor, shadowLineHidden: Bool) -> Void {
        let backgroundImage = UIImage.imageWithColor(backgroundColor,
                                                     size: CGSizeMake(DIMainWidth, DIStatusNavBarHeight));
        
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImage,
                                                                    forBarMetrics: UIBarMetrics.Default);
        
        var shadowImage: UIImage = UIImage();
        if !shadowLineHidden {
            shadowImage = UIImage.imageWithColor(BIUColorLineShadow,
                                                 size: CGSizeMake(DIMainWidth, 0.5));
        }
        
        self.navigationController?.navigationBar.shadowImage = shadowImage;
    }
    
//MARK: - 设置Navigtion的LeftBarView
    /**
     设置返回按钮，给一个默认的Button
     */
    func setLeftBarButton() -> Void {
        let leftBarButton = UIButton.init(type: UIButtonType.Custom);
        leftBarButton.frame = CGRectMake(0, 0, DINavigationBarHeight, DINavigationBarHeight);
        leftBarButton.backgroundColor = UIColor.whiteColor();
        leftBarButton.exclusiveTouch = true;
        
        self.setLeftBarView(leftBarButton);
    }
    
    /**
     设置左视图
     
     - parameter view: 自定义的视图
     */
    func setLeftBarView(view: UIView) -> Void {
        self.setLeftBarView(view, offset: 0);
    }
    
    /**
     设置左视图
     
     - parameter view:   自定义的视图
     - parameter offset: 左边距
     */
    func setLeftBarView(view: UIView, offset: CGFloat) -> Void {
        self.setLeftBarViews([view], offset: offset);
    }
    
    /**
     设置左视图
     
     - parameter views: 自定义的视图数组
     */
    func setLeftBarViews(views: NSArray) -> Void {
        self.setLeftBarViews(views, offset: 0);
    }
    
    /**
     设置左视图
     
     - parameter views:  自定义的视图数组
     - parameter offset: 左边距
     */
    func setLeftBarViews(views: NSArray, offset: CGFloat) -> Void {
        var barButtonItems = [UIBarButtonItem]();
        
        barButtonItems.append(self.spacer(offset));
        
        for view in views {
            let barButtonItem = UIBarButtonItem(customView: view as! UIView);
            barButtonItems.append(barButtonItem);
        }
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItems = barButtonItems;
    }
//MARK: - 设置Navigtion的RightBarView
    func setRightBarView(view: UIView) -> Void {
        self.setRightBarView(view, offset: 0);
    }
    
    func setRightBarView(view: UIView, offset: CGFloat) -> Void {
        self.setRightBarViews([view], offset: offset);
    }
    
    func setRightBarViews(views: NSArray) -> Void {
        self.setRightBarViews(views, offset: 0);
    }
    
    func setRightBarViews(views: NSArray, offset: CGFloat) -> Void {
        var barButtonItems = [UIBarButtonItem]();
        
        barButtonItems.append(self.spacer(offset));
        
        for view in views {
            let barButtonItem = UIBarButtonItem(customView: view as! UIView);
            barButtonItems.append(barButtonItem);
        }
        
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItems = barButtonItems;
    }
    
//MARK: - Methods
    func spacer(margin: CGFloat) -> UIBarButtonItem {
        let spaceBar = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil);
        
        if DIIs5_5Inches {
            spaceBar.width = margin - 20.0;
        }
        else {
            spaceBar.width = margin - 16.0;
        }
        
        return spaceBar;
    }
}