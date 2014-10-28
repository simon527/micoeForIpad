//
//  micTabbarView.m
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "micTabbarView.h"

#define TABWIDTH    1024

@implementation micTabbarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        showViewTag = 300;
        UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        [bg setImage:[UIImage imageNamed:@"customTabbar"]];
        [self addSubview:bg];
        
        btn_wodegongcheng = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_wodegongcheng setTag:310];
        [btn_wodegongcheng setImage:[UIImage imageNamed:@"wodegongcheng_h"] forState:UIControlStateNormal];
        [btn_wodegongcheng setImage:[UIImage imageNamed:@"wodegongcheng_h_on"] forState:UIControlStateSelected];
        [btn_wodegongcheng setFrame:CGRectMake(0, 0, TABWIDTH/4, 49)];
        [btn_wodegongcheng addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_wodegongcheng];
        
        btn_wentifankui = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_wentifankui setTag:311];
        [btn_wentifankui setImage:[UIImage imageNamed:@"wentifankui_h"] forState:UIControlStateNormal];
        [btn_wentifankui setImage:[UIImage imageNamed:@"wentifankui_h_on"] forState:UIControlStateSelected];
        [btn_wentifankui setFrame:CGRectMake(0 + TABWIDTH/4*1, 0, TABWIDTH/4, 49)];
        [btn_wentifankui addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_wentifankui];
        
        btn_sijimuge = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_sijimuge setTag:312];
        [btn_sijimuge setImage:[UIImage imageNamed:@"gongchengtianqi_h"] forState:UIControlStateNormal];
        [btn_sijimuge setImage:[UIImage imageNamed:@"gongchengtianqi_h_on"] forState:UIControlStateSelected];
        [btn_sijimuge setFrame:CGRectMake(0 + TABWIDTH/4*2, 0, TABWIDTH/4, 49)];
        [btn_sijimuge addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_sijimuge];
        
        btn_shezhi = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_shezhi setTag:313];
        [btn_shezhi setImage:[UIImage imageNamed:@"shezhi_h"] forState:UIControlStateNormal];
        [btn_shezhi setImage:[UIImage imageNamed:@"shezhi_h_on"] forState:UIControlStateSelected];
        [btn_shezhi setFrame:CGRectMake(0 + TABWIDTH/4*3, 0, TABWIDTH/4, 49)];
        [btn_shezhi addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_shezhi];
        
        btn_wodegongcheng.selected = YES;
        
    }
    return self;
}

- (void)tabBarButtonPressed:( UIButton *)sender{
    
    if ([RbtCommonTool getJinRuMode] == LiXianGongCheng) {
        [RbtCommonTool showInfoAlert:@"请登录后查看"];
    }
    else{
        [self setSelectBtn:sender.tag];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"tabbarpressed" object:[NSString stringWithFormat:@"%d", sender.tag] userInfo:nil];
        
        showViewTag = sender.tag - 10;
        
    }
}

- (void)popVc{
    //    UIViewController *vc = [self viewController];
    //    if (![vc isMemberOfClass:[RbtGongChengDaoHangViewController class]]) {
    //        [vc.navigationController popViewControllerAnimated:YES];
    //    }
    
}

- (void)setSelectBtn:(NSInteger) btnTag{
    [btn_wodegongcheng setSelected:NO];
    [btn_wentifankui setSelected:NO];
    [btn_sijimuge setSelected:NO];
    [btn_shezhi setSelected:NO];
    
    UIButton *sender = (UIButton *)[self viewWithTag:btnTag];
    [sender setSelected:YES];
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
@end
