//
//  HPHeaderReusableView.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/24.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class HPHeaderReusableView: UICollectionReusableView {
//MARK: - StaticConstant
    static let kBannerViewHeight            = CGFloat(200.0);
    static let kLabelHeight                 = CGFloat(46.0);
    static let kIconWidth                   = CGFloat(18.0);
    static let kIconHeight                  = CGFloat(18.0);
    
    
    
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.addSubview(self.bannerView);
        
        self.addSubview(self.notificationBgView);
        self.notificationBgView.addSubview(self.notificationIconView);
        self.notificationBgView.addSubview(self.notificationLabel);
        
        self.addSubview(self.spaceView);
        
        self.addSubview(self.guessBgView);
        self.guessBgView.addSubview(self.guessIconView);
        self.guessBgView.addSubview(self.guessLabel);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
//MARK: - LazyLoad
    lazy var bannerView: UIView = {
        let tempView = UIView();
        tempView.frame = CGRectMake(0, 0, DIMainWidth, DIHeightFrom4_7(kBannerViewHeight));
        tempView.backgroundColor = BIUColorBackground;
        
        return tempView;
    }();
    
    
    //notificationView
    lazy var notificationBgView: UIView = {
        let tempView = UIView();
        tempView.frame = CGRectMake(0, DIViewBottom(self.bannerView) - kLabelHeight, DIMainWidth, kLabelHeight);
        tempView.backgroundColor = BIUColorWhite;
        
        return tempView;
    }();
    
    lazy var notificationIconView: UIImageView = {
        let tempImageView = UIImageView();
        tempImageView.frame = CGRectMake(BIUSpaceSmallest,
                                         (kLabelHeight - kIconHeight) / 2,
                                         kIconWidth,
                                         kIconHeight);
        
        tempImageView.image = UIImage(named: "home_notification");
        
        return tempImageView;
    }();
    
    lazy var notificationLabel: UILabel = {
        let tempLabel = UILabel();
        tempLabel.frame = CGRectMake(DIViewRight(self.notificationIconView) + BIUSpaceSmall,
                                     0,
                                     DIMainWidth - DIViewRight(self.notificationIconView) - BIUSpaceSmall * 2,
                                     kLabelHeight);
        
        tempLabel.font = BIUFontTextDefault;
        tempLabel.textColor = BIUColorRed;
        
        return tempLabel;
    }();
    
    
    //sapceView
    lazy var spaceView: UIView = {
        let tempView = UIView();
        tempView.frame = CGRectMake(0, DIViewBottom(self.bannerView), DIMainWidth, BIUSpaceSmallest);
        tempView.backgroundColor = BIUColorBackground;
        
        return tempView;
    }();
    
    
    //guessView
    lazy var guessBgView: UIView = {
        let tempView = UIView();
        tempView.frame = CGRectMake(0, DIViewBottom(self.spaceView), DIMainWidth, kLabelHeight);
        tempView.backgroundColor = BIUColorWhite;
        
        return tempView;
    }();
    
    lazy var guessIconView: UIImageView = {
        let tempImageView = UIImageView();
        tempImageView.frame = CGRectMake(BIUSpaceSmallest,
                                         (kLabelHeight - kIconHeight) / 2,
                                         kIconWidth,
                                         kIconHeight);
        
        tempImageView.image = UIImage(named: "home_guess");
        
        return tempImageView;
    }();
    
    lazy var guessLabel: UILabel = {
        let tempLabel = UILabel();
        tempLabel.frame = CGRectMake(DIViewRight(self.guessIconView) + BIUSpaceSmall,
                                     0,
                                     DIMainWidth - DIViewRight(self.guessIconView) - BIUSpaceSmall * 2,
                                     kLabelHeight);
        
        tempLabel.font = BIUFontTextHeadLineBold;
        tempLabel.textColor = BIUColorTextHeadline;
        
        let guessString: NSString = "唯一最低价 ● 竞猜";
        let guessAttributedString = NSMutableAttributedString(string: guessString as String);
        guessAttributedString.addAttribute(NSFontAttributeName,
                                           value: BIUFontTextHeadLineBold,
                                           range: NSMakeRange(0, guessString.length));
        
        guessAttributedString.addAttribute(NSForegroundColorAttributeName,
                                           value: BIUColorRed,
                                           range: NSMakeRange(guessString.length - 2, 2));
        
        tempLabel.attributedText = guessAttributedString;
        
        return tempLabel;
    }();
}
