//
//  BIUPersonalCenterViewController.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/27.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class BIUPersonalCenterViewController: UIViewController, UITableViewDelegate {

    var headerViewHeight = DIHeightFrom4_7(275.0);
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
//MARK: - LazyLoad
    lazy var tableView: UITableView = {
        let frame = CGRectMake(0, DIStatusNavBarHeight,
                               DIViewWidth(self.view), DIViewHeight(self.view) - DIStatusNavBarHeight);
        
        let tempTableView: UITableView = UITableView(frame: frame, style: UITableViewStyle.Plain);
        tempTableView.backgroundColor = UIColor.clearColor();
        tempTableView.tableHeaderView = self.headerView;
        tempTableView.delegate = self;
        
        return tempTableView;
    }();

    lazy var headerView: UIView = {
        let tempView = UIView();
        tempView.frame = CGRectMake(0, 0, DIViewWidth(self.view), self.headerViewHeight);
        tempView.backgroundColor = UIColor.clearColor();
        
        return tempView;
    }();
    
    
    
//MARK: - UITableViewDelegate
}
