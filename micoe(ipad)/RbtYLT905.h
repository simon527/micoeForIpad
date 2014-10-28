//
//  RbtYLT905-H.h
//  RedBudTek
//
//  Created by Simon on 13-12-3.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDRadialProgressView.h"
#import "RbtYLTView.h"

@interface RbtYLT905 : RbtYLTView<UIGestureRecognizerDelegate>
{
    UIImageView *imageView_P5b;
    UIImageView *imageView_P5;
    UIImageView *imageView_linyuqi;
    UIImageView *imageView_yalichuanganqi;
    UIImageView *imageView_yaliguan;
    UIImageView *imageView_danxiangfa;
    UIImageView *imageView_T1;
    UIImageView *imageView_T5;
    UIImageView *imageView_E3;
    UIImageView *imageView_P2;
    UIImageView *imageView_P2b;
    UIImageView *imageView_jireqi;
    UIImageView *imageView_dianguolu;
    UIImageView *imageView_T2;
    UIImageView *imageView_P3;
    UIImageView *imageView_P3b;
    UIImageView *imageView_T4;
    UIImageView *imageView_paikongshuixiang;
    UIImageView *imageView_P4;
    UIImageView *imageView_P4b;
    UIImageView *imageView_P1;
    UIImageView *imageView_P1b;
    UIImageView *imageView_E2;
    UIImageView *imageView_E5;
    UIImageView *imageView_E4;
    UIImageView *imageView_E1;
    UIImageView *imageView_EH2;
    
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
