//
//  micJieNengShiTu_h.h
//  micoe(ipad)
//
//  Created by Simon on 14-5-8.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "micWDGCView.h"


@interface micJieNengShiTu_h : micWDGCView
{
    UILabel *timeLabel;
    UILabel *titleLbel;
    UILabel *showLabel;
    UILabel *unitLabel;
    
    UIButton *btn_jireqi;
    UIButton *btn_leijijianpai;
    UIButton *btn_leijijieyue;
    
    UIActionSheet *actionSheet;
    
    NSString *chooseType;
    NSString *chooseTime;
    
    NSString *chooseTypeTag;
    NSString *chooseTimeTag;
    
    UIButton *btn_week;
    UIButton *btn_month;
    UIButton *btn_year;
}

-(void)timeBtnWithTagstr:(NSString *)tagStr;

-(void)jienengBtnWithTagstr:(NSString *)tagStr;

@end
