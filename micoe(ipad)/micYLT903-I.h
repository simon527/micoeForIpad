//
//  micYLT903-I.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtYLTView.h"

@interface micYLT903_I : RbtYLTView<UIGestureRecognizerDelegate>
{
//    UIImageView *imageView_P2;
//    UIImageView *imageView_EH4;
//    UIImageView *imageView_paiqifa;
//    UIImageView *imageView_EH3;
//    UIImageView *imageView_T3;
//    UIImageView *imageView_T2;
//    UIImageView *imageView_T5;
//    UIImageView *imageView_E1;
//    UIImageView *imageView_X;
//    UIImageView *imageView_zengyabeng;
//    UIImageView *imageView_EH2;
//    UIImageView *imageView_E2;
//    UIImageView *imageView_T4;
//    UIImageView *imageView_EH1;
    
    UIView *W1_SLabelView;
    
    MDRadialProgressView *W_S1View;
    UILabel *W1_Slabel;
    UILabel *T1_Slabel;
    
}


//@property (strong, nonatomic) IBOutlet UIImageView *
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_paiqifa;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T5;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_X;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_zengyabeng;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH1;

-(void)setStatus;

@end
