//
//  BIUBaseViewController.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/23.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class BIUBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //设置navigation为不透明
        self.navigationController?.navigationBar.translucent = false;
        
        //不要往四周边缘展开
        self.edgesForExtendedLayout = UIRectEdge.None;
        // NO 代表展开的时候不要包含那个导航条
        self.extendedLayoutIncludesOpaqueBars = false;
        
        //设置View背景
        self.view.backgroundColor = UIColor.whiteColor();
        
        //设置状态栏
        self.setStatusBarWhite();
        
        //设置导航栏
        self.setNavigationBackgroundColorRed();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
