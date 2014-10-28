//
//  micYunXingYuanLIView.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-17.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "micWDGCView.h"
#import "RbtYLT903-I.h"
#import "RbtYLT903-II.h"
#import "RbtYLT906-2.h"
#import "RbtYLT906.h"
#import "RbtYLT905.h"



@interface micYunXingYuanLiView : micWDGCView
{
    float IphoneGap;
    int viewTag;
    
    RbtYLT903_I *YLT903_I;
    RbtYLT903_II *YLT903_II;
    RbtYLT905 *YLT905;
    RbtYLT906 *YLT906;
    RbtYLT906_2 *YLT906_2;
    
    UILabel *timeLabel;

}

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) NSString *yltName;

@property (strong, nonatomic) NSDictionary *yltDic;

@end
