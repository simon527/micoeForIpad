//
//  RbtYLT903-I-H.h
//  RedBudTek
//
//  Created by Simon on 13-12-3.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtYLTView.h"
#import "MDRadialProgressView.h"


@interface RbtYLT903_I : RbtYLTView<UIGestureRecognizerDelegate>
{
    UIImageView *imageView_P2;
    UIImageView *imageView_EH4;
    UIImageView *imageView_paiqifa;
    UIImageView *imageView_EH3;
    UIImageView *imageView_T3;
    UIImageView *imageView_T2;
    UIImageView *imageView_T5;
    UIImageView *imageView_E1;
    UIImageView *imageView_X;
    UIImageView *imageView_zengyabeng;
    UIImageView *imageView_EH2;
    UIImageView *imageView_E2;
    UIImageView *imageView_T4;
    UIImageView *imageView_EH1;
    
    UIView *W1_SLabelView;
    
    MDRadialProgressView *W_S1View;
    UILabel *W1_Slabel;
    UILabel *T1_Slabel;

}

-(void)setStatus;

@end
