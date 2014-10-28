//
//  RbtYckzDsViewController.h
//  micoe
//
//  Created by 黄川 on 13-12-23.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtBaseViewController.h"

@class RbtYckzDsViewController;
@protocol RbtDsDelegate <NSObject>
- (void)dsVc:(RbtYckzDsViewController *)dsVc
                  andInfo:(NSDictionary *)info
                   isBack:(BOOL)isback;

@end

@interface RbtYckzDsViewController : RbtBaseViewController{

}

@property(strong,nonatomic) NSString *startTime1;
@property(strong,nonatomic) NSString *endTime1;
@property(strong,nonatomic) NSString *startTime2;
@property(strong,nonatomic) NSString *endTime2;
@property(strong,nonatomic) NSString *startTime3;
@property(strong,nonatomic) NSString *endTime3;


@property (strong,nonatomic) id<RbtDsDelegate> delegate;


- (void)initPickerView;

@end
