//
//  HPCollectionViewCell.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/26.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class HPCollectionViewCell: UICollectionViewCell {
//MARK: - StaticConstant
    static let kItemSpace           = CGFloat(7);
    static let kItemSpaceSmall      = CGFloat(5);
    
    
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.backgroundColor = BIUColorWhite;
        
        self.clipsToBounds = false;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = BIUColorLineBorder.CGColor;
        
        
        self.addSubview(self.imageView);
        self.addSubview(self.titleLabel);
        self.addSubview(self.progressLabel);
        self.addSubview(self.progressView);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//MARK: - LazyLoad
    lazy var imageView: UIImageView = {
        let tempImageView = UIImageView();
        tempImageView.frame = CGRectMake(0, 0, DIViewWidth(self), DIViewWidth(self));
        
        tempImageView.backgroundColor = BIUColorBackground;
        
        return tempImageView;
    }();
    
    lazy var titleLabel: UILabel = {
        let tempLabel = UILabel();
        tempLabel.frame = CGRectMake(kItemSpace,
                                     DIViewBottom(self.imageView) + kItemSpace,
                                     DIViewWidth(self) - kItemSpace * 2,
                                     BIULabelHeightHeadLine);
        
        tempLabel.font = BIUFontTextHeadLine;
        tempLabel.textColor = BIUColorTextHeadline;
        
        return tempLabel;
    }();
    
    lazy var progressLabel: UILabel = {
        let tempLabel = UILabel();
        tempLabel.frame = CGRectMake(kItemSpace,
                                     DIViewBottom(self.titleLabel) + BIUSpaceSmallest,
                                     DIViewWidth(self) - kItemSpace * 2,
                                     BIULabelHeightDescribe);
        
        tempLabel.font = BIUFontTextDescribe;
        tempLabel.textColor = BIUColorRed;
        
        return tempLabel;
    }();
    
    lazy var progressView: BIUProgressView = {
        let tempView = BIUProgressView();
        tempView.frame = CGRectMake(kItemSpace,
                                    DIViewBottom(self.progressLabel) + kItemSpaceSmall,
                                    DIViewWidth(self) - kItemSpace * 2,
                                    BIUSpaceSmall);

        tempView.progressValue = 0.5;
        return tempView;
    }();
}
