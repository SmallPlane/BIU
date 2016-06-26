//
//  BIUHomePageController.swift
//  BIU
//
//  Created by Oliver Chen on 16/6/23.
//  Copyright © 2016年 Oliver. All rights reserved.
//

import UIKit

class BIUHomePageController: BIUBaseViewController
    ,UICollectionViewDataSource
    ,UICollectionViewDelegate
    ,UICollectionViewDelegateFlowLayout {
    
//MARK: - StaticConstant
    static let kLeftButtonWidth                 = CGFloat(65.0);
    static let kRightButtonWidth                = CGFloat(36.0);//icon的宽度是24，两个rightButton默认间距是8

//MARK: - LifeCircle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setLeftBarView(self.leftButton, offset: BIUSpaceSmall);
        
        self.setRightBarViews([self.rightButtonCircle, self.rightButtonSearch], offset: BIUSpaceSmall - 6);
        
        
        self.view.addSubview(self.collectionView);
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
    
    
    //collectionView
    lazy var collectionView: UICollectionView = {
        let frame = CGRectMake(0, 0, DIMainWidth, DIMainHeight - DITabBarHeight);
        
        let flowLayout = UICollectionViewFlowLayout();
        flowLayout.minimumLineSpacing = BIUSpaceSmall;
        flowLayout.minimumInteritemSpacing = BIUSpaceSmallest;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, BIUSpaceSmallest, 0, BIUSpaceSmallest);
        
        flowLayout.itemSize = CGSizeMake(DIMainWidth / 2 - BIUSpaceSmallest - BIUSpaceDefault / 2,
                                         DIMainWidth / 2 - BIUSpaceSmallest - BIUSpaceDefault / 2
                                            + HPCollectionViewCell.kItemSpace + BIULabelHeightHeadLine
                                            + BIUSpaceSmallest + BIULabelHeightDescribe
                                            + HPCollectionViewCell.kItemSpaceSmall * 2 + BIUSpaceSmall);
        flowLayout.headerReferenceSize = CGSizeMake(DIMainWidth,
                                                    DIHeightFrom4_7(HPHeaderReusableView.kBannerViewHeight)
                                                        + BIUSpaceSmallest
                                                        + HPHeaderReusableView.kLabelHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical;
        
        
        let tempCollectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout);
        tempCollectionView.backgroundColor = BIUColorWhite;
        tempCollectionView.dataSource = self;
        tempCollectionView.delegate = self;
        tempCollectionView.showsVerticalScrollIndicator = false;
        tempCollectionView.showsHorizontalScrollIndicator = false;
        
        
        tempCollectionView.registerClass(HPCollectionViewCell.self,
                                         forCellWithReuseIdentifier: "HPCollectionViewCellIdentifier");
        
        tempCollectionView.registerClass(HPHeaderReusableView.self,
                                         forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                         withReuseIdentifier: "HPHeaderReusableViewIdentifier");
        
        return tempCollectionView;
    }();
    
    
    
    
//MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    };
    
    
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: HPCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            "HPCollectionViewCellIdentifier",
            forIndexPath: indexPath) as! HPCollectionViewCell;
        
        cell.titleLabel.text = "正宗清远鸡";
        
        let progressString: NSString = "揭晓进度50%";
        let progressAttributedString = NSMutableAttributedString(string: progressString as String);
        progressAttributedString.addAttribute(NSFontAttributeName,
                                           value: BIUFontTextDescribe,
                                           range: NSMakeRange(0, progressString.length));
        
        progressAttributedString.addAttribute(NSForegroundColorAttributeName,
                                           value: BIUColorTextDescribe,
                                           range: NSMakeRange(0, 4));
        
        cell.progressLabel.attributedText = progressAttributedString;
        
        
        return cell;
    }
    
    
    func collectionView(collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerView: HPHeaderReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(
            kind,
            withReuseIdentifier: "HPHeaderReusableViewIdentifier",
            forIndexPath: indexPath) as! HPHeaderReusableView;
        
        let notificationString: NSString = "恭喜 奔跑的汉子 获得lol游戏点卷";
        let notAttributedString = NSMutableAttributedString(string: notificationString as String);
        notAttributedString.addAttribute(NSFontAttributeName,
                                         value: BIUFontTextDefault,
                                         range: NSMakeRange(0, notificationString.length));
        
        notAttributedString.addAttribute(NSForegroundColorAttributeName,
                                         value: BIUColorTextDescribe,
                                         range: NSMakeRange(0, 2));
        
        notAttributedString.addAttribute(NSForegroundColorAttributeName,
                                         value: BIUColorTextDescribe,
                                         range: NSMakeRange(notificationString.length - 9, 9));
        
        headerView.notificationLabel.attributedText = notAttributedString;
        
        
        let guessString: NSString = "唯一最低价 ● 竞猜";
        let guessAttributedString = NSMutableAttributedString(string: guessString as String);
        guessAttributedString.addAttribute(NSFontAttributeName,
                                         value: BIUFontTextHeadLineBold,
                                         range: NSMakeRange(0, guessString.length));
        
        guessAttributedString.addAttribute(NSForegroundColorAttributeName,
                                         value: BIUColorRed,
                                         range: NSMakeRange(guessString.length - 2, 2));
        
        headerView.guessLabel.attributedText = guessAttributedString;
        
        return headerView;
    }
    
//MARK: - UICollectionViewDelegate
}
