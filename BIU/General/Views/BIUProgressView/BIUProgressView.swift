//
//  BIUProgressView.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/27.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class BIUProgressView: UIView {

    var _progressValue: CGFloat?;
    var progressValue: CGFloat? {
        get {
            return _progressValue;
        }
        set(newValue) {
            _progressValue = newValue;
            self.markerView.frame = CGRectMake(0, 0, self.frame.size.width * newValue!, frame.size.height);
        }
    }
    
    
    
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.addSubview(self.markerView);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if self.frame.size.height != 0 {
            
            self.backgroundColor = BIUColorBackground;
            self.clipsToBounds = false;
            self.layer.cornerRadius = frame.size.height / 2;
            
            self.markerView.frame = CGRectMake(0, 0, frame.size.width * self.progressValue!, frame.size.height);
            self.markerView.layer.cornerRadius = frame.size.height / 2;
        }
    }
    
    
    
//MARK: - LazyLoad
    lazy var markerView: UIView = {
        let tempView = UIView();
        tempView.backgroundColor = BIUColorRed;
        tempView.clipsToBounds = false;
        
        return tempView;
    }();
}
