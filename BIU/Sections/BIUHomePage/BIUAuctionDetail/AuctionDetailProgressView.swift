//
//  AuctionDetailProgressView.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/30.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class AuctionDetailProgressView: UIView {
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - LazyLoad
    lazy var titleLabel: UILabel = {
        let tempLabel = UILabel();
        tempLabel.frame = CGRectMake(BIUSpaceSmall, BIUSpaceSmall, DIMainWidth - BIUSpaceSmall * 2, BIULabelHeightHeadLine);
        
        tempLabel.font = BIUFontTextHeadLine;
        tempLabel.textColor = BIUColorTextDefault;
        
        return tempLabel;
    }();
    
    lazy var progressView: BIUProgressView = {
        let tempView = BIUProgressView();
        tempView.frame = CGRectMake(BIUSpaceSmall,
                                    DIViewBottom(self.titleLabel) + BIUSpaceDefault,
                                    DIMainWidth - BIUSpaceSmall * 2,
                                    BIUSpaceSmall);

        return tempView;
    }()
    
//    lazy var 
}
