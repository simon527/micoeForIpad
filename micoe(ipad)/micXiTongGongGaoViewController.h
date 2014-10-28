//
//  micXiTongGongGaoViewController.h
//  micoe(ipad)
//
//  Created by Simon on 14-1-20.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtBaseViewController.h"

@interface micXiTongGongGaoViewController : RbtBaseViewController<UIScrollViewDelegate>{
    UIPageControl *pageControl;
    NSTimer *timer;
}

@property (nonatomic,strong) NSString *htmlString;
@property(strong,nonatomic) UIScrollView *scrollVc;

@end
