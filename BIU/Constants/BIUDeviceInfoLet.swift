//
//  BIUDeviceInfoLet.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/24.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

/**
 *  System version
 */
let DISystemVersion                 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue;
let DIIsiOS7                        = DISystemVersion >= 7.0;
let DIIsiOS8                        = DISystemVersion >= 8.0;
let DIIsiOS9                        = DISystemVersion >= 9.0;

/**
 *  各个尺寸逻辑分辨率的宽高
 */
let DIScreenWidth3_5                = CGFloat(320.0);
let DIScreenWidth4_0                = CGFloat(320.0);
let DIScreenWidth4_7                = CGFloat(375.0);
let DIScreenWidth5_5                = CGFloat(414.0);

let DIScreenHeight3_5               = CGFloat(480.0);
let DIScreenHeight4_0               = CGFloat(568.0);
let DIScreenHeight4_7               = CGFloat(667.0);
let DIScreenHeight5_5               = CGFloat(736.0);

/**
 *  屏幕尺寸
 */
let DIIs3_5Inches                   = (DIScreenHeight == DIScreenHeight3_5);
let DIIs4_0Inches                   = (DIScreenHeight == DIScreenHeight4_0);
let DIIs4_7Inches                   = (DIScreenHeight == DIScreenHeight4_7);
let DIIs5_5Inches                   = (DIScreenHeight == DIScreenHeight5_5);

/**
 *  屏幕大小，导航栏高度等默认值
 */
let DIScreenWidth                   = UIScreen.mainScreen().bounds.size.width;
let DIScreenHeight                  = UIScreen.mainScreen().bounds.size.height;
let DIStatusBarHeight               = CGFloat(20.0);
let DINavigationBarHeight           = CGFloat(44.0);
let DITabBarHeight                  = CGFloat(49.0);
let DIStatusNavBarHeight            = CGFloat(64.0);
let DIMainHeight                    = UIScreen.mainScreen().bounds.size.height - DIStatusNavBarHeight;
let DIMainWidth                     = DIScreenWidth;

/**
 *  以4.7寸为基准的缩放比例
 */
func DIWidthFrom4_7(width: CGFloat) -> CGFloat {
    if DIIs3_5Inches {
        return width * DIScreenWidth3_5 / DIScreenWidth4_7;
    }
    
    if DIIs4_0Inches {
        return width * DIScreenWidth4_0 / DIScreenWidth4_7;
    }
    
    if DIIs5_5Inches {
        return width * DIScreenWidth5_5 / DIScreenWidth4_7;
    }
    
    return width;
}

func DIHeightFrom4_7(height: CGFloat) -> CGFloat {
    if DIIs3_5Inches {
        return height * DIScreenHeight3_5 / DIScreenHeight4_7;
    }
    
    if DIIs4_0Inches {
        return height * DIScreenHeight4_0 / DIScreenHeight4_7;
    }
    
    if DIIs5_5Inches {
        return height * DIScreenHeight5_5 / DIScreenHeight4_7;
    }
    
    return height;
}

/**
 *  View
 */
func DIViewWidth(view: UIView) -> CGFloat {
    return view.frame.size.width;
}

func DIViewHeight(view: UIView) -> CGFloat {
    return view.frame.size.height;
}

func DIViewX(view: UIView) -> CGFloat {
    return view.frame.origin.x;
}

func DIViewY(view: UIView) -> CGFloat {
    return view.frame.origin.y;
}

func DIViewLeft(view: UIView) -> CGFloat {
    return view.frame.origin.x;
}

func DIViewRight(view: UIView) -> CGFloat {
    return CGRectGetMaxX(view.frame);
}

func DIViewTop(view: UIView) -> CGFloat {
    return view.frame.origin.y;
}

func DIViewBottom(view: UIView) -> CGFloat {
    return CGRectGetMaxY(view.frame);
}

        