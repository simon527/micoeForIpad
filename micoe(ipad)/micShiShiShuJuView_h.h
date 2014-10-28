//
//  micShiShiShuJuView_h.h
//  micoe(ipad)
//
//  Created by Simon on 14-5-12.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface micShiShiShuJuView_h : UIView<UIScrollViewDelegate>
{
    UIScrollView *sc;
    
    UIPageControl *pageControl;
    
    NSString *yltName;
    
    NSDictionary *dataDic;
    
    NSMutableArray *W_SArray;
    
    NSMutableArray *T_JArray;
    
    NSMutableArray *T_SArray;
    
    NSMutableArray *T_UArray;
    
    NSMutableArray *T_AArray;
    
    NSMutableArray *T_GArray;
    
    NSMutableArray *E_EArray;
    
    NSMutableArray *P_PArray;
    
    NSMutableArray *EH_EHArray;
    
    NSMutableArray *DDF_EArray;
    
    NSMutableArray *T_HArray;
    
    float imageX;
    float imageY;
    
    int imageIndex;
    
    int gap1;
    
    int gap2;
    
    float imageWidth;
    
    float imageHeight;
    float suofangbi;
}

@property (strong, nonatomic) NSTimer *timer;

@end
