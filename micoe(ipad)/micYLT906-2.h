//
//  micYLT906-2.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtYLTView.h"

@interface micYLT906_2 : RbtYLTView<UIGestureRecognizerDelegate>
{
//    UIImageView *imageView_T5;
//    UIImageView *imageView_TX;
//    UIImageView *imageView_P42;
//    UIImageView *imageView_P52;
//    UIImageView *imageView_P41;
//    UIImageView *imageView_P51;
//    UIImageView *imageView_T4;
//    UIImageView *imageView_DDF2;
//    UIImageView *imageView_P3;
//    UIImageView *imageView_EH4;
//    UIImageView *imageView_DDF1;
//    UIImageView *imageView_EH3;
//    UIImageView *imageView_T2;
//    UIImageView *imageView_P2;
//    UIImageView *imageView_linyuqi;
//    UIImageView *imageView_T1_4;
//    UIImageView *imageView_jireqi4;
//    UIImageView *imageView_P1_4;
//    UIImageView *imageView_T1_3;
//    UIImageView *imageView_jireqi3;
//    UIImageView *imageView_P1_3;
//    UIImageView *imageView_T1_2;
//    UIImageView *imageView_jireqi2;
//    UIImageView *imageView_P1_2;
//    UIImageView *imageView_qiufa;
//    UIImageView *imageView_T1;
//    UIImageView *imageView_jireqi1;
//    UIImageView *imageView_P1;
//    UIImageView *imageView_EH2;
//    UIImageView *imageView_T3;
    
    
    UIView *W1_SLabelView;
    
    MDRadialProgressView *W_S1View;
    UILabel *W1_Slabel;
    UILabel *T1_Slabel;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView_T5;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_TX;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P42;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P52;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P41;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P51;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_DDF2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_DDF1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_linyuqi;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T1_4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_jireqi4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P1_4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T1_3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_jireqi3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P1_3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T1_2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_jireqi2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P1_2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_qiufa;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_jireqi1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T3;

-(void)setStatus;

@end

