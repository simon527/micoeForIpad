//
//  RbtYLT906-V.h
//  RedBudTek
//
//  Created by Simon on 13-12-3.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDRadialProgressView.h"
#import "RbtYLTView.h"

@interface RbtYLT906_2 : RbtYLTView<UIGestureRecognizerDelegate>
{
    UIImageView *imageView_T5;
    UIImageView *imageView_TX;
    UIImageView *imageView_P42;
    UIImageView *imageView_P52;
    UIImageView *imageView_P41;
    UIImageView *imageView_P51;
    UIImageView *imageView_T4;
    UIImageView *imageView_DDF2;
    UIImageView *imageView_P3;
    UIImageView *imageView_EH4;
    UIImageView *imageView_DDF1;
    UIImageView *imageView_EH3;
    UIImageView *imageView_T2;
    UIImageView *imageView_P2;
    UIImageView *imageView_linyuqi;
    UIImageView *imageView_T1_4;
    UIImageView *imageView_jireqi4;
    UIImageView *imageView_P1_4;
    //    UIImageView *imageView_EH5;
    UIImageView *imageView_T1_3;
    UIImageView *imageView_jireqi3;
    UIImageView *imageView_P1_3;
    //    UIImageView *imageView_EH4;
    UIImageView *imageView_T1_2;
    UIImageView *imageView_jireqi2;
    UIImageView *imageView_P1_2;
    //    UIImageView *imageView_EH3;
    UIImageView *imageView_qiufa;
    UIImageView *imageView_T1;
    UIImageView *imageView_jireqi1;
    UIImageView *imageView_P1;
    UIImageView *imageView_EH2;
    UIImageView *imageView_T3;

    
    UIView *W1_SLabelView;
    
    MDRadialProgressView *W_S1View;
    UILabel *W1_Slabel;
    UILabel *T1_Slabel;
}

-(void)setStatus;

@end
