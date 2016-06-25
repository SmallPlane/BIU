//
//  UIViewController+StatusBar.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/23.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     设置状态栏为白色
     */
    func setStatusBarWhite() -> Void {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black;
    }
    
    /**
     设置状态栏为黑色
     */
    func setStatusBarBlank() -> Void {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Default;
    }
}
