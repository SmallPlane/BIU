//
//  BIUUIFormatLet.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/24.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

/**
 *  Color
 */
func BIUGetColorWithRed(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return BIUGetColorWithRed(red, green: green, blue: blue, alpha: 1);
}

func BIUGetColorWithRed(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha);
}

//通用颜色
let BIUColorWhite                   = BIUGetColorWithRed(255, green: 255, blue: 255);
let BIUColorBlank                   = BIUGetColorWithRed(  0, green:   0, blue:   0);
let BIUColorRed                     = BIUGetColorWithRed(233, green:  77, blue:  92);

//文字颜色
let BIUColorTextHeadline            = BIUGetColorWithRed( 33, green:  33, blue:  33);
let BIUColorTextDefault             = BIUGetColorWithRed( 77, green:  77, blue:  77);
let BIUColorTextDescribe            = BIUGetColorWithRed(153, green: 153, blue: 153);
let BIUColorTextLight               = BIUGetColorWithRed(179, green: 179, blue: 179);

//分割线颜色
let BIUColorLineSplit               = BIUGetColorWithRed(224, green: 224, blue: 224);
//tabBar 和 navigation 的分割线
let BIUColorLineShadow              = BIUGetColorWithRed(178, green: 178, blue: 178);

//边框颜色



/**
 *  Font
 */
let BIUFontNavigation               = UIFont.systemFontOfSize(18.0);
let BIUFontNavigationBold           = UIFont.boldSystemFontOfSize(18.0);

let BIUFontTabBar                   = UIFont.systemFontOfSize(10.0);




/**
 *  Space (间隙)
 */
let BIUSpaceDefault                 = CGFloat(15.0);
let BIUSpaceSmall                   = CGFloat(12.0);

