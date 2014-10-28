//
//  micSettingViewController.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtBaseViewController.h"
#import "micxiugaimimaView.h"
#import "micxiugaiURLView.h"

@interface micSettingViewController : RbtBaseViewController<micxiugaimimaViewDelegate>
{
    UIView *shezhi;
    micxiugaimimaView *xgmm;
    micxiugaiURLView *xgurl;
}

-(void)setItemsFrame:(UIInterfaceOrientation)orientation;

@end
