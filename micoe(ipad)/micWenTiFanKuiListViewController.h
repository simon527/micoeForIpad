//
//  micWenTiFanKuiListViewController.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtBaseViewController.h"
#import "RbtTabViewController.h"
#import "TQMultistageTableView.h"

@interface micWenTiFanKuiListViewController : RbtTabViewController<TQTableViewDataSource,TQTableViewDelegate>

@property (nonatomic ,strong) TQMultistageTableView *mTableView;
@property (nonatomic ,strong) NSArray *arr_wenTiList;
@property (nonatomic,strong) NSMutableArray *arr_cellDetail;

@end
