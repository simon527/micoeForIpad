//
//  RbtYLT903-II-V.h
//  RedBudTek
//
//  Created by Simon on 13-12-3.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtYLTView.h"
#import "MDRadialProgressView.h"

@interface RbtYLT903_II : RbtYLTView<UIGestureRecognizerDelegate>
{
    UIImageView *imageView_qiufa1;
    UIImageView *imageView_danxiangfa1;
    UIImageView *imageView_EH2;
    UIImageView *imageView_T1;
    UIImageView *imageView_E1;
    UIImageView *imageView_E2;
    UIImageView *imageView_T3;
    UIImageView *imageView_T2;
    UIImageView *imageView_P4;
    UIImageView *imageView_T4;
    UIImageView *imageView_T5;
    UIImageView *imageView_danxiangfa2;
    UIImageView *imageView_qiufa2;
    UIImageView *imageView_P1;
    UIImageView *imageView_P3;
    UIImageView *imageView_P2;
    
    UIImageView *imageViewEH1;
    
    UIView *W1_SLabelView;
    UIView *W2_SLabelView;
    
    UILabel *W1_Slabel;
    UILabel *T1_Slabel;
    UILabel *W2_Slabel;
    UILabel *T2_Slabel;
    
    MDRadialProgressView *W_S1View;
    MDRadialProgressView *W_S2View;
}

-(void)setStatus;

@end
