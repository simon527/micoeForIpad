//
//  RbtTabbarView.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-28.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//1

#import "RbtTabbarView.h"
//#import "RbtGongChengDaoHangViewController.h"

@implementation RbtTabbarView

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
        [btn_wodegongcheng setImage:[UIImage imageNamed:@"wodegongcheng"] forState:UIControlStateNormal];
        [btn_wodegongcheng setImage:[UIImage imageNamed:@"wodegongcheng_on"] forState:UIControlStateSelected];
        [btn_wodegongcheng setFrame:CGRectMake(0, 0, 768/4, 49)];
        [btn_wodegongcheng addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_wodegongcheng];
        
        btn_wentifankui = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_wentifankui setTag:311];
        [btn_wentifankui setImage:[UIImage imageNamed:@"wentifankui"] forState:UIControlStateNormal];
        [btn_wentifankui setImage:[UIImage imageNamed:@"wentifankui_on"] forState:UIControlStateSelected];
        [btn_wentifankui setFrame:CGRectMake(0 + 768/4*1, 0, 768/4, 49)];
        [btn_wentifankui addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_wentifankui];
        
        btn_sijimuge = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_sijimuge setTag:312];
        [btn_sijimuge setImage:[UIImage imageNamed:@"gongchengtianqi"] forState:UIControlStateNormal];
        [btn_sijimuge setImage:[UIImage imageNamed:@"gongchengtianqi_on"] forState:UIControlStateSelected];
        [btn_sijimuge setFrame:CGRectMake(0 + 768/4*2, 0, 768/4, 49)];
        [btn_sijimuge addTarget:self action:@selector(tabBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_sijimuge];
        
        btn_shezhi = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_shezhi setTag:313];
        [btn_shezhi setImage:[UIImage imageNamed:@"shezhi"] forState:UIControlStateNormal];
        [btn_shezhi setImage:[UIImage imageNamed:@"shezhi_on"] forState:UIControlStateSelected];
        [btn_shezhi setFrame:CGRectMake(0 + 768/4*3, 0, 768/4, 49)];
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
