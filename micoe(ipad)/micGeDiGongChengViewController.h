//
//  micGeDiGongChengViewController.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-13.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

//#import "RbtTabViewController.h"
#import "RbtBaseViewController.h"
#import "TSLocateView.h"
#import "EGORefreshTableHeaderView.h"
#import <MapKit/MapKit.h>
#import "micTopTabbarView.h"
#import "micGongChengJianJieViewController.h"

@interface micGeDiGongChengViewController : RbtBaseViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,EGORefreshTableHeaderDelegate,MKMapViewDelegate, topTabbarDelegate,TSLocateViewDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;
    UIView *_refreshFooterView;
    UIActivityIndicatorView *_activityView;
    BOOL _reloading;
    BOOL isMore;
    
    int selectIndex;
    
    BOOL isAlertShow;//控制alert只显示一次
}

@property(strong,nonatomic) UIView *kehuleixing_XialaView;
@property(strong,nonatomic) UITableView *tableView;
@property(strong,nonatomic) NSMutableArray *arr_Projects;
@property(strong,nonatomic) NSMutableArray *arr_OriginProjects;
@property(strong,nonatomic) UISearchBar *searchBar;
@property(strong,nonatomic) NSMutableArray *arr_LiuLanProjects;
@property(assign,nonatomic) BOOL isLishijilu;
@property(assign,nonatomic) NSInteger h;
@property (nonatomic,strong)MKMapView *myMapView;
@property(nonatomic,copy) NSString *gonggProjectPid;

@property(strong,nonatomic) TSLocateView *citySheetView;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
