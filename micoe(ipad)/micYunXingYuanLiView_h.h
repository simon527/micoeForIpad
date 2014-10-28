//
//  micYunXingYuanLiView_h.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "micWDGCView.h"

#import "micYLT903-I.h"
#import "micYLT903-II.h"
#import "micYLT905.h"
#import "micYLT906.h"
#import "micYLT906-2.h"

@interface micYunXingYuanLiView_h : micWDGCView{
    float IphoneGap;
    int viewTag;
    
    micYLT903_I *YLT903_I;
    micYLT903_II *YLT903_II;
    micYLT905 *YLT905;
    micYLT906 *YLT906;
    micYLT906_2 *YLT906_2;
    
    UILabel *timeLabel;

}

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) NSString *yltName;

@property (strong, nonatomic) NSDictionary *yltDic;

@end
