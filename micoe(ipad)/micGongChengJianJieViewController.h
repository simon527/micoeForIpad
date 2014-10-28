//
//  micGongChengJianJieViewController.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-17.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

//#import "RbtTabViewController.h"
#import "micWoDeGongChengViewController.h"
#import "RbtBaseViewController.h"

@interface micGongChengJianJieViewController : RbtBaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    BOOL row2BtnClicked;
    UILabel *jieshaoLabel;
    float labelHeight;
    
    micWoDeGongChengViewController *wdgcVc;
}

@property (strong, nonatomic) UITableView *gcTableView;

@end
