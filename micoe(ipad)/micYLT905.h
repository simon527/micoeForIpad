//
//  micYLT905.h
//  micoe(ipad)
//
//  Created by Simon_Tang on 14-4-18.
//  Copyright (c) 2014年 Simon. All rights reserved.
//

#import "RbtYLTView.h"

@interface micYLT905 : RbtYLTView<UIGestureRecognizerDelegate>
{
//    UIImageView *imageView_P5b;
//    UIImageView *imageView_P5;
//    UIImageView *imageView_linyuqi;
//    UIImageView *imageView_yalichuanganqi;
//    UIImageView *imageView_yaliguan;
//    UIImageView *imageView_danxiangfa;
//    UIImageView *imageView_T1;
//    UIImageView *imageView_T5;
//    UIImageView *imageView_E3;
//    UIImageView *imageView_P2;
//    UIImageView *imageView_P2b;
//    UIImageView *imageView_jireqi;
//    UIImageView *imageView_dianguolu;
//    UIImageView *imageView_T2;
//    UIImageView *imageView_P3;
//    UIImageView *imageView_P3b;
//    UIImageView *imageView_T4;
//    UIImageView *imageView_paikongshuixiang;
//    UIImageView *imageView_P4;
//    UIImageView *imageView_P4b;
//    UIImageView *imageView_P1;
//    UIImageView *imageView_P1b;
//    UIImageView *imageView_E2;
//    UIImageView *imageView_E5;
//    UIImageView *imageView_E4;
//    UIImageView *imageView_E1;
//    UIImageView *imageView_EH2;
    
    UIView *W1_SLabelView;
    UIView *W2_SLabelView;
    
    UILabel *W1_Slabel;
    UILabel *T1_Slabel;
    UILabel *W2_Slabel;
    UILabel *T2_Slabel;
    
    MDRadialProgressView *W_S1View;
    MDRadialProgressView *W_S2View;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView_P5b;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P5;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_linyuqi;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_yalichuanganqi;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_yaliguan;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_danxiangfa;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T5;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P2b;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_jireqi;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_dianguolu;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P3b;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_T4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_paikongshuixiang;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P4b;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_P1b;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E5;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E4;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_E1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_EH2;

-(void)setStatus;

@end
