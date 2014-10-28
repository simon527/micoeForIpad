//
//  RbtSheBeiView.h
//  RedBudTek
//
//  Created by 黄川 on 13-12-10.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCRoundSwitch.h"
@class RbtSheBeiView;

@protocol RbtSheBeiViewDelegate <NSObject>
- (void)sheBeiViewStateChange:(RbtSheBeiView *)theView;

@end

@interface RbtSheBeiView : UIView

@property (nonatomic,assign) BOOL isOn;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) BOOL iskzsb;

@property (nonatomic,assign) id<RbtSheBeiViewDelegate> delegate;

@property (nonatomic,strong) UIImageView *imagev_Bg;
@property (nonatomic,strong) UIImageView *imagev_sb;
@property (nonatomic,strong) DCRoundSwitch *swi_sb;

- (void)initViews;
- (void)changeState;

@end
