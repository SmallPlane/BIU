//
//  BIUPersonalCenterViewController.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/27.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class BIUPersonalCenterViewController: UIViewController, UITableViewDelegate {

    var _headerBackgroundViewHeight: CGFloat? = DIHeightFrom4_7(275.0);
    var headerBackgroundViewHeight: CGFloat? {
        get {
            return _headerBackgroundViewHeight;
        }
        set(newValue) {
            _headerBackgroundViewHeight = newValue;
            
            self.headerBackgroundView.frame = CGRectMake(0, 0, DIViewWidth(self.view), _headerBackgroundViewHeight!);
            
            self.headerView.frame = CGRectMake(0,
                                               0,
                                               DIViewWidth(self.view),
                                               _headerBackgroundViewHeight! - DIStatusNavBarHeight);
            
            self.tableView.tableHeaderView = self.headerView;
        }
    }
    
    
    var _headerBackgroundImageUrl: NSURL?;
    var headerBackgroundImageUrl: NSURL? {
        get {
            return _headerBackgroundImageUrl;
        }
        set(newValue) {
            _headerBackgroundImageUrl = newValue;
            
//            self.headerBackgroundView.image = 
        }
    };
    
//MARK: - LiftCircle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = BIUColorWhite;
        
        self.view.addSubview(self.headerBackgroundView);
        self.view.addSubview(self.tableView);
        self.tableView.tableHeaderView = self.headerView;
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
//MARK: - LazyLoad
    lazy var tableView: UITableView = {
        let frame = CGRectMake(0,
                               DIStatusNavBarHeight,
                               DIViewWidth(self.view),
                               DIViewHeight(self.view) - DIStatusNavBarHeight);
        
        let tempTableView: UITableView = UITableView(frame: frame, style: UITableViewStyle.Plain);
        tempTableView.backgroundColor = UIColor.clearColor();
        tempTableView.tableHeaderView = self.headerView;
        tempTableView.delegate = self;
        
        return tempTableView;
    }();

    lazy var headerView: UIView = {
        let tempView = UIView();
        tempView.frame = CGRectMake(0, 0, DIViewWidth(self.view), self.headerBackgroundViewHeight! - DIStatusNavBarHeight);
        tempView.backgroundColor = UIColor.clearColor();
        
        return tempView;
    }();
    
    lazy var headerBackgroundView: UIImageView = {
        let tempView = UIImageView();
        tempView.frame = CGRectMake(0, 0, DIViewWidth(self.view), self.headerBackgroundViewHeight!);
        tempView.clipsToBounds = true;
        tempView.contentMode = UIViewContentMode.ScaleAspectFill;
        
        tempView.image = UIImage(named: "home_biu");
        tempView.backgroundColor = BIUColorRed;
        
        return tempView;
    }();
    
//MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;

        if offsetY > _headerBackgroundViewHeight! - DIStatusNavBarHeight {
            self.headerBackgroundView.frame = CGRectMake(0,
                                                         -_headerBackgroundViewHeight! + DIStatusNavBarHeight,
                                                         DIViewWidth(self.view),
                                                         _headerBackgroundViewHeight!);
        }
        else if offsetY > 0 {
            self.headerBackgroundView.frame = CGRectMake(0,
                                                         -offsetY,
                                                         DIViewWidth(self.view),
                                                         _headerBackgroundViewHeight!);
        }
        else {
            self.headerBackgroundView.frame = CGRectMake(0,
                                                         0,
                                                         DIViewWidth(self.view),
                                                         _headerBackgroundViewHeight! - 2 * offsetY);
        }
    }
}
