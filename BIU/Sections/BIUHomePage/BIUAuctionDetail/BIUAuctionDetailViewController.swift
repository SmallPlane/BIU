//
//  BIUAuctionDetailViewController.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/30.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class BIUAuctionDetailViewController: BIUPersonalCenterViewController {
//MARK: - StaticConstant
    static let kLeftButtonWidth                 = CGFloat(27.0);
    static let kLeftButtonHeight                = CGFloat(27.0);
    
//MARK: - LifeCircle    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.headerBackgroundViewHeight = DIMainWidth;
        
        
        self.view.addSubview(self.leftButton);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: - LazyLoad
    lazy var leftButton: UIButton = {
        let tempButton = UIButton(type: UIButtonType.Custom);
        tempButton.frame = CGRectMake(BIUSpaceSmall,
                                      DIStatusBarHeight + BIUSpaceSmallest,
                                      kLeftButtonWidth,
                                      kLeftButtonHeight);
        
        tempButton.setImage((UIImage(named: "public_back_circle")), forState: UIControlState.Normal);
        tempButton.addTarget(self,
                             action: #selector(self.leftBUttonHandle(_:)),
                             forControlEvents: UIControlEvents.TouchUpInside);
        
        return tempButton;
    }();
    
//MARK: - EventResponse
    func leftBUttonHandle(sender: UIButton) -> Void {
        self.navigationController?.popViewControllerAnimated(true);
    }
}
