//
//  micyuanchengkongzhiView.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-10.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtYuanChengSelectView.h"
#import "RbtYuanChengSelectView2.h"
#import "RbtYckzDsView.h"
#import "RbtWebManager.h"
#import "RbtSheBeiView.h"
#import "micWDGCView.h"
#import "RbtYckzDsViewController.h"

@interface micyuanchengkongzhiView : micWDGCView<RbtYuanChengSelectViewDelegate, RbtSheBeiViewDelegate,RbtDsDelegate,RbtYuanChengSelectViewDelegate2>
{
    UIButton *dingshiButton_left;
    UIButton *zidongButton_left;
    UIButton *tingzhiButton_left;
    
    UIButton *dingshiButton_mid;
    UIButton *zidongButton_mid;
    UIButton *tingzhiButton_mid;
    
    UIButton *dingshiButton_right;
    UIButton *zidongButton_right;
    UIButton *tingzhiButton_right;
    
    int showButtonTag;

    RbtSheBeiView *oneSheBei;
    BOOL isSs;
    NSDictionary *timeInfo;
    
    UILabel *timeLab1;
    UILabel *timeLab2;
    UILabel *timeLab3;
    
    UIImageView *timeBgView;
    
    
    UILabel *timeLab1_jr;
    UILabel *timeLab2_jr;
    UILabel *timeLab3_jr;
    
    UIImageView *timeBgView_jr;
    
    BOOL isTime_ss;
    BOOL isTime_jr;
    
    RbtYuanChengSelectView *xiaSelectView;
}

@property(strong,nonatomic) UILabel *lab_controlModel;

@property(strong,nonatomic) RbtYckzDsView *ssDsView;
@property(strong,nonatomic) RbtYckzDsView *jrDsView;
@property(strong,nonatomic) RbtYuanChengSelectView2 *ssSelectView;
@property(strong,nonatomic) RbtYuanChengSelectView2 *jrSelectView;
@property(strong,nonatomic) UIScrollView *sbSelectView;
@property(strong,nonatomic) UILabel *lab_ssDsinfo;
@property(strong,nonatomic) UILabel *lab_jrDsinfo;


@property(strong,nonatomic) NSString *startTime1_ss;
@property(strong,nonatomic) NSString *endTime1_ss;
@property(strong,nonatomic) NSString *startTime2_ss;
@property(strong,nonatomic) NSString *endTime2_ss;
@property(strong,nonatomic) NSString *startTime3_ss;
@property(strong,nonatomic) NSString *endTime3_ss;


@property(strong,nonatomic) NSString *startTime1_jr;
@property(strong,nonatomic) NSString *endTime1_jr;
@property(strong,nonatomic) NSString *startTime2_jr;
@property(strong,nonatomic) NSString *endTime2_jr;
@property(strong,nonatomic) NSString *startTime3_jr;
@property(strong,nonatomic) NSString *endTime3_jr;

-(void)setButtomButtonHidden;

@end
