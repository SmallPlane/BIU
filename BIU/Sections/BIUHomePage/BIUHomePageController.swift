//
//  BIUHomePageController.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/23.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class BIUHomePageController: BIUBaseViewController {
    
    static let kLeftButtonWidth         = CGFloat(65.0);
    static let kRightButtonWidth        = CGFloat(36.0);//icon的宽度是24，两个rightButton默认间距是8

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setLeftBarView(self.leftButton, offset: BIUSpaceSmall);
        
        self.setRightBarViews([self.rightButtonCircle, self.rightButtonSearch], offset: BIUSpaceSmall - 6);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - LazyLoad
    lazy var leftButton: UIButton = {
        let tempButton = UIButton(type: UIButtonType.Custom);
        tempButton.frame = CGRectMake(0, 0, kLeftButtonWidth, DINavigationBarHeight);
        tempButton.setImage(UIImage(named: "home_biu"), forState: UIControlState.Normal);
        
        return tempButton;
    }();
    
    lazy var rightButtonCircle: UIButton = {
        let tempButton = UIButton(type: UIButtonType.Custom);
        tempButton.frame = CGRectMake(0, 0, kRightButtonWidth, DINavigationBarHeight);
        tempButton.setImage(UIImage(named: "home_concentric_circle"), forState: UIControlState.Normal);
        
        return tempButton;
    }();
    
    lazy var rightButtonSearch: UIButton = {
        let tempButton = UIButton(type: UIButtonType.Custom);
        tempButton.frame = CGRectMake(0, 0, kRightButtonWidth, DINavigationBarHeight);
        tempButton.setImage(UIImage(named: "public_search"), forState: UIControlState.Normal);
        
        return tempButton;
    }();
}
