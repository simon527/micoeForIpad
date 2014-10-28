//
//  micYLT903-II.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RbtYLTView.h"

@interface micYLT903_II : RbtYLTView<UIGestureRecognizerDelegate>
{
//    UIImageView *imageView_qiufa1;
//    UIImageView *imageView_danxiangfa1;
//    UIImageView *imageView_EH2;
//    UIImageView *imageView_T1;
//    UIImageView *imageView_E1;
//    UIImageView *imageView_E2;
//    UIImageView *imageView_T3;
//    UIImageView *imageView_T2;
//    UIImageView *imageView_P4;
//    UIImageView *imageView_T4;
//    UIImageView *imageView_T5;
//    UIImageView *imageView_danxiangfa2;
//    UIImageView *imageView_qiufa2;
//    UIImageView *imageView_P1;
//    UIImageView *imageView_P3;
//    UIImageView *imageView_P2;
//    
//    UIImageView *imageViewEH1;
    
    UIView *W1_SLabelView;
    UIView *W2_SLabelView;
    
    UILabel *W1_Slabel;
    UILabel *T1_Slabel;
    UILabel *W2_Slabel;
    UILabel *T2_Slabel;
    
    MDRadialProgressView *W_S1View;
    MDRadialProgressView *W_S2View;
}

@property (strong, nonatomic) IBOutlet UIImageView *backGroungView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView_qiufa1;

@property (strong, nonatomic) IBOutlet UIImageView *imageView_danxiangfa1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T5;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_danxiangfa2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_qiufa2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P2;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewEH1;

-(void)setStatus;

@end

