//
//  RbtTabViewController.h
//  RedBudTek
//
//  Created by Simon on 13-11-28.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtBaseViewController.h"
#import "RbtTabbarView.h"
#import "micTabbarView.h"

@interface RbtTabViewController : RbtBaseViewController
{
    int showViewTag;
    
    NSMutableArray *controllersArray;
}

@property (strong, nonatomic) UIButton *btn_wodegongcheng;

@property (strong, nonatomic) UIButton *btn_wentifankui;

@property (strong, nonatomic) UIButton *btn_sijimuge;

@property (strong, nonatomic) UIButton *btn_shezhi;

@property (strong, nonatomic) RbtTabbarView *customTabbar;

@property (strong, nonatomic) micTabbarView *customTabbar_h;

-(void)setTabbarHidden:(BOOL)isHidden;

@end
